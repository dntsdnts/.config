function Yuanshen
    read -n1 -P "stop 原神?(y/N)" -l y
    echo \e\[2A
    test $y = y -o $y = Y
    and begin
        adb -s emulator-5554 shell am force-stop com.miHoYo.GenshinImpact
        adb -s emulator-5554 shell am force-stop com.miHoYo.Yuanshen
        set -l cmd '[[ $(du storage/emulated/0/Android/data/com.miHoYo.GenshinImpact/files -s|cut -f1) -gt $(du storage/emulated/0/Android/data/com.miHoYo.Yuanshen/files -s|cut -f1) ]] && rm -rv storage/emulated/0/Android/data/com.miHoYo.Yuanshen/files && mv storage/emulated/0/Android/data/com.miHoYo.GenshinImpact/files storage/emulated/0/Android/data/com.miHoYo.Yuanshen/files && mkdir storage/emulated/0/Android/data/com.miHoYo.GenshinImpact/files'
        echo $cmd | bat -lsh -p
        adb -s emulator-5554 shell $cmd
        read -n1 -P "start 原神?(y/N)" -l y
        test $y = y -o $y = Y
        and adb -s emulator-5554 shell monkey -p com.miHoYo.Yuanshen -vvvvv 1
    end
end
