#|    Set Prompt Variables                                                 {{{
#|============================================================================
if not set -q __fish_git_prompt_showcolorhints
    set -g __fish_git_prompt_showcolorhints 1
end

if not set -q __fish_git_prompt_showstashstate
    set -g __fish_git_prompt_showstashstate 1
end

if not set -q __fish_git_prompt_show_informative_status
    set -g __fish_git_prompt_show_informative_status 1
end

if not set -q __fish_git_prompt_showdirtystate
    set -g __fish_git_prompt_showdirtystate "yes"
end

if not set -q $__fish_git_prompt_color
    set -g __fish_git_prompt_color brblack
end

if not set -q __fish_git_prompt_color_branch
    set -g __fish_git_prompt_color_branch blue
end

if not set -q __fish_git_prompt_color_cleanstate
    set -g __fish_git_prompt_color_cleanstate brgreen
end

if not set -q __fish_git_prompt_color_stashstate
    set -g __fish_git_prompt_color_stashstate brcyan
end

if not set -q __fish_git_prompt_color_upstream
    set -g __fish_git_prompt_color_upstream yellow
end

# if not set -q __fish_git_prompt_color_stagedstate
#     set -g __fish_git_prompt_color_stagedstate yellow
# end

# if not set -q __fish_git_prompt_color_invalidstate
#     set -g __fish_git_prompt_color_invalidstate red
# end

if not set -q $__fish_git_prompt_color_prefix
    set -g __fish_git_prompt_color_prefix brblack
end

if not set -q $__fish_git_prompt_color_suffix
    set -g __fish_git_prompt_color_suffix brblack
end

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

function __git_prompt
    set -l git_branch (__git_branch_name)
    set -l upstream_delta ""
    set -l repo_changes ""

    if [ $git_branch = "" ]
        set git_branch (__git_rev_name)
    end

    set -l behead (__git_behead)
    if [ $behead[1] != "0" ]
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count ".$behead[1]"))
        set upstream_delta "$upstream_delta"(set_color yellow)"↑$behead[1]"(set_color normal)
    end
    if [ $behead[2] != "0" ]
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count ".$behead[2]"))
        set upstream_delta "$upstream_delta"(set_color bryellow)"↓$behead[2]"(set_color normal)
    end

    if __git_stashed
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count "."))
        set upstream_delta "$upstream_delta"(set_color brcyan)"↩"(set_color normal)
    end

    set -l changes (__git_changes)
    if [ $changes[1] != "0" ]
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count ".$changes[1]"))
        set repo_changes "$repo_changes"(set_color brgreen)"●$changes[1]"(set_color normal)
    end
    if [ $changes[2] != "0" ]
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count ".$changes[2]"))
        set repo_changes "$repo_changes"(set_color red)"+$changes[2]"(set_color normal)
    end
    if [ $changes[3] != "0" ]
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count ".$changes[3]"))
        set repo_changes "$repo_changes"(set_color brblue)"…$changes[3]"(set_color normal)
    end
    if [ $repo_changes = "" ]
        set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot 1)
        set repo_changes "$repo_changes"(set_color brgreen)"✔"(set_color normal)
    end

    # Add length of git branch to be removed from span length
    set -g TOP_BAR_MINUS $TOP_BAR_MINUS(__repeat_dot (__char_count "$git_branch..."))

    echo -n (set_color brblack)"("(set_color normal)
    echo -n (set_color blue)"$git_branch$upstream_delta"(set_color brblack)"|"(set_color normal)"$repo_changes"
    echo -n (set_color brblack)")"(set_color normal)
end

# }}} #

#|    Utility Functions                                                    {{{
#|============================================================================

function __char_count
    echo -n "$argv" | wc -c
end

function __repeat_bar
    if [ "$argv" -gt "0" ]
        for i in (seq $argv)
            echo -n "─"
        end
    end
end

function __repeat_dot
    if [ "$argv" -gt "0" ]
        for i in (seq $argv)
            echo -n "."
        end
    end
end

function __display_width
    string replace -ra '\e\[[^m]*m' '' "$argv" | \
    string replace -ra '[^\x00-\x7F]' 'A' | \
    string replace -ra '[^[:print:]]' ''| \
    string length
end


# }}} #

function fish_prompt
    if not set -q __fish_prompt_hostname
        set -g __fish_prompt_hostname (hostname | cut -d . -f 1)
    end
    set -l __total_span     $COLUMNS
    set -l symbol           "λ "
    set -l bar_color        cyan
    set -l bar_glyph        "─"
    set -l __git_display    ""
    set -l __ssh_display    ""
    set -l st               $status
    set -l __top_widths     "0 -1"

    if __git_is_repo
        # set __git_display (__git_prompt)
        set __git_display (fish_git_prompt)
    end

    if test -n "$SSH_CONNECTION" -o -n "$SSH_CLIENT"
        set bar_color yellow
        set __ssh_display (set_color brblack)"("(set_color normal)"$USER@"(set_color $bar_color)"$__fish_prompt_hostname"(set_color brblack)")"(set_color $bar_color)"─"(set_color normal)
        set -a __top_widths (__display_width "$__ssh_display")
    end

    #|    First Line of Prompt                                                 {{{
    #|============================================================================
    
    # Print abbreviated working directory 
    set -l __top_prompt (set_color $bar_color)"┌─"(set_color brblack)"("(set_color green)(prompt_pwd)(set_color brblack)")"(set_color $bar_color)"─"(set_color normal)

    # Print git display if relevant 
    set -la __top_prompt $__git_display

    # Adjust length of horizontal span to account for top line elements.
    set -la __top_widths (__display_width "$__top_prompt")

    # Add spanning bar
    set -l __total_top_width (math (string join "+" $__top_widths))
    set -la __top_prompt (set_color $bar_color)(string pad -w(math "$COLUMNS - $__total_top_width") -r --char=$bar_glyph "")(set_color normal)

    # Print username and host information for ssh sessions.
    set -la __top_prompt $__ssh_display
    
    printf '%s\n' (string join "" $__top_prompt)

    # }}} #

    #|    Second Line of Prompt                                                {{{
    #|============================================================================
    
    # Second Line of Prompt
    echo -n (set_color $bar_color)"└─"
    if [ "$st" = 0 ]
        echo -n (set_color brblue)"$symbol"(set_color normal)
    else
        echo -n (set_color brred)"$symbol"(set_color normal)
    end
    # }}} #

    # printf 'COLUMNS:%s WIDTHS:%s TOTAL_WIDTH:%s' "$COLUMNS" "$__top_widths" "$__total_top_width"
end

function fish_right_prompt
    set -l st $status

    if [ $st != 0 ];
        echo (set_color red) ↵ $st(set_color normal)
    end
end

# vim: set fdm=marker et ts=4 sw=4:
