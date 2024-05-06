# Amethyst

A tiling window manager for macOS.

## Configuration

This tool is a bit silly. It stores its configuration in the macOS "defaults" registry but _also_ supports reading it from a config file.

If the config file is present, it will read from it and update the "defaults" storage. This will also prompt when opening the config dialog - because changes made there are **NOT** written to the dotfile!

### Drift

This system can cause issues. To alleviate them, the author suggests to:

1. Quit the application
2. Run `defaults delete com.amethyst.Amethyst.plist` to fully clear the current config
3. Start again. It should then load it again from `~/.amethyst.yaml`

During my migration from the UI configuration to the dotfile, I did not observe this issue.

## References

- Docs: https://github.com/ianyh/Amethyst/blob/development/docs/configuration-files.md
- Sample: https://github.com/ianyh/Amethyst/blob/development/.amethyst.sample.yml
- Defaults: https://github.com/ianyh/Amethyst/blob/development/Amethyst/default.amethyst
