# Environment Variables
set -gx LC_COLLATE "C"
set -gx GCC_COLORS "on"
set -gx TZ "America/Los_Angeles"
set -x EDITOR "lvim"
set -x TERMINAL "alacritty"
set -x BROWSER "firefox"
set -e EZA_COLORS
set -a EZA_COLORS "nb=38;5;239:ub=38;5;241:"    #  0  -> <1KB : grey
set -a EZA_COLORS "nk=38;5;29:uk=38;5;100:"     # 1KB -> <1MB : green
set -a EZA_COLORS "nm=38;5;26:um=38;5;32:"      # 1MB -> <1GB : blue
set -a EZA_COLORS "ng=38;5;130:ug=38;5;166;1:"  # 1GB -> <1TB : orange
set -a EZA_COLORS "nt=38;5;160:ut=38;5;197;1:"  # 1TB -> +++  : red
set -a EZA_COLORS "da=38;5;243:"                # darker dates
set -a EZA_COLORS "uu=38;5;239:gu=38;5;239:"    # darker username & group
set -a EZA_COLORS "ur=38;5;240:uw=38;5;244:ux=38;5;248:ue=38;5;248:" # user permissions
set -a EZA_COLORS "gr=38;5;240:gw=38;5;244:gx=38;5;248:" # group permissions
set -a EZA_COLORS "tr=38;5;240:tw=38;5;244:tx=38;5;248:" # other permissions
if command --search "vivid" >/dev/null
    set -a EZA_COLORS (vivid -m 8-bit generate one-dark)
end
set -x EZA_COLORS (string join '' $EZA_COLORS)

# PATH is handled specially by fish so the elements are space separated
# instead of colon separated.
set -gx PATH $PATH /sbin /usr/sbin $HOME/bin $HOME/.cabal/bin $HOME/.cargo/bin $HOME/.local/bin $HOME/go/bin

set -U fish_user_paths $HOME/sfw/bin /usr/local/bin

set MANPATH ":$HOME/sfw/man/:$HOME/sfw/share/man"

set -gx LD_LIBRARY_PATH /usr/local/lib64:/usr/local/lib:$HOME/sfw/lib64:$HOME/sfw/lib:$HOME/.local/lib64

set -gx JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk/
#set -gx JAVA_HOME (which java)

# Set mount point for status bar display
set -x HOME_MOUNT (df -P /home | tail -1 | tr -s ' ' | cut -d' ' -f 6)

# Tweak fish colors
set -e fish_color_valid_path

# Set aliases
. ~/.config/fish/aliases.fish

# Local changes for this machine
. ~/.config/fish/local.fish

# Remove duplicates from paths
varclear PATH MANPATH INFOPATH LD_LIBRARY_PATH
