# === OPTIONS ===

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# === EXPORTS ===

# PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export PATH="/usr/local/heroku/bin:$PATH"

export EDITOR='vim'
export LC_TYPE='utf-8'

# Always use color output for `ls`
alias ls="command ls ${colorflag}"

# === ALIAS ===
# Navigation

alias ..='cd ..'
alias ...='cd ../..'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
	colorflag="--color"
else # OS X `ls`
	colorflag="-G"
fi

alias ls="ls -lF ${colorflag}"
alias ll="ls -l -h"
alias la="ls -laF ${colorflag}"
alias ld="ls -lF ${colorflag} | grep --color=never '^d'"

alias o='open'
alias o.='open .'

alias g='git'
alias gs='g s'
alias gl='g l'
alias gp='g pull'

# Grep

alias grep='grep --color=auto'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Lock the screen (when going AFK)
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Get week number
alias week='date +%V'


# Open workspace or project of current folder in Xcode
alias xc='open -a Xcode .'
alias ac='open -a AppCode .'

# Start a small python web server from any directory
alias serve='python -m SimpleHTTPServer 8000'

# === Completion ===

# requires: brew install bash-completion
if which brew > /dev/null && [ -f $(brew --prefix)/etc/bash_completion ]; then
	source "$(brew --prefix)/etc/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# === PS1 ===

source ~/.git-prompt.sh
source ~/.bash-ps1.sh

# === FuzzyFinder (FZF)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
