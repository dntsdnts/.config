function shizuku-start
    adb shell (path dirname (adb shell pm path moe.shizuku.privileged.api|cut -d: -f2))/lib/arm64/libshizuku.so
end
