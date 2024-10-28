function 2webp
set conf ~/.config/2webp
set list (cat $conf)
set argv $argv/** storage/pictures/pixiv/** storage/pictures/waifu2x/** storage/pictures/fanbox/** storage/dcim/Screenshots/** storage/movies/ScreenRecorder/**
for f in $argv
file -i $f | grep -P image/jpeg\|image/png
and ! string match -q (sha1sum -b < $f) $list
#and ! test -e $f.webp
and begin
set s (stat -c %s $f)
set t (date -r $f +%F\ %X.%N\ %z)
ffmpeg -v level -stats -hide_banner -r 100 -i $f -c libwebp -pix_fmt yuva420p -quality 100 $f.webp -y
or begin
rm $f.webp
break
end
set _s (stat -c %s $f.webp)
if test $_s -gt 8 -a $_s -lt $s
touch -amcd $t $f.webp
mv $f.webp $f
else
echo \x1b\[31mlow quality\x1b\[0m
rm $f.webp
sha1sum -b <$f >>$conf
end
end
end
end
