#|    Git Functions                                                        {{{
#|============================================================================

function __git_is_repo -d "Check if current directory is a repository"
    test -d .git; and set -g __GIT_DIR ".git"; or set -g __GIT_DIR (command git rev-parse --git-dir ^/dev/null)
end

function __git_branch_name -d "Get the current branch name."
    echo (command git symbolic-ref HEAD ^/dev/null | sed -e 's|^refs/heads/||')
end

function __git_rev_name -d "Get the short name for the current revision."
    echo (command git rev-parse --short HEAD)
end

function __git_behead -d "Return the number of commits ahead and behind upsteam."
    command git rev-list --left-right "@{upstream}...HEAD" ^/dev/null \
    | awk "BEGIN {a = 0; b = 0;} \
      />/ {a += 1} \
      /</ {b += 1} \
      END \
      {print a\"\n\"b\"\n\"}"
end

function __git_changes -d "Return the number of staged, modified, and untracked files."
    command git status --porcelain ^/dev/null \
    | awk "BEGIN {s = 0; m = 0; u = 0;} \
      /^[MADRCU]/ {s += 1} \
      /^.[MADRCU]/ {m += 1} \
      /\?/ {u += 1} \
      END \
      {print s\"\n\"m\"\n\"u\"\n\"}"
end

function __git_stashed -d "Return the number of stashes."
    test -r $__GIT_DIR/refs/stash
end

function __git_display
    set -l git_branch (__git_branch_name)
    set -l upstream_delta ""
    set -l repo_changes ""

    if [ $git_branch = "" ]
        set git_branch (__git_rev_name)
    end

    set -l behead (__git_behead)
    if [ $behead[1] != "0" ]
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count ".$behead[1]"))
        set upstream_delta "$upstream_delta"(yellow)"↑$behead[1]"(off)
    end
    if [ $behead[2] != "0" ]
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count ".$behead[2]"))
        set upstream_delta "$upstream_delta"(byellow)"↓$behead[2]"(off)
    end

    if __git_stashed
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count "."))
        set upstream_delta "$upstream_delta"(bcyan)"↩"(off)
    end

    set -l changes (__git_changes)
    if [ $changes[1] != "0" ]
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count ".$changes[1]"))
        set repo_changes "$repo_changes"(bgreen)"●$changes[1]"(off)
    end
    if [ $changes[2] != "0" ]
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count ".$changes[2]"))
        set repo_changes "$repo_changes"(red)"+$changes[2]"(off)
    end
    if [ $changes[3] != "0" ]
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count ".$changes[3]"))
        set repo_changes "$repo_changes"(bblue)"…$changes[3]"(off)
    end
    if [ $repo_changes = "" ]
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot 1)
        set repo_changes "$repo_changes"(bgreen)"✔"(off)
    end

    # Add length of git branch to be removed from span length
    set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count "$git_branch..."))

    echo -n (bgray)"("(off)
    echo -n (blue)"$git_branch$upstream_delta"(bgray)"|"(off)"$repo_changes"
    echo -n (bgray)")"(off)
end

# }}} #

#|    Utility Functions                                                    {{{
#|============================================================================

function __char_count
    echo -n "$argv" | wc -c
end

function __repeat_bar
    if math "$argv>0" > /dev/null
        for i in (seq $argv)
            echo -n "─"
        end
    end
end

function __repeat_dot
    if math "$argv>0" > /dev/null
        for i in (seq $argv)
            echo -n "."
        end
    end
end

# }}} #

function fish_prompt
    set -g TOP_BAR_MINUS    ""
    set -l __total_span     $COLUMNS
    set -l symbol           "λ "
    set -l bar_color        (cyan)
    set -l __git_display    ""
    set -l __ssh_display    ""
    set -l st               $status

    set -l __pwd (pwd)
    # Add cwd length to be removed from span length.
    set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count $__pwd))

    if __git_is_repo
        set __git_display (__git_display)
    end

    if test -n "$SSH_CLIENT" -o -n "$SSH2_CLIENT"
        set bar_color (yellow)
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count ".$USER.$HOSTNAME.."))
        set __ssh_display (bgray)"("(off)"$USER@"(yellow)"$HOSTNAME"(off)(bgray)")"(off)$bar_color"─"(off)
    end

    # Subtract length of static elements from span bar length.
    set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot 5)

    #|    First Line of Prompt                                                 {{{
    #|============================================================================
    
    echo -n $bar_color"┌─"(off)
    echo -n (bgray)"("(off)
    echo -n (green)"$__pwd"(off)
    echo -n (bgray)")"(off)
    echo -n $bar_color"─"(off)

    echo -n $__git_display

    # Adjust length of horizontal span to account for top line elements.
    set -l tbm (__char_count $TOP_BAR_MINUS)
    set -l __total_span (math "$__total_span - $tbm") 

    # Print spanning bar
    echo -n $bar_color(__repeat_bar $__total_span)(off)

    # Print username and host information for ssh sessions.
    echo $__ssh_display

    # }}} #

    #|    Second Line of Prompt                                                {{{
    #|============================================================================
    
    # Second Line of Prompt
    echo -n $bar_color"└─"(off)
    if [ "$st" = 0 ]
        echo -n (bblue)"$symbol"(off)
    else
        echo -n (bred)"$symbol"(off)
    end
    # }}} #

end

function fish_right_prompt
    set -l st $status

    if [ $st != 0 ];
        echo (set_color red) ↵ $st(set_color normal)
    end
end

# vim: set fdm=marker et ts=4 sw=4:
