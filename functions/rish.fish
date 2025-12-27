function rish --wraps='RISH_APPLICATION_ID=$TERMUX_APP__PACKAGE_NAME /system/bin/app_process -Djava.class.path=.local/share/shizuku/rish_shizuku.dex /system/bin --nice-name=rish rikka.shizuku.shell.ShizukuShellLoader'
    env RISH_APPLICATION_ID=$TERMUX_APP__PACKAGE_NAME /system/bin/app_process -Djava.class.path=.local/share/shizuku/rish_shizuku.dex /system/bin --nice-name=rish rikka.shizuku.shell.ShizukuShellLoader $argv
end
