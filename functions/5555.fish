function 5555
    set -l ips 127.0.0.1:(rustscan -g -a(ifconfig 2>/dev/null|rg -oPU '(?<=inet\s)(\S*)') -r37000-44000|rg -o '\d{5}')
    for ip in $ips
        adb connect $ip
        adb -s $ip tcpip 5555
    end
    adb kill-server
    adb devices -l
    adb shell sh /storage/emulated/0/Android/data/moe.shizuku.privileged.api/start.sh
end
