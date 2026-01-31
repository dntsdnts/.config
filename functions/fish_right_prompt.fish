function fish_right_prompt
    set_color $fish_color_autosuggestion 2>/dev/null; or set_color 555
    echo [pid:$fish_pid]
    date -Iseconds
    set_color normal
end
