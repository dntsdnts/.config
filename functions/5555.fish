function 5555
    set -l ips 127.0.0.1:$argv 127.0.0.1:5555 127.0.0.1:(rustscan -g -a(ifconfig 2>/dev/null|rg -oPU '(?<=inet\s)(\S*)') -r37000-44000|rg -o '\d{5}')
    for s in $ips
        adb disconnect
        adb connect $s
        adb tcpip 5555
        and break
    end
    sleep 1
    adb kill-server
    adb shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh
    adb shell sh /sdcard/Android/data/com.omarea.vtools/up.sh
    adb shell 'output=$(pm path me.piebridge.brevent); export CLASSPATH=${output#*:}; app_process /system/bin me.piebridge.brevent.server.BreventServer bootstrap; /system/bin/sh /data/local/tmp/brevent.sh'
end
