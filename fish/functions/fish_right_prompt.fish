function fish_right_prompt
    command git rev-parse --is-inside-work-tree >/dev/null 2>&1; or return

    # Colors
    set -l fg (set_color d3c6aa)
    set -l bg_git (set_color -b 3a515d)
    set -l sep (set_color 3a515d)
    set -l normal (set_color normal)

    set -l branch (command git symbolic-ref --short HEAD 2>/dev/null \
        || command git rev-parse --short HEAD 2>/dev/null)

    command git diff --quiet --ignore-submodules --; or set dirty "+"

    echo -n "$sep$normal"
    echo -n "$bg_git$fg  $branch"

    if set -q dirty
        echo -n " +"
    end

    echo -n " $normal"
end
