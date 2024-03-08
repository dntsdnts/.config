function pkgi --wraps='pacman -Su' --description 'alias pkgi=pacman -Su'
  pacman -Su $argv
        
end
