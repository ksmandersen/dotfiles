# .zshrc

autoload -U promptinit && promptinit

# optionally define some options
PURE_DEFAULT_USERNAME='ksma'
PURE_CMD_MAX_EXEC_TIME=5

# import the prompt
prompt pure
#. ~/.pure.zsh

LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31 ;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=0 1;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35 :*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.t iff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=0 1;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:';
export LS_COLORS

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

#autoload -Uz promptinit
#autoload -Uz compinit
#compinit

zstyle ':completion:*'  auto-description 'specify: %d'
zstyle ':completion:*'  completer _expand _complete _correct _approximate
zstyle ':completion:*'  format 'Completing %d'
zstyle ':completion:*'  group-name ''
zstyle ':completion:*'  menu select=2 eval "$(gdircolors -b)"
zstyle ':completion:*:default'  list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*'  list-colors 
zstyle ':completion:*'  list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*'  matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*'  menu select=long
zstyle ':completion:*'  select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*'  use-compctl false
zstyle ':completion:*'  verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'


# When directory is changed set xterm title to host:dir
chpwd() {
    [[ -t 1 ]] || return
    case $TERM in
  sun-cmd) print -Pn "\e]l%~\e\\";;
        *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%m:%~\a";;
    esac
}

# new tabs open in same dir with OS X Terminal
precmd () {print -Pn "\e]2; %~/ \a"}
preexec () {print -Pn "\e]2; %~/ \a"}

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="--color"
fi

# aliases
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias g="git"
alias gs="git status"
alias gp="git pull origin master"

alias o="open"
alias o.="open ."

alias s="subl"

alias ls='ls -Gl'
alias ll='ls'
alias la='ls -Gla'

alias x="open -a 'Xcode' ."
alias fuxcode='rm -rf ~/Library/Developer/Xcode/DerivedData'

# Use Git’s colored diff when available
hash git &>/dev/null
if [ $? -eq 0 ]; then
  function diff() {
    git diff --no-index --color-words "$@"
  }
fi

# Don’t clear the screen after quitting a manual page
export MANPAGER="less -X"
export EDITOR='subl'
export LC_CTYPE="utf-8"

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin

# Set the appropriate PATH
export PATH="/usr/local/bin:$(brew --prefix coreutils)/libexec/gnubin:/usr/local/Cellar:/usr/local/mysql/bin:/usr/local/sbin:$PATH"

# Include stubs from npm
export PATH="/usr/local/share/npm/bin:$PATH"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

eval "$(rbenv init - zsh)"