# === OPTIONS ===

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
# http://www.biostat.jhsph.edu/~afisher/ComputingClub/webfiles/KasperHansenPres/IntermediateUnix.pdf
# https://unix.stackexchange.com/questions/48713/how-can-i-remove-duplicates-in-my-bash-history-preserving-order
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000
shopt -s histappend;
shopt -s cmdhist;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
	shopt -s "$option" 2> /dev/null;
done;

# === EXPORTS ===

# Fastlane


# PATH
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH
eval $(/opt/homebrew/bin/brew shellenv)
export PATH=$(brew --prefix coreutils)/libexec/gnubin:$PATH
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export PATH="/usr/local/opt/ruby/bin:$PATH"
export EDITOR='vim'

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"

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
alias la="ls -laF ${colorflag}"

alias o='open'
alias o.='open .'

alias g='git'
alias gs='g s'
alias gl='g l'
alias gp='g pull'
alias gc='g c'
alias gadd='g add'
alias gadd.='g add .'
alias gpu='g push origin master'

# Grep

alias grep='grep --color=auto'

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Lock the screen (when going AFK)
# Get week number
alias week='date +%V'

# Open workspace or project of current folder in Xcode
xc () {
  if ls *.xcworkspace 1>/dev/null 2>&1; then
    open *.xcworkspace
  else
    open *.xcodeproj
  fi
}

# Trash the derived data cache
alias dderived="trash ~/Library/Developer/Xcode/DerivedData"

# Start a small python web server from any directory
alias serve='python -m SimpleHTTPServer 8000'

alias vejr='curl wttr.in/copenhagen'

alias fuxcode="swift package -Xswiftc -I/usr/local/include -Xlinker -L/usr/local/lib generate-xcodeproj"

alias mysql5="mysql --host 0.0.0.0 --port 3307 -u root --password=winteriscoming"
alias mysql8="mysql --host 0.0.0.0 --port 3306 -u root --password=winteriscoming"
alias redis-cli="docker exec -it redis redis-cli"
alias psql12="psql -h 0.0.0.0 -p 54320 -w -U postgres"

# === Completion ===
[[ -r "$(brew --prefix)/etc/profile.d/bash_completion.sh" ]] && . "$(brew --prefix)/etc/profile.d/bash_completion.sh"

# requires: brew install bash-completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults;

# Add `killall` tab completion for common apps
complete -o "nospace" -W "Contacts Calendar Dock Finder Mail Safari iTunes SystemUIServer Terminal Twitter" killall;

# === PS1 ===

source ~/.git-prompt.sh
source ~/.bash-ps1.sh

PROMPT_TITLE='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/~}\007"'
export PROMPT_COMMAND="${PROMPT_COMMAND} ${PROMPT_TITLE}; "

export LC_TYPE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export GPG_TTY=$(tty)
