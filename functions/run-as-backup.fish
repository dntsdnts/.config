function run-as-backup
    for arg in $argv
        set -l _ids (adb shell pm list packages -U|rg 'package:([\w.]*'$arg'[\w.]*) uid:(\d+)' -r '$1:$2')
        for _id in $_ids
            set _id (string split : $_id)
            ##adb shell pm uninstall --user 0 com.miui.securitycenter
            adb install-multiple -i @null\n"qrqr $_id[2] 1 /data/user/0/$_id[1]/ default:targetSdkVersion=28 none 0 0 1 @null" base.apk
            ##adb shell pm install-existing --user 0 com.miui.securitycenter
            adb shell run-as qrqr tar -C / -c /data/user/0/$_id[1] >$_id[1].appdata
        end
    end
end
