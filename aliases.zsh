alias sites="cd /Volumes/data/Sites"
alias projects="cd /Volumes/data/Projects"
alias larastan="./vendor/bin/phpstan analyse --memory-limit=2G"
alias laraclean="php artisan clear-compiled && php artisan cache:clear && php artisan route:clear && php artisan view:clear && php artisan config:clear && composer dumpautoload -o"
alias dev='npm run dev'
alias prd='npm run production'
alias watch='npm run watch'
alias build='npm run build'
#alias myip='curl http://ipecho.net/plain; echo'
alias pint="./vendor/bin/pint -v"
alias reload='source ~/.zshrc'
alias h='history -E'
alias csfix='~/.composer/vendor/bin/php-cs-fixer fix app'
alias info='neofetch'
alias valet=' ~/.composer/vendor/laravel/valet/valet'

alias mkdir="mkdir -pv"
alias shtop='sudo htop'        # run `htop` with root rights
alias grep='grep --color=auto' # colorize `grep` output
alias now='date'               # current time
alias less='less -R'


alias ffs='sudo !!' # An alias to rerun the previous command with sudo
alias -g L='| less'
alias -g G='| grep'
alias df='df -H'
alias du='du -sch'
alias wget='wget -c'
alias x='exit'
alias c='clear'


#   -----------------------------
#   2.2 Tools
#   -----------------------------

if [[ "$OSTYPE" == "darwin"* ]]; then
  alias browser=chrome
  alias intellij='open -a IntelliJ\ IDEA'
  alias chrome='open -a Google\ Chrome'
  alias firefox='open -a Firefox'
  alias opera='open -a Opera'
  alias safari='open -a Safari'
  alias discord='open -a Discord'
  alias teams='open -a Microsoft\ Teams'
fi
if [ -x "$(command -v lazydocker)" ]; then
  alias lzd='lazydocker'
fi

alias ls='exa --icons --group-directories-first'
alias ll='exa -l --icons --no-user --group-directories-first  --time-style long-iso'
alias la='exa -la --icons --no-user --group-directories-first  --time-style long-iso'


#   -------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

alias unzip='extract $*'

function extract() {
  if [ -f $1 ]; then
    case $1 in
      *.tar.bz2) tar xjf $1 ;;
*.tar.gz) tar xzf $1 ;;
*.bz2) bunzip2 $1 ;;
*.rar) unrar e $1 ;;
*.gz) gunzip $1 ;;
*.tar) tar xf $1 ;;
*.tbz2) tar xjf $1 ;;
*.tgz) tar xzf $1 ;;
*.zip) unzip $1 ;;
*.Z) uncompress $1 ;;
*.7z) 7z x $1 ;;
*) echo "'$1' cannot be extracted via extract()" ;;
esac
else
  echo "'$1' is not a valid file"
fi
}

#   -------------------------------
#   4.  NETWORKING
#   -------------------------------

alias ipInfo0='ifconfig en0' # ipInfo0: Get info on connections for en0
alias ipInfo1='ifconfig en1' # ipInfo1: Get info on connections for en1
alias header='curl -I'

function myip() {
  echo "🖥️  Local IP (v4):\t$(ifconfig en0 | grep 'inet ' | awk '{print $2}')"
  echo "🖥️  Local IP (v6):\t$(ifconfig en0 | grep inet6 | awk '{print $2}')"
  echo "🌍 Public IP:\t\t$(curl -s http://ipecho.net/plain)"
}

function listenon() {
  readonly port=${1:?"The port must be specified."}
  lsof -nP -iTCP:$1 | grep LISTEN
}

function killport() {
  readonly port=${1:?"The port must be specified."}
  pids=$(lsof -i tcp:"$port" | grep LISTEN | awk '{print $1,$2}')

  if [ ${#pids[@]} -eq 0 ]; then
    echo "No process on port $port found!"
  else
    for i in "${pids[@]}"; do
      pid=$(echo "$i" | awk '{print $2}')
      name=$(echo "$i" | awk '{print $1}')
      $(kill -9 $pid)
      echo "-> Killed $name ($pid)"
    done
  fi
}

#   -------------------------------
#   5.  OTHER
#   -------------------------------

alias weather='curl v2.wttr.in' # Get weather from v2.wttr.in
if [ -x "$(command -v terminal-notifier)" ]; then
  alias notifyDone='terminal-notifier -title "Terminal" -subtitle "Done with task!" -sound default -message "Exit status: $?" -activate com.googlecode.iterm2'
fi

function ii() {
  echo -e "\nYou are logged on ${RED}$HOST"
  echo -e "\nAdditional information:$NC "
  uname -a
  echo -e "\n${RED}Users logged on:$NC "
  w -h
  echo -e "\n${RED}Current date :$NC "
  date
  echo -e "\n${RED}Machine stats :$NC "
  uptime
  echo -e "\n${RED}Current network location :$NC "
  scselect
  echo -e "\n${RED}Public facing IP Address :$NC "
  myip
  echo
}

# determine versions of PHP installed with HomeBrew
installedPhpVersions=($(brew ls --versions | ggrep -E 'php(@.*)?\s' | ggrep -oP '(?<=\s)\d\.\d' | uniq | sort))

# create alias for every version of PHP installed with HomeBrew
for phpVersion in ${installedPhpVersions[*]}; do
  value="{"

  for otherPhpVersion in ${installedPhpVersions[*]}; do
    if [ "${otherPhpVersion}" = "${phpVersion}" ]; then
      continue
    fi

        # unlink other PHP version
        value="${value} brew unlink php@${otherPhpVersion};"
      done

    # link desired PHP version
    value="${value} brew link php@${phpVersion} --force --overwrite; } &> /dev/null && php -v"

    alias "${phpVersion}"="${value}"
  done
