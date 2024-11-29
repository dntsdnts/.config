function installapk
    adb devices -l
    for z in (string escape (path resolve (adb shell find /storage/emulated/0/Android/data/ -name \*.apk) (fd --exact-depth 1 --glob \*apk /storage/emulated/0/{Download,Documents} ~/downloads ~)))
        echo $z
        if test (read -P'y?' -n1) = y
            set tmp (path resolve (mktemp ~/storage/documents/tmpXXXXXXXX.apk))
            adb shell mv $z $tmp
            and adb install -i com.android.vending $tmp
            and adb shell mv $tmp $z
            or adb install -i com.android.vending $z
            and adb shell rm -v $z
            rm $tmp
        end
    end
end
