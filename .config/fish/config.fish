. ~/.config/fish/aliases.fish

# Environment Variables
set -gx LC_COLLATE "C"
set -gx GCC_COLORS "on"
set -gx TZ ":/etc/localtime"
set -x EDITOR "nvim"
set -x TERMINAL "alacritty"
set -x BROWSER "vivaldi"
set -x EXA_COLORS "sn=;32:sb=;37:uu=;36:un=;37:gu=;36:gn=;37:ur=;36:uw=;36:ue=;36:gr=;36:gw=;31:gx=;36:tr=;36:tx=;36"

# PATH is handled specially by fish so the elements are space separated
# instead of colon separated.
set -gx PATH $PATH /sbin /usr/sbin $HOME/bin $HOME/.cabal/bin $HOME/.cargo/bin $HOME/.local/bin

set -U fish_user_paths $HOME/sfw/bin /usr/local/bin

set MANPATH ":$HOME/sfw/man/:$HOME/sfw/share/man"

set -gx LD_LIBRARY_PATH /usr/local/lib64:/usr/local/lib:$HOME/sfw/lib64:$HOME/sfw/lib

set -gx JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk/
#set -gx JAVA_HOME (which java)

# Tweak fish colors
set -e fish_color_valid_path

# Local changes for this machine
. ~/.config/fish/local.fish

# Remove duplicates from paths
varclear PATH MANPATH INFOPATH LD_LIBRARY_PATH
