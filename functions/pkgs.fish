function pkgs --wraps='pacman -Ss' --description 'alias pkgs pacman -Ss'
  pacman -Ss $argv
        
end
