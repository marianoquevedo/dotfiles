
HOMEBREW_PREFIX=`brew --prefix`
REPORTTIME=10  # Show elapsed time if a command takes longer than 10s

# history size
HISTSIZE=10000
HISTFILESIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

setopt EXTENDED_HISTORY
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# do not store duplications
setopt HIST_IGNORE_DUPS

# Path to your oh-my-zsh installation.
export ZSH="/Users/m.quevedo/.oh-my-zsh"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker node zsh-autosuggestions z)

source $ZSH/oh-my-zsh.sh

# Load and initialize the modern completion system.
autoload -Uz compinit && compinit
autoload -Uz bashcompinit && bashcompinit

# Enable completion caching, auto rehash commands - http://www.zsh.org/mla/users/2011/msg00531.html
zstyle ':completion::complete:*' use-cache on
zstyle ':completion:*' rehash true

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,state,cputime,ucomm'

# User configuration
# DEFAULT_USER=mariano

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# aliases
alias zshconfig="code ~/.zshrc"
alias zshreload="source ~/.zshrc";
alias stree='/Applications/SourceTree.app/Contents/Resources/stree'
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias ll="ls -1a";
alias ..="cd ../";
alias ..l="cd ../ && ll";
alias dc="docker compose";

# Z
source $HOMEBREW_PREFIX/etc/profile.d/z.sh

# iTerm integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
autoload -Uz colors && colors
prompt spaceship
