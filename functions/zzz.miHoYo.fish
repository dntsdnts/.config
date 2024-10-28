function zzz.miHoYo
    read -n1 -P "stop zzz?(y/N)" -l y
    echo \e\[2A
    test $y = y -o $y = Y
    and begin
        adb -s emulator-5554 shell am force-stop com.miHoYo.Nap
        adb -s emulator-5554 shell am force-stop com.HoYoverse.Nap
        set -l cmd '[[ $(du storage/emulated/0/Android/data/com.miHoYo.Nap/files -s|cut -f1) -lt $(du storage/emulated/0/Android/data/com.HoYoverse.Nap/files -s|cut -f1) ]] && rm -rv storage/emulated/0/Android/data/com.miHoYo.Nap/files && mv storage/emulated/0/Android/data/com.HoYoverse.Nap/files storage/emulated/0/Android/data/com.miHoYo.Nap/files && mkdir storage/emulated/0/Android/data/com.HoYoverse.Nap/files'
        echo $cmd | bat -lsh -p
        adb -s emulator-5554 shell $cmd
        read -n1 -P "start zzz?(y/N)" -l y
        test $y = y -o $y = Y
        and adb -s emulator-5554 shell monkey -p com.miHoYo.Nap -vvvvv 1
    end
end
