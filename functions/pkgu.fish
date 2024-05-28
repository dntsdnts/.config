function pkgu --wraps='pacman -Syu' --description 'alias pkgu=pacman -Syu'
    pacman -Syu $argv
end
