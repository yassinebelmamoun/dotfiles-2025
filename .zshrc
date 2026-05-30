# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# If using starship, disable OMZ theme:
ZSH_THEME=""

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="false"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  brew
  python
  vi-mode
  docker
  docker-compose
  aws
  gh
  kubectl
  kubectx
  macos
  tmux
)

source $ZSH/oh-my-zsh.sh

# Deduplicate PATH entries (zsh feature)
typeset -U path PATH


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh

# For a full list of active aliases, run `alias`.
# Configure PIPENV to create venv in folder (easy for IDE/neovim)
export PIPENV_VENV_IN_PROJECT=1

# Example aliases
alias zshc="nvim ~/.zshrc"
alias tmuxc="nvim ~/.tmux.conf"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias repos="cd ~/repos"
alias manatal="cd ~/repos/manatal-workspace/"
alias ms="cd ~/repos/manatal-workspace/manatal-services/"
alias mc="cd ~/repos/manatal-workspace/manatal-config/"

# TODO: Migrate to new path
alias mgitops="cd ~/repos/manatal-config/gitops-apps-config"
alias miac="cd ~/repos/manatal-config/gitops-iac-config"
alias minfra="cd ~/repos/manatal-config/gitops-infra-config"

# Other projects 
alias postule="cd ~/repos/postule.ma/"

# Alias
alias export_aws_credentials='eval $(aws configure export-credentials --profile $AWS_PROFILE --format env)'

# Pyenv setup
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Kubernetes
# kubectl coloring (fallback cleanly if kubecolor missing)
if command -v kubecolor >/dev/null 2>&1; then
  alias kubectl="kubecolor"
fi

# NVM for Node
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Start SSH agent if not running
if [ -z "$SSH_AUTH_SOCK" ] ; then
  eval "$(ssh-agent -s)"
  # Don't add keys here - let them be added on first use
fi

# To control display of spaceship kubeconfig
kube-on() {
  export SHOW_KUBE=1
}

kube-off() {
  unset SHOW_KUBE
}

# initi starship
export STARSHIP_CONFIG=~/dotfiles/starship.toml
command -v starship >/dev/null 2>&1 && eval "$(starship init zsh)"
command -v direnv  >/dev/null 2>&1 && eval "$(direnv hook zsh)"

# kiro integration guarded
[[ "$TERM_PROGRAM" == "kiro" ]] && command -v kiro >/dev/null 2>&1 && . "$(kiro --locate-shell-integration-path zsh)"
