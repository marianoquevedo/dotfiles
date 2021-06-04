HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
REPORTTIME=10  # Show elapsed time if a command takes longer than 10s
HOMEBREW_PREFIX=`brew --prefix`

ZSH_THEME=""

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

# Case-insensitive, partial-word, then substring completion.
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=* l:|=*' 'm:{a-zA-Z}={A-Za-z}'

zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' menu select=long
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description 'specify: %d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple}-- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches for: %d --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches. Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' use-compctl false

# insert all expansions for expand completer
# zstyle ':completion:*:expand:*' tag-order all-expansions

# zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# One error for every three characters
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Array completion element sorting.
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Directories
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:cd:*' ignore-parents parent pwd

# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,state,cputime,ucomm'

# User configuration
DEFAULT_USER=mariano

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# alias
alias rm=trash
alias zshconfig="code ~/.zshrc"
alias stree='/Applications/SourceTree.app/Contents/Resources/stree'

# Z
source $HOMEBREW_PREFIX/etc/profile.d/z.sh

# Load the prompt.
autoload -Uz promptinit && promptinit
autoload -Uz colors && colors
prompt pure

source $HOMEBREW_PREFIX/etc/profile.d/z.sh
source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh