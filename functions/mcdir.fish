function mcdir --description 'alias mcdir=mkdir;cd'
    if test -e $argv[1]
        echo (set_color black)$argv[1] exists!
    else mkdir -p $argv[1]
    end
    cd $argv[1]
end
