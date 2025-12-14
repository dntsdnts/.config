# Print an optspec for argparse to handle cmd's options that are independent of any subcommand.
function __fish_wormhole_rs_global_optspecs
    string join \n v/verbose h/help V/version
end

function __fish_wormhole_rs_needs_command
    # Figure out if the current invocation already has a command.
    set -l cmd (commandline -opc)
    set -e cmd[1]
    argparse -s (__fish_wormhole_rs_global_optspecs) -- $cmd 2>/dev/null
    or return
    if set -q argv[1]
        # Also print the command, so this can be used to figure out what it is.
        echo $argv[1]
        return 1
    end
    return 0
end

function __fish_wormhole_rs_using_subcommand
    set -l cmd (__fish_wormhole_rs_needs_command)
    test -z "$cmd"
    and return 1
    contains -- $cmd[1] $argv
end

complete -c wormhole-rs -n __fish_wormhole_rs_needs_command -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c wormhole-rs -n __fish_wormhole_rs_needs_command -s h -l help -d 'Print help'
complete -c wormhole-rs -n __fish_wormhole_rs_needs_command -s V -l version -d 'Print version'
complete -c wormhole-rs -n __fish_wormhole_rs_needs_command -f -a send -d 'Send a file or a folder'
complete -c wormhole-rs -n __fish_wormhole_rs_needs_command -f -a tx -d 'Send a file or a folder'
complete -c wormhole-rs -n __fish_wormhole_rs_needs_command -f -a receive -d 'Receive a file or a folder'
complete -c wormhole-rs -n __fish_wormhole_rs_needs_command -f -a rx -d 'Receive a file or a folder'
complete -c wormhole-rs -n __fish_wormhole_rs_needs_command -f -a send-many -d 'Send a file to many recipients'
complete -c wormhole-rs -n __fish_wormhole_rs_needs_command -f -a forward -d 'Forward ports from one machine to another'
complete -c wormhole-rs -n __fish_wormhole_rs_needs_command -f -a completion -d 'Generate shell completions for the wormhole CLI'
complete -c wormhole-rs -n __fish_wormhole_rs_needs_command -f -a help
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send" -l code -d 'Enter a code instead of generating one automatically' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send" -s c -l code-length -d 'Length of code (in bytes/words)' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send" -l rename -l name -d 'Suggest a different name to the receiver to keep the file\'s actual name secret. Not allowed when sending more than one file' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send" -s h -l help -d 'Print help'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send" -s V -l version -d 'Print version'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand tx" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand tx" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand tx" -l code -d 'Enter a code instead of generating one automatically' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand tx" -s c -l code-length -d 'Length of code (in bytes/words)' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand tx" -l rename -l name -d 'Suggest a different name to the receiver to keep the file\'s actual name secret. Not allowed when sending more than one file' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand tx" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand tx" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand tx" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand tx" -s h -l help -d 'Print help'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand tx" -s V -l version -d 'Print version'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand receive" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand receive" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand receive" -l out-dir -d 'Store transferred file or folder in the specified directory. Defaults to $PWD' -r -f -a "(__fish_complete_directories)"
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand receive" -l noconfirm -l yes -d 'Accept file transfer without asking for confirmation'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand receive" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand receive" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand receive" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand receive" -s h -l help -d 'Print help'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand receive" -s V -l version -d 'Print version'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand rx" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand rx" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand rx" -l out-dir -d 'Store transferred file or folder in the specified directory. Defaults to $PWD' -r -f -a "(__fish_complete_directories)"
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand rx" -l noconfirm -l yes -d 'Accept file transfer without asking for confirmation'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand rx" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand rx" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand rx" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand rx" -s h -l help -d 'Print help'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand rx" -s V -l version -d 'Print version'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send-many" -s n -l tries -d 'Only send the file up to n times, limiting the number of people that may receive it. These are also the number of tries a potential attacker gets at guessing the password' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send-many" -l timeout -d 'Automatically stop providing the file after a certain amount of time' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send-many" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send-many" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send-many" -l code -d 'Enter a code instead of generating one automatically' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send-many" -s c -l code-length -d 'Length of code (in bytes/words)' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send-many" -l rename -l name -d 'Suggest a different name to the receiver to keep the file\'s actual name secret. Not allowed when sending more than one file' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send-many" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send-many" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send-many" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send-many" -s h -l help -d 'Print help'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand send-many" -s V -l version -d 'Print version'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and not __fish_seen_subcommand_from serve open connect" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and not __fish_seen_subcommand_from serve open connect" -s h -l help -d 'Print help'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and not __fish_seen_subcommand_from serve open connect" -s V -l version -d 'Print version'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and not __fish_seen_subcommand_from serve open connect" -f -a serve -d 'Make the following ports of your system available to your peer'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and not __fish_seen_subcommand_from serve open connect" -f -a open -d 'Make the following ports of your system available to your peer'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and not __fish_seen_subcommand_from serve open connect" -f -a connect -d 'Connect to some ports forwarded to you'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from serve" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from serve" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from serve" -l code -d 'Enter a code instead of generating one automatically' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from serve" -s c -l code-length -d 'Length of code (in bytes/words)' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from serve" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from serve" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from serve" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from serve" -s h -l help -d 'Print help'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from serve" -s V -l version -d 'Print version'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from open" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from open" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from open" -l code -d 'Enter a code instead of generating one automatically' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from open" -s c -l code-length -d 'Length of code (in bytes/words)' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from open" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from open" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from open" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from open" -s h -l help -d 'Print help'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from open" -s V -l version -d 'Print version'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from connect" -s p -l port -d 'Bind to specific ports instead of taking random free high ports. Can be provided multiple times' -r
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from connect" -l bind -d 'Bind to a specific address to accept the forwarding. Depending on your system and firewall, this may make the forwarded ports accessible from the outside' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from connect" -l relay-server -l relay -d 'Use a custom relay server (specify multiple times for multiple relays)' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from connect" -l rendezvous-server -d 'Use a custom rendezvous server. Both sides need to use the same value in order to find each other' -r -f
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from connect" -l noconfirm -l yes -d 'Accept the forwarding without asking for confirmation'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from connect" -l force-direct -d 'Disable the relay server support and force a direct connection'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from connect" -l force-relay -d 'Always route traffic over a relay server. This hides your IP address from the peer (but not from the server operators. Use Tor for that)'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from connect" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from connect" -s h -l help -d 'Print help'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand forward; and __fish_seen_subcommand_from connect" -s V -l version -d 'Print version'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand completion" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand completion" -s h -l help -d 'Print help'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand completion" -s V -l version -d 'Print version'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand help" -s v -l verbose -d 'Enable logging to stdout, for debugging purposes'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand help" -s h -l help -d 'Print help'
complete -c wormhole-rs -n "__fish_wormhole_rs_using_subcommand help" -s V -l version -d 'Print version'
