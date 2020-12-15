if command --search "bat" >/dev/null
    set -x BAT_PAGER "less"
end

if command --search "nvimpager" >/dev/null
    set -x PAGER "nvimpager"
    set -x MANPAGER "nvimpager"
    alias less "nvimpager"
    alias cat "nvimpager"
else if command --search "most" >/dev/null
    set -x MANPAGER 'most'
    alias less "most"
else
    alias less "less -r"
end

if command --search "exa" >/dev/null
    alias ls "exa --group-directories-first"
    alias ll "exa -l --group-directories-first"
    alias la "exa -a --group-directories-first"
    alias tree "exa --tree"
else if command --search "lsd" >/dev/null
    alias ls "lsd"
    alias ll "lsd -l"
    alias la "lsd -a"
    alias tree "lsd --tree"
else
    alias ll "ls -l"
    alias la "ls -a"
end

if command --search "systemctl" >/dev/null
    alias poweroff "sudo systemctl poweroff"
    alias restart "sudo systemctl restart"
end

alias cls "clear; ls"
alias grep "grep --color=auto --binary-files=without-match --exclude-dir=.svn"
alias socks "ssh -f -N -D 8080"
alias desocks "pkill -f 'ssh -f -N -D 8080'"
alias xlog "less /var/log/Xorg.0.log"
alias elog "colortail --config=/etc/colortail/conf.messages -f /var/log/everything.log"
alias tmux "tmux -2"
alias build "mkdir -p build_dir; and pushd build_dir; and cmake ../; and make -j8; and popd"
alias tags "ctags -R -f .ctags --file-scope=yes --sort=yes --fields=+iaS --extras=+q"
if command --search "lazygit" >/dev/null
    alias dotfiles "lazygit -g .dotfiles/ -w ~/"
    alias git-dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
else
    alias dotfiles "git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
end

#alias git "git --no-pager"
alias gd "git diff --color -w"
alias gds "git diff --color -w --staged"
alias gl "git log --color"
alias gs "git status"
alias gg "git grep"
alias gpc "git log -p -1"

alias y 'yaourt'
alias o 'xdg-open (fzf)'
alias ccze 'ccze -o nolookups'
