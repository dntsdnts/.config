function gitcd --wraps='git clone $argv[1] $argv[2]'
    git clone $argv[1] $argv[2] $argv[3..]
    and if test ! -z $argv[2]; and $argv[2]/; or cd (path basename $argv[1])
    end
end
