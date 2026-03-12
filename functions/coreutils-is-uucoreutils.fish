function coreutils-is-uucoreutils
    for c in (uu-coreutils --list)
        alias (string escape -n $c) uu-$c
    end
end
