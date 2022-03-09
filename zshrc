#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/powerlevel10k/powerlevel10k.zsh-theme
ZSH_THEME="powerlevel10k/powerlevel10k" 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH:"/usr/local/bin/
export NPM_DIR=~/.npm
export NVM_DIR=~/.nvm
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
source $(brew --prefix nvm)/nvm.sh

plugins=(rails git ruby ionic osx z)


alias sites="cd /Volumes/data/Sites"
alias ci="code-insiders ."
alias larastan="./vendor/bin/phpstan analyse --memory-limit=2G"
alias laraclean="php artisan clear-compiled && php artisan cache:clear && php artisan route:clear && php artisan view:clear && php artisan config:clear && composer dumpautoload -o"
alias dev='npm run dev'
alias prd='npm run production'
alias watch='npm run watch'
alias build='npm run build'
alias myip='curl http://ipecho.net/plain; echo'
alias reload='source ~/.zshrc'
alias h='history -E'
alias cs='~/.composer/vendor/bin/php-cs-fixer fix app'
alias info='neofetch'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#### FIG ENV VARIABLES ####
# Please make sure this block is at the end of this file.
[ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh
#### END FIG ENV VARIABLES ####
