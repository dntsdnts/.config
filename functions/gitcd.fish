function gitcd
    git clone $argv[1] $argv[2];
    if test -z $argv[2]; and $argv[2]/; or cd (path basename $argv[1])
    end
end
