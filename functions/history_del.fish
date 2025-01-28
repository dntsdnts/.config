function history_del --wraps='history delete'
fish -c "history delete $argv"
fish -c "echo all|history delete -p $_"
history merge
end
