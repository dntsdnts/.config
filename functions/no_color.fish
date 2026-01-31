function no_color --wraps='sed s/\\e\\\\[[0-9\\;][a-zA-Z]//g' --wraps='sed s/\\e\\\\\\[[0-9\\;][a-zA-Z]//g' --wraps='sed s/\\e\\\\\\[[0-9\\;]+[a-zA-Z]//g' --wraps='sed s/\\e\\\\\\[[0-9\\;]\\*[a-zA-Z]//g' --wraps='sed s/\\e\\\\\\[[0-9\\;]\\*m//g' --description 'alias no_color sed s/\\e\\\\\\[[0-9\\;]\\*m//g'
    sed s/\e\\\[[0-9\;]\*m//g $argv
end
