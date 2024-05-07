# VS Code

This app is a bit silly: it stores its user configuration in different places for Linux/macOS.
This makes it very hard to get it working with stow.

## How it's done

Instead of using the default directory for user data, we set one explicitly with the `--user-data-dir` argument.
This argument is set in the alias defined through the `.zsh_setup.d`-script in this folder.

The actual user data is placed into `~/.MyVSCode`, which was chosen because it doesn't clash with either Linux or macOS defaults.

**NOTE**: This will work correctly when VSCode is launched from the CLI via `code` command. It probably won't work correctly when launching it from the Desktop entry.

## Extensions

Sadly, extensions aren't simply stored in a file and then automatically installed on launch.
Instead, we save/install them manually:

- Save currently installed extensions: `code --list-extensions > file.txt`
- Install everything: 

# References

* https://stackoverflow.com/questions/70396384/
  - macOS stores user data in `~/Library/Application Support/Code/User/` by default
  - Linux stores it under `~/.config/Code`

* https://anhari.dev/blog/saving-vscode-settings-in-your-dotfiles
