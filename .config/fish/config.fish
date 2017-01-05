. ~/.config/fish/aliases.fish

# Environment Variables
set -gx LC_COLLATE "C"
set -gx GCC_COLORS "on"
set -x EDITOR "vim"
set -gx MANPATH (manpath)

# PATH is handled specially by fish so the elements are space separated
# instead of colon separated.
set -gx PATH $PATH /sbin /usr/sbin $HOME/bin $HOME/sfw/bin $HOME/.cabal/bin

set -U fish_user_paths /usr/local/bin /usr/bin

set -gx LD_LIBRARY_PATH /usr/local/lib64:/usr/local/lib:$HOME/sfw/lib64:$HOME/sfw/lib

set -gx JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk/
#set -gx JAVA_HOME (which java)

# Local changes for this machine
. ~/.config/fish/local.fish

# Remove duplicates from paths
varclear PATH MANPATH INFOPATH
