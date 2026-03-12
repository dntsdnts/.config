function p --wraps='proot-distro login ...' --description 'alias p=proot-distro login ...'
    proot-distro login $argv[1] -- $argv[2..-1]
end
