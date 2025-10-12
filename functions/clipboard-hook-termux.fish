function clipboard-hook-termux
    fish -c "termux-clipboard-set <(termux-clipboard-get | $argv | psub)"
end
