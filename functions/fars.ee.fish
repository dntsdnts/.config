function fars.ee --wraps='curl -Fc=@- $argv https://fars.ee' --wraps='curl -Fc=@- https://fars.ee' --description 'alias fars.ee=curl -Fc=@- https://fars.ee'
    curl -Fc=@(bat|psub) $argv https://fars.ee
end
