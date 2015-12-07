if command --search "vimpager" >/dev/null
    set -x PAGER "vimpager"
    set -x MANPAGER "vimpager"
    alias less "vimpager"
else if command --search "most" >/dev/null
    set -x MANPAGER 'most'
    alias less "most"
else
    alias less "less -r"
end

if command --search "systemctl" >/dev/null
    alias poweroff "sudo systemctl poweroff"
    alias restart "sudo systemctl restart"
end

if command --search "vimcat" >/dev/null
    alias cat "vimcat"
end

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