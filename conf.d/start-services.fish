set -gx SVDIR $PREFIX/var/service
set -gx LOGDIR $PREFIX/var/log
service-daemon start >/dev/null 2>&1 &
