function no_ansi --description 'alias no_color sed s/\\e\\\\\\[[0-9\\;]\\*[a-zA-Z]//g'
    sed s/\e\\\[[0-9\;]\*[a-zA-Z]//g $argv
end
