function logcat --wraps='adb shell logcat -vlong,color' --wraps='adb -s emulator-5554 shell logcat -v color,long' --description 'alias logcat adb -s emulator-5554 shell logcat -v color,long'
    adb -s (adb devices|head -2|tail -1|cut -d\t  -f1) shell logcat -v color,long $argv
end
