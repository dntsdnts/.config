function unicode.tagify
    bat | iconv -t UTF-32BE | xxd -p -c4 | sed -E 's/^0000/000e/' | xxd -p -r | iconv -f UTF-32BE
end
