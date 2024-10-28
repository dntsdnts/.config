function hkrpg
    read -n1 -P "stop hkrpg?(y/N)" -l y
    echo \e\[2A
    test $y = y -o $y = Y
    and begin
        adb -s emulator-5554 shell am force-stop com.miHoYo.hkrpg
        adb -s emulator-5554 shell am force-stop com.HoYoverse.hkrpgoversea
        set -l cmd '[[ $(du storage/emulated/0/Android/data/com.HoYoverse.hkrpgoversea/files -s|cut -f1) -gt $(du storage/emulated/0/Android/data/com.miHoYo.hkrpg/files -s|cut -f1) ]] && rm -rv storage/emulated/0/Android/data/com.miHoYo.hkrpg/files && mv storage/emulated/0/Android/data/com.HoYoverse.hkrpgoversea/files storage/emulated/0/Android/data/com.miHoYo.hkrpg/files && mkdir storage/emulated/0/Android/data/com.HoYoverse.hkrpgoversea/files'
        echo $cmd | bat -lsh -p
        adb -s emulator-5554 shell $cmd
        read -n1 -P "start hkrpg?(y/N)" -l y
        test $y = y -o $y = Y
        and adb -s emulator-5554 shell monkey -p com.miHoYo.hkrpg -vvvvv 1
    end
end
