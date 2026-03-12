function funcbody --wraps='functions $argv[1] | head -n-1 | tail +3 | fish_indent --ansi' --description 'alias funcbody functions $argv[1] | head -n-1 | tail +3 | fish_indent --ansi'
    functions $argv[1] | head -n-1 | tail +3 | fish_indent --ansi
end
