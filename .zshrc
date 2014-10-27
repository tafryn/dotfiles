# .zshrc is sourced in interactive shells. It should contain commands
# to set up aliases, functions, options, key bindings, etc. that
# customize zsh to the user's liking.

##############################################################################
# Variables
##############################################################################

export LC_COLLATE='C'
export EDITOR='vim'
export PYTHONIOENCODING='UTF-8'

export GREP_OPTIONS='--color=auto --binary-files=without-match --exclude-dir=.svn'
export GREP_COLOR='1;32'

fpath=($fpath ~/.zsh)

# A hack for awesome+java
export AWT_TOOLKIT='MToolkit'
export OOO_FORCE_DESKTOP='gnome'
export INTEL_BATCH=2

# Colors for autocompletion listings
#LS_COLORS='rs=0:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:';
#export LS_COLORS

if (( $+commands[vimpager] )) ; then
    export PAGER='vimpager' # annoying for git
    alias less="vimpager"
fi
if (( $+commands[most] )) ; then
    export MANPAGER='/usr/bin/most'
fi


##############################################################################
# Aliases
##############################################################################
if (( $+commands[systemctl] )) ; then
    alias poweroff='sudo systemctl poweroff'
    alias restart='sudo systemctl restart'
fi

if [[ `uname` = "Linux" ]]; then
  alias ls="ls --color=auto --group-directories-first"
fi

alias ll="ls -l"
alias la="ls -a"
alias cls="clear;ls"
alias socks="ssh -f -N -D 8080"
alias desocks="pkill -f 'ssh -f -N -D 8080'"
alias xlog="less /var/log/Xorg.0.log"
alias elog="colortail --config=/etc/colortail/conf.messages -f /var/log/everything.log"
alias tmux="tmux -2"

alias git="git --no-pager"
alias gd="git diff --color"
alias gl="git log --color"
alias gs="git status"

alias a='screen -raAd'
alias t='todo'
alias ag='sudo apt-get'
alias agi='sudo apt-get install'
alias p='pacman'
alias y='yaourt'

##############################################################################
# Misc. Options
##############################################################################

# Tab completion
autoload -U compinit promptinit
compinit
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Prompt themeing
promptinit
prompt tafryn #single

# Fix git tab completion problems by turning it off.
compdef -d git

# Disable core files. 
ulimit -c 0

# Where have you been all my life
setopt nobeep

setopt completeinword
setopt histverify
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt auto_cd
setopt multios

# Protect the defenseless files
unsetopt clobber

# Make sure to use emacs keybindings
bindkey -e

autoload zkbd
function zkbd_file() {
    [[ -f ~/.zkbd/${TERM}-${VENDOR}-${OSTYPE} ]] && printf '%s' ~/".zkbd/${TERM}-${VENDOR}-${OSTYPE}" && return 0
    [[ -f ~/.zkbd/${TERM}-${DISPLAY}          ]] && printf '%s' ~/".zkbd/${TERM}-${DISPLAY}"          && return 0
    return 1
}

[[ ! -d ~/.zkbd ]] && mkdir ~/.zkbd
keyfile=$(zkbd_file)
ret=$?
if [[ ${ret} -ne 0 ]]; then
    zkbd
    keyfile=$(zkbd_file)
    ret=$?
fi
if [[ ${ret} -eq 0 ]] ; then
    source "${keyfile}"
else
    printf 'Failed to setup keys using zkbd.\n'
fi
unfunction zkbd_file; unset keyfile ret

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Home]} ]] && bindkey "${key[Home]}" beginning-of-line
[[ -n ${key[PageUp]} ]] && bindkey "${key[PageUp]}" up-line-or-history
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[End]} ]] && bindkey "${key[End]}" end-of-line
[[ -n ${key[PageDown]} ]] && bindkey "${key[PageDown]}" down-line-or-history
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char

# terminal title updates
case $TERM in
    xterm*|rxvt*|eterm)
        # Truncate the working directory or command to be run to prevent the window
        # list from becoming miles and miles wide. The "\a" finishes the escape
        # sequence and should not be truncated, so it goes into a separate
        # truncation (%>>) argument.
        precmd()  {
            print -Pn "\e]2;%70>=\\\\>>[%~]%>> %M\a"
        }
        preexec() {
            # That ${1:BIGMESS} stuff escapes % escapes and $varnames so they'll
            # appear in the titlebar as-is. The worst-case of four backslashes for
            # print is doubled by the extra layer of parameter expansion :O
            print -Pn "\e]2;%70>=\\\\>>${1:gs/%/%%/:gs/$/\\\\\\\\$/}%>> [%~] %M\a"
        }
        ;;
    screen|screen-256color)
        precmd() {
            print -Pn "\ek%-3~\e\\"
            print -Pn "\e]83;title \"$1\"\a"
            print -Pn "\e]2;%70>=\\\\>>[%~]%>> %M\a"
        }
        preexec() {
            print -Pn "\ek$1\e\\"
            print -Pn "\e]83;title \"$1\"\a"
            print -Pn "\e]2;%70>=\\\\>>${1:gs/%/%%/:gs/$/\\\\\\\\$/}%>> [%~] %M\a"
        }
        ;;
esac

# Deal with Arch's annoying /etc/profile by sourcing zshenv for a second time.
source $HOME/.zshenv

# Remove duplicate entries from various paths.
typeset -U path cdpath manpath fpath

##############################################################################
# Local changes
##############################################################################
if [[ -e $HOME/.zshlocal ]] then
	source $HOME/.zshlocal 
fi

