# Suggests any dirty Git files first when tab-completing the Helix command.
complete -c $EDITOR -d "Git dirty" --condition "git rev-parse --is-inside-work-tree &>/dev/null" --force-files --keep-order --arguments "(git sx)"
