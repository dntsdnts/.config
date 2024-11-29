function run-as-backup
    argparse -N 1 -- $argv
    or return 1
    set -l _id (adb shell pm list packages -U|rg $argv|rg -o \\d+\$)
    adb shell pm uninstall --user 0 com.miui.securitycenter
    adb install-multiple -i @null\n"qrqr $_id 1 /data/user/0/$argv/files/ default:targetSdkVersion=28 none 0 0 1 @null" base.apk
    adb shell pm install-existing --user 0 com.miui.securitycenter
    adb shell run-as qrqr tar -c . >$argv.appdata
end
