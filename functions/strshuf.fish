function strshuf
    iconv -t UTF-32 | basenc --base16 -w8 | tail +2 | shuf | basenc --base16 -d | iconv -f UTF-32
end
