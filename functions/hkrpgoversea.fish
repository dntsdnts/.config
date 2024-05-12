function hkrpgoversea
    read -n1 -P "stop hkrpgoversea?(y/N)" -l y
    echo \e\[2A
    test $y = y -o $y = Y
    and begin
        adb -s emulator-5554 shell am kill com.miHoYo.hkrpg
        adb -s emulator-5554 shell am kill com.HoYoverse.hkrpgoversea
        set -l cmd '[[ $(du storage/emulated/0/Android/data/com.HoYoverse.hkrpgoversea/files -s|cut -f1) -lt $(du storage/emulated/0/Android/data/com.miHoYo.hkrpg/files -s|cut -f1) ]] && rm -rv storage/emulated/0/Android/data/com.HoYoverse.hkrpgoversea/files && mv storage/emulated/0/Android/data/com.miHoYo.hkrpg/files storage/emulated/0/Android/data/com.HoYoverse.hkrpgoversea/files && mkdir storage/emulated/0/Android/data/com.miHoYo.hkrpg/files'
        echo $cmd | bat -lsh -p
        adb -s emulator-5554 shell $cmd
        read -n1 -P "start hkrpgoversea?(y/N)" -l y
        test $y = y -o $y = Y; and adb -s emulator-5554 shell monkey -p com.HoYoverse.hkrpgoversea -vvvvv 10
    end
end
