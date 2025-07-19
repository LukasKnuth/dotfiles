# Fish Shell

I have moved from Zsh to Fish, mostly for its simplicity.
It includes all features I want out of the box.

## Standard Shell

on macOS:

1. Install `fish` via `brew` (see Brewfile in this repo)
2. Add the path (default: `/opt/homebrew/bin/fish`) to `/etc/shells` (requires root)
3. Activate for account using `chsh -s /opt/homebrew/bin/fish`

Any terminal on the system (including default iTerm) should now use Fish.

NOTE: Not all Termianls support all features of Fish/tools used in my config. Use Wezterm (see this Repo) for best results.

## Dependencies

To make the whole Fish configuration work, the following tools must also be installed on the system:

- [starship](https://starship.rs/) for the prompt
- [eza](https://github.com/eza-community/eza) as `ls` replacement
- [direnv](https://github.com/direnv/direnv) for environment variables per folder

**Strongly suggested**, the main shell will still work but some functions might not

- [fzf](https://github.com/junegunn/fzf) for interactive table picker
- [helix](https://github.com/helix-editor/helix/) as default `$EDITOR` (see its config)
