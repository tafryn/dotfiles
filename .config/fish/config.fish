. ~/.config/fish/aliases.fish

# Environment Variables
set -x EDITOR "vim"

# PATH is handled specially by fish so the elements are space separated
# instead of colon separated.
set -gx PATH $PATH /sbin /usr/sbin $HOME/bin $HOME/.cabal/bin

set -gx LD_LIBRARY_PATH /usr/local/lib64:/usr/local/lib

# Local changes for this machine
. ~/.config/fish/local.fish

# Remove duplicates from paths
varclear PATH MANPATH INFOPATH
