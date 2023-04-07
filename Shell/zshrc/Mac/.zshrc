# Newline before every command
precmd() { print "" }

# Paths to zsh
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/tomazfidel/.oh-my-zsh"

# Enable oh-my-posh
# As the standard terminal has issues displaying the ANSI characters correctly, you might want to skip loading just for that terminal
if [ $TERM_PROGRAM != "Apple_Terminal" ]; then
  eval "$(oh-my-posh init zsh --config /Users/tomazfidel/.poshthemes/TheCollabShort-1.6.omp.json)"
fi

# Zsh automatically detects directories in $fpath that might have insecure permissions.
# DISABLED FOR PERFORMANCE
ZSH_DISABLE_COMPFIX="true"

# bracketed-paste-magic and url-quote-magic are two Zsh utilities that are known buggy in some Zsh versions or user setups.
# If you're having problems when pasting URLs or pasting anything at all, use this setting to disable them.
# DISABLED FOR PERFORMANCE
DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-syntax-highlighting
  git
  copyfile
  dirhistory
  history
  sudo
  colored-man-pages
  you-should-use
  zsh-autosuggestions
  zsh-history-substring-search
  macos
)

# Aliases
alias ls='lsd'

# Enable oh-my-zsh
# HAS TO BE HERE at the bottom FOR oh-my-zsh PLUGINS TO WORK
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Remove history size limit (oh-my-zsh)
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

# FZF config
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 25% --layout=reverse'
