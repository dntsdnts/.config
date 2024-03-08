function alia --description 'alias alias=alias $argv&&funcsave $argv'
    alias $argv
    and funcsave $(string split -f1 = $argv)
end
