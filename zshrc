# Path to your oh-my-zsh installation.
export ZSH=/Users/mariano/.oh-my-zsh

ZSH_THEME=""

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git desk node zsh-autosuggestions z)

source $ZSH/oh-my-zsh.sh

# User configuration
DEFAULT_USER=mariano

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Hook for desk activation
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

# syntx highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# alias
alias rm=trash
alias zshconfig="code ~/.zshrc"
alias stree='/Applications/SourceTree.app/Contents/Resources/stree'

# Z
. `brew --prefix`/etc/profile.d/z.sh

# GO config
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# PURE Prompt
autoload -U promptinit; promptinit
prompt pure