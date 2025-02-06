function funces --wraps=funced\ \$argv\nfuncsave\ \$argv\[1\] --description 'alias funced&&funcsave'
    EDITOR=fish funced $argv
    and funcsave $argv[1]
end
