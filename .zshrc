##########################
# Terminal Configuration #
##########################

# Set name of the theme to load
ZSH_THEME="agnoster"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# DISABLED Plugins
# zsh-autosuggestions

# Set plugins to load
plugins=(
  git
  bundler
  dotenv
  osx
  colorize
  pip
  python
  brew
  zsh-syntax-highlighting
)

######################
# Path Configuration #
######################

# Set the GOPATH
export GOPATH="$HOME/go"
export GOROOT="$(brew --prefix golang)/libexec"

# General Path
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Cargo Path
export PATH="$HOME/.cargo/bin:$PATH"

# Go Paths
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# export PATH="/usr/local/go/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/stephenhalliburton/.oh-my-zsh"

######################
# User Configuration #
######################
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# SSH Path
export SSH_KEY_PATH="~/.ssh/rsa_id"

# NVM Path
export NVM_DIR=~/.nvm

# Go Module
export GO111MODULE=auto

# Prompt Context?
prompt_context() { }

# Set the Default User
DEFAULT_USER="stephenhalliburton"

# Bring up the Environment
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
#source $(brew --prefix nvm)/nvm.sh
source $ZSH/oh-my-zsh.sh
source $HOME/.zsh/env.sh

# Add Python Environment
eval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/stephenhalliburton/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/stephenhalliburton/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/stephenhalliburton/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/stephenhalliburton/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

# ANTLR Dependencies
export CLASSPATH=".:/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH"
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.7.1-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias grun='java org.antlr.v4.gui.TestRig'
