function mcdir --wraps='mkdir;cd' --description 'alias mcdir=mkdir;cd'
    if test -e $argv[1]
        set_color cyan
        echo $argv[1] exists!
    else mkdir -p $argv[1]
    end
    cd $argv[1]
end
