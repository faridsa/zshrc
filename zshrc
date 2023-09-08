# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

PATH="/usr/local/bin:$PATH"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Herd injected PHP binary.
export PATH="/Users/faridsilva/Library/Application Support/Herd/bin/":$PATH


# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/faridsilva/Library/Application Support/Herd/config/php/82/"


# Herd injected PHP 7.4 configuration.
export HERD_PHP_74_INI_SCAN_DIR="/Users/faridsilva/Library/Application Support/Herd/config/php/74/"
# source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# pnpm
export PNPM_HOME="/Users/faridsilva/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Herd injected PHP 8.1 configuration.
export HERD_PHP_81_INI_SCAN_DIR="/Users/faridsilva/Library/Application Support/Herd/config/php/81/"


# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/faridsilva/Library/Application Support/Herd/config/php/83/"


# Herd injected PHP 8.0 configuration.
export HERD_PHP_80_INI_SCAN_DIR="/Users/faridsilva/Library/Application Support/Herd/config/php/80/"
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"


# Options and plugins
setopt -J -9 ALWAYS_TO_END
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

