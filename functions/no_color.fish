function no_color --wraps='sed s:\\x1b\\[[0-9;]+m::g' --description 'alias no_color sed s:\\x1b\\[[0-9;]+m::g'
    sed -E "s:\x1b\\[[0-9;]*[mACG]::g;s:(.)\x08\1:\x1b[1m\1\x1b[0m:g"
end
