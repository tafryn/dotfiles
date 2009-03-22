# .zshrc is sourced in interactive shells. It should contain commands
# to set up aliases, functions, options, key bindings, etc. that
# customize zsh to the user's liking.

#----------------
# Variables
#----------------
export LC_COLLATE='C'
export EDITOR='vim'

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

export PAGER='vimpager' # annoying for git
export MANPAGER='/usr/bin/most'

# Set the TERM variable for 256 colors
if [[ $COLORTERM == 'rxvt-xpm' ]] then
	export TERM='rxvt-unicode' 
fi

# a hack for awesome+java
export AWT_TOOLKIT='MToolkit'
export OOO_FORCE_DESKTOP='gnome'
export INTEL_BATCH=2

# Adds user and hostname to the main prompt and path to the right prompt. 
# Any user PROMPT settings should go before this.
PROMPT="%n@%{[33m%}%m%{[0m%}$ "
RPROMPT=":%{[36m%}%~%{[0m%}"

#----------------
# Aliases
#----------------
if [[ `uname` = "Linux" ]]; then
  alias ls="ls --color=auto --group-directories-first"
fi
alias ll="ls -l"
alias la="ls -a"
alias ..="cd .."
alias cls="clear;ls"
alias xlog="sudo less /var/log/Xorg.0.log"
alias less="vimpager"
alias git="git --no-pager"

alias gd="git diff"
alias gl="git log"
alias gs="git status"

alias a='screen -raAd'
alias t='todo'
alias ag='sudo apt-get'
alias p='pacman'
alias y='yaourt'

#----------------
# Misc. Options
#----------------
# Fix git tab completion problems by turning it off.
compdef -d git

# Disable core files. 
ulimit -c 0

# Make sure to use emacs keybindings
bindkey -e

# Where have you been all my life
setopt nobeep

setopt completeinword
setopt histverify

# terminal title updates; the screen one isn't so useful to me so I left it out
case $TERM in
  xterm*|rxvt*|eterm)
    # Truncate the working directory or command to be run to prevent the window
    # list from becoming miles and miles wide. The "\a" finishes the escape
    # sequence and should not be truncated, so it goes into a separate
    # truncation (%>>) argument.
    precmd()  { print -Pn "\e]2;%n@%m - %70>=\\\\>>%~%>>\a" ; }
    preexec() {
      # That ${1:BIGMESS} stuff escapes % escapes and $varnames so they'll
      # appear in the titlebar as-is. The worst-case of four backslashes for
      # print is doubled by the extra layer of parameter expansion :O
      print -Pn "\e]2;%n@%m - %70>=\\\\>>${1:gs/%/%%/:gs/$/\\\\\\\\$/}%>>\a"
    }
    ;;
esac

#----------------
# Local changes
#----------------
if [[ -e $HOME/.zshlocal ]] then
	source $HOME/.zshlocal 
fi

