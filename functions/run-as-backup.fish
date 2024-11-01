function run-as-backup
    argparse -N 1 -- $argv
    or return 1
    set -l _id (adb shell pm list packages -U|rg $argv|rg -o \\d+\$)
    adb install-multiple -i @null\n"qrqr $_id 1 /data/user/0/$argv/ default:targetSdkVersion=28 none 0 0 1 @null" (adb shell pm list packages -f|rg $argv|rg -o /data/.\*/)*.apk
    adb shell run-as qrqr tar -c . >$argv.appdata
end
