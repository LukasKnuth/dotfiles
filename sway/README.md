# Sway

Desktop environment with tiling window manager.

Also contains the configuration for other sway tooling that works in tandem with the Window Manager:

- Swaylock: Locks the screen
- Swayidle: Executes commands after X-seconds IDLE (such as `swaylock`)

## Troubleshooting

**After launch, trackpad can't scroll or click**

There _seems_ to be nothing wrong with the config. Running `swaymsg -t get_inputs` lists the touchpad as found and configured. What helps is to restart sway via `swaymsg exit`, which effectively logs you out.

After logging in again, no problems anymore.
