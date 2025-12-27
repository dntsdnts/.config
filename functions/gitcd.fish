function gitcd --wraps='git clone $argv[1] $argv[2]'
    git clone $argv[1] $argv[2] $argv[3..]
    and if test ! -z "$argv[2]"
        cd $argv[2]
    else
        cd (basename -s .git $argv[1])
    end
end
