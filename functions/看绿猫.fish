function 看绿猫
watch -c -n 1 'curl -s \'https://api.live.bilibili.com/xlive/web-room/v1/dM/gethistory?roomid=5208231&room_type=0\'|jq \'.data.room.[]|"[\''\e\[2m'\'\(.nickname)\''\e\[0m'\'] \''\e\[2m'\'\(.timeline)\''\e\[0m'\'\n\(.text)\n"\' --raw-output'
end
