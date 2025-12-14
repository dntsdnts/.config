function p --wraps='proot-distro login arch -- ' --wraps='proot-distro login $argv[1] --' --description 'alias p=proot-distro login $argv[1] --'
    proot-distro login $argv[1] -- $argv[2..-1]

end
