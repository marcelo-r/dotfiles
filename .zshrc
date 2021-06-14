# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="amuse"
#ZSH_THEME="spaceship"
#ZSH_THEME="ys"
#ZSH_THEME="clean"
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    asdf
    cargo
	dnf
	extract
    git
    github
    golang
    kubectl
    mix
	python
    rust
	)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
#export PATH="$(yarn global bin):$GOPATH/bin:$LOCALPATH:$PATH"
export EDITOR="nvim"

autoload -U compinit
compinit -i

set -o vi
source /usr/share/fzf/shell/key-bindings.zsh

alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

export LOCALPATH="$HOME/.local/bin"
export GOPATH="$HOME/.local/go"
export GOBIN="$GOPATH/bin"

export PATH="$PATH:$LOCALPATH:$GOBIN"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

export EDITOR="nvim"

export FZF_DEFAULT_COMMAND="fd -t f --no-ignore"
export FZF_CTRL_T_COMMAND="fd --no-ignore --exclude ~/Games"
export FZF_COMPLETION_TRIGGER="~~"
export FZF_ALT_C_COMMAND="fd -t d --exclude ~/Games . $HOME"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# command for listing path candidates.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

alias l="ls"
alias ll="exa -l"
alias la="exa -la"
alias nv="nvim"
alias dkps="docker ps --format '{{.ID}}\t{{.Names}}  \t{{.Size}}   \t{{.Ports}}  \t{{.Status}}'"
alias dkpsa="docker ps -a --format '{{.ID}}\t{{.Names}}  \t{{.Size}}   \t{{.Ports}}  \t{{.Status}}'"
#alias rg="rg -i"
alias rm="rm -i"

# easily check a command
alias cmd="command -v"

alias ssh-medical="ssh -i ~/.ssh/id_medicalpad marcelo@192.168.1.3 -p 2222"

alias ,ecd="emacs --daemon"
alias ,ec="emacsclient -t"
alias ,emacs="emacsclient -c -a emacs"

alias sublime_merge="/opt/sublime_merge/sublime_merge"

fpath+=${ZDOTDIR:-~}/.zsh_functions

eval "$(direnv hook zsh)"
eval "$(pipenv --completion)"

#export PIPENV_VENV_IN_PROJECT=1

# 100ms
export KEYTIMEOUT=10

# must be in this order for key bindings to work
eval "$(starship init zsh)"


# github cli completion
#source $HOME/.local/share/zsh/site-functions/_gh
