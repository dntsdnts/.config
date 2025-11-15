function 5555
    set -l ips 127.0.0.1
    adb reconnect device
    adb reconnect offline
    adb devices | rg emulator-5554
    or while :
        set ips $ips:(rustscan -g -a$ips -r37000-44000 -t2000 -- -Pn|rg -o '\d{5}')
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
        adb -s emulator-5554 get-state | rg device
        or begin
            read s \
                -P(string unescape '\e\[32mip:port\e\(B\e\[m\=\ ') \
                -f
            s=$s adb connect $s
            adb tcpip 5555
            adb disconnect $s
            adb shell sleep 1
        end
        adb -s emulator-5554 shell '
echo -e \\\x1b[33m[scene];sh /sdcard/Android/data/com.omarea.vtools/up.sh;
echo -e \\\x1b[35m[brevent];output=$(pm path me.piebridge.brevent); export CLASSPATH=${output#*:}; app_process /system/bin me.piebridge.brevent.server.BreventServer bootstrap; /system/bin/sh /data/local/tmp/brevent.sh;
echo -e \\\x1b[36m[shizuku]'
        shizuku-start
        adb shell settings put global adb_wifi_enabled 0
        echo \x1b\[30m
        and break
    end
end
