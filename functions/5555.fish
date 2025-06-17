function 5555
    set -l ips 127.0.0.1
    adb reconnect device
    adb reconnect offline
    adb devices | rg emulator-5554
    or while :
        set ips $ips:(rustscan -g -a$ips -r37000-44000|rg -o '\d{5}')
        _ $ips,' '
        for s in $ips
            adb connect $s
            and adb tcpip 5555
            sleep 0.5
            adb disconnect $s
        end
        or continue
        adb kill-server
        adb start-server
        while :
            adb -s emulator-5554 get-state | rg device
            and break
        end
        for s in emulator-5554
            adb -s $s shell 'sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh;sh /sdcard/Android/data/com.omarea.vtools/up.sh;output=$(pm path me.piebridge.brevent); export CLASSPATH=${output#*:}; app_process /system/bin me.piebridge.brevent.server.BreventServer bootstrap; /system/bin/sh /data/local/tmp/brevent.sh;settings put global adb_wifi_enabled 0'
        end
        and break
    end
end
