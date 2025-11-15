function strshuf
    bat | string trim |
        iconv -t UTF-32BE |
        xxd -p -c4 |
        shuf |
        xxd -p -r |
        iconv -f UTF-32BE
end
