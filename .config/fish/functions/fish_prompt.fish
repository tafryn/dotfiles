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

set -g __fish_git_prompt_color brblack

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

# }}} #

#|    Utility Functions                                                    {{{
#|============================================================================

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
    set -l __top_widths     "0"

    set __git_display (string trim (fish_git_prompt))

    if test -n "$SSH_CONNECTION" -o -n "$SSH_CLIENT"
        set bar_color yellow
        set __ssh_display (set_color brblack)"("(set_color normal)"$USER@"(set_color $bar_color)"$__fish_prompt_hostname"(set_color brblack)")"(set_color $bar_color)"─"(set_color normal)
        set -a __top_widths (__display_width "$__ssh_display")
    end

    #|    First Line of Prompt                                                 {{{
    #|============================================================================
    
    # Print abbreviated working directory 
    set -l __top_prompt (set_color $bar_color)"┌─"
    set -la __top_prompt (set_color brblack)"("(set_color green)(prompt_pwd)(set_color brblack)")"
    set -la __top_prompt (set_color $bar_color)"─"(set_color normal)

    # Print git display if relevant 
    set -la __top_prompt (string trim $__git_display)

    # Adjust length of horizontal span to account for top line elements.
    set -la __top_widths (__display_width (string join "" $__top_prompt))

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
end

function fish_right_prompt
    set -l st $status

    if [ $st != 0 ];
        echo (set_color red) ↵ $st(set_color normal)
    end
end

# vim: set fdm=marker et ts=4 sw=4:
