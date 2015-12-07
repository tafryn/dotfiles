alias cls "clear; ls"
alias grep "grep --color=auto --binary-files=without-match --exclude-dir=.svn -n"
alias socks "ssh -f -N -D 8080"
alias desocks "pkill -f 'ssh -f -N -D 8080'"
alias xlog "less /var/log/Xorg.0.log"
alias elog "colortail --config=/etc/colortail/conf.messages -f /var/log/everything.log"
alias tmux "tmux -2"
alias build "mkdir -p build_dir; and pushd build_dir; and cmake ../; and make -j8; and popd"

#alias git "git --no-pager"
alias gd "git diff --color"
alias gl "git log --color"
alias gs "git status"
alias gg "git grep"

alias ag 'sudo apt-get'
alias agi 'sudo apt-get install'
alias p 'pacman'
alias y 'yaourt'
