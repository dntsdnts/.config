function funces --wraps=funced\ \$argv\nfuncsave\ \$argv\[1\] --description 'alias funced&&funcsave'
    EDITOR=fish funced $argv
    and begin
        set -l b \e\[1\;5m
        set -l n \e\[0m
        switch (read -l -n1 -P write\ $b$argv[1]$n?[𝐘/n])
            case '' y Y
            case '*'
                return -1
        end
    end
    and funcsave $argv[1]
end
