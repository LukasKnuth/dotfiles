# Mostly stolen from: https://github.com/Homebrew/brew/issues/3933#issuecomment-373771217
function brew --wraps brew -d "Runs brew and automatically sync the global BREWFILE"
    # Include all commands that should do a brew dump
    set -l dump_subcommands install uninstall tap untap

    # Run the actual command
    command brew $argv

    # Dump the new brewfile if its in the list
    for command in $dump_subcommands
        if test $command = $argv[1]
            command brew bundle dump --global --force --describe
        end
    end
end
