# Dunst

A notification Daemon on Linux.

This isn't grouped with Sway because you can theoretically use this stand-alone.

## Reference

To have changes take effect _and_ verify that the config is valid, run `dunst` without arguments. It'll print validation errors and the PID of the currently running instance.

To reload, simply `kill <PID>` and then use `notify-send -u <urgecy> "Some test"` to start it again and send a test notification.
