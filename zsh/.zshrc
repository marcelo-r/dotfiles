# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/$USER/.oh-my-zsh"

# asdf config and completion
. $HOME/.asdf/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)

ZSH_THEME="robbyrussell"

# display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"

# Add wisely, as too many plugins slow down shell startup.
plugins=(
	asdf
	dnf
	extract
	git
	golang
	kubectl
	rust
	python
	vi-mode
)
VI_MODE_RESET_PROMPT_ON_MODE_CHANGE=true

source $ZSH/oh-my-zsh.sh

#autoload -Uz compinit && compinit -y
# user configuration
# needed for fzf and vi-mode to coexist without problems
autoload -U compinit
compinit -i
set -o vi
source /usr/share/fzf/shell/key-bindings.zsh

fpath+=${ZDOTDIR:-~}/.zsh_functions

eval "$(direnv hook zsh)"
source $HOME/.local/kind/completion


# export MANPATH="/usr/local/man:$MANPATH"
# env ars
export EDITOR="nvim"

alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

export LOCALPATH="$HOME/.local/bin"
export GOPATH="$HOME/.local/go"
export GOBIN="$GOPATH/bin"

export PATH="$PATH:$LOCALPATH:$GOBIN"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"

# 100ms
export KEYTIMEOUT=10
export EDITOR="nvim"

export PIPENV_VENV_IN_PROJECT=1

# aliases
alias zshconfig="$EDITOR ~/.zshrc"
alias ohmyzsh="$EDITOR ~/.oh-my-zsh"

# FZF
export FZF_DEFAULT_COMMAND="fd -t f --no-ignore"
export FZF_CTRL_T_COMMAND="fd --no-ignore --exclude ~/Games"
export FZF_COMPLETION_TRIGGER="~~"
export FZF_ALT_C_COMMAND="fd -t d --exclude ~/Games . $HOME"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
# easily check a command
# command for listing path candidates.
_fzf_compgen_path() {
  fdfind --hidden --follow --exclude ".git" . "$1"
}
# Use fdfind to generate the list for directory completion
_fzf_compgen_dir() {
  fdfind --type d --hidden --follow --exclude ".git" . "$1"
}

alias cmd="command -v"
alias l="lsd"
alias t="tree -d"
alias rm="rm -i"
alias rm="trash -i"

alias nv="neovim"
alias dps="docker ps --format '{{.ID}}\t{{.Names}}  \t{{.Size}}   \t{{.Ports}}  \t{{.Status}}'"
alias dpsa="docker ps -a --format '{{.ID}}\t{{.Names}}  \t{{.Size}}   \t{{.Ports}}  \t{{.Status}}'"
alias dc="docker-compose"
alias k="kubectl"
#alias rg="rg -i"

alias ,ecd="emacs --daemon"
alias ,ec="emacsclient -t"
alias ,emacs="emacsclient -c -a emacs"

alias sublime_merge="/opt/sublime_merge/sublime_merge"
alias python="python3"


# format prompt
PROMPT="%{$fg[cyan]%}%1~ %(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"
PROMPT+='%{$reset_color%}'

