function shizuku-start
    adb shell '$(dirname $(pm path frb.axeron.manager|cut -d: -f2))/lib/arm64/libaxeron.so'
    or adb shell '$(dirname $(pm path moe.shizuku.privileged.api|cut -d: -f2))/lib/arm64/libshizuku.so'
end
