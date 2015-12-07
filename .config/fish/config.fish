. ~/.config/fish/aliases.fish

# PATH is handled specially by fish so the elements are space separated
# instead of colon separated.
set -gx PATH $PATH /sbin /usr/sbin $HOME/bin $HOME/.cabal/bin

set -gx LD_LIBRARY_PATH /usr/local/lib64:/usr/local/lib

. ~/.config/fish/local.fish
