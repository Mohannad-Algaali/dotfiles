function fish_prompt
	echo ""
	echo ""
    set -l last_status $status

    set -l term_bg 0b3036
    # Foreground (The dark text inside the segments)
    set -l fg (set_color 000000) 
    set -l normal (set_color normal)

    # Background palette (Matches the image)
    set -l bg_blue 00afff   # The bright blue path color
    # set -l bg_dark_green 29a600 # The golden git/branch color
    # set -l bg_teal 0074cc   # The teal root/user color
    # set -l bg_green 00cc3d   # The lime green success color
    # set -l bg_red af0000     # The deep red error color

    set -l bg_colors $bg_blue $bg_dark_green $bg_teal $bg_green
    set -l bg_colors $bg_blue 

 # Error block (brighter red)

    if test $last_status -ne 0

        set_color -b 543a48

        echo -n "$fg ✖ "

        # set_color 543a48
        set_color $bg_teal

        echo -n "/"

    end 

    # Build path
    set -l path (string replace -r "^$HOME" "~" $PWD)
    set -l parts (string split "/" $path)
    set -l count (count $parts)

    set -l i 1
    for part in $parts
        if test -z "$part"
            continue
        end

        set -l idx (math "($i - 1) % 4 + 1")
        set -l bg $bg_colors[$idx]
        
        # Get next background for the arrow transition
        set -l next_idx (math "$i % 4 + 1")
        set -l next_bg $bg_colors[$next_idx]

        # Segment
        set_color -b $bg
        echo -n "$fg $part "
        set -g last_bg $bg
        # Pointy separator
        set_color $bg
        if test $i -eq $count
        else
            set_color -b $next_bg
            echo -n "/"
        end

        set i (math "$i + 1")
    end

    set_color normal
    echo -n "  "
    # echo -n "  ➜ "
    # echo -n " ❯ "
    #
    set_color normal
end
