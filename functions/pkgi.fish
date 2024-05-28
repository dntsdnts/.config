function pkgi --wraps='pacman -Su' --description 'alias pkgi=pacman -Su'
    pacman -S $argv
end
