function GenshinImpact
    read -n1 -P "stop 原神?(y/N)" -l y
    echo \e\[2A
    test $y = y -o $y = Y
    and begin
        adb -s emulator-5554 shell am kill com.miHoYo.GenshinImpact
        adb -s emulator-5554 shell am kill com.miHoYo.Yuanshen
        set -l cmd '[[ $(du storage/emulated/0/Android/data/com.miHoYo.GenshinImpact/files -s|cut -f1) -lt $(du storage/emulated/0/Android/data/com.miHoYo.Yuanshen/files -s|cut -f1) ]] && rm -rv storage/emulated/0/Android/data/com.miHoYo.GenshinImpact/files && mv storage/emulated/0/Android/data/com.miHoYo.Yuanshen/files storage/emulated/0/Android/data/com.miHoYo.GenshinImpact/files && mkdir storage/emulated/0/Android/data/com.miHoYo.Yuanshen/files'
        echo $cmd | bat -lsh -p
        adb -s emulator-5554 shell $cmd
        read -n1 -P "start 原神?(y/N)" -l y
        adb -s emulator-5554 shell monkey -p com.miHoYo.GenshinImpact -vvvvv 10
    end
end
