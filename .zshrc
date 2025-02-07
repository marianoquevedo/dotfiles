
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
export ZSH="/Users/marianoquevedo/.oh-my-zsh"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git docker node zsh-autosuggestions terraform colors)

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
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# syntax highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

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

# take colors from
#https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

# Set Spaceship ZSH as a prompt
SPACESHIP_GIT_BRANCH_PREFIX=
SPACESHIP_GIT_BRANCH_COLOR=173
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_DOCKER_SHOW=false
SPACESHIP_PYTHON_PREFIX="- "
SPACESHIP_PYTHON_SHOW=true
SPACESHIP_GCLOUD_PREFIX="- GCP "
SPACESHIP_GCLOUD_SYMBOL=""
SPACESHIP_GCLOUD_COLOR=29
SPACESHIP_VENV_SHOW=false

# prompt
autoload -U promptinit; promptinit
# autoload -Uz colors && colors

source "/opt/homebrew/opt/spaceship/spaceship.zsh"

# Set up fzf key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fzf-git
source ~/fzf-git.sh/fzf-git.sh

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# bat
export BAT_THEME=Monokai Extended Origin

# add local Postgres to PATH
path+=('/Applications/Postgres.app/Contents/Versions/15/bin')

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/marianoquevedo/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/marianoquevedo/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/marianoquevedo/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/marianoquevedo/google-cloud-sdk/completion.zsh.inc'; fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# poetry
path+="$HOME/.local/bin:$PATH"