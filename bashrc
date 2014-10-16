# === EXPORTS ===

export PATH=$HOME/bin:$PATH
export EDITOR='vim'
export LC_TYPE='utf-8'

export RBENV_VERSION="2.0.0-p247"

eval "$(rbenv init -)"

# === ALIAS ===
# Navigation

alias ..='cd ..'
alias ...='cd ../..'

alias ls='ls -G'
alias ll='ls -l -h'
alias la='ls -GlA'

alias o='open'
alias o.='open .'

alias g='git'
alias gs='g s'
alias gl='g l'
alias gp='g pull'

# Grep

alias grep='grep --color=auto'

# === Completion ===

# requires: brew install bash-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	. $(brew --prefix)/etc/bash_completion
fi

# === PS1 ===

source ~/.bash-ps1.sh