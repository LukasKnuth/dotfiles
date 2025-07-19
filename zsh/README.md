# Zsh

> [!NOTE]
> I recently switched to the [Fish Shell](../fish) as my main shell.

I use no frameworks or package managers.

## Installation

This setup has the following dependencies.
These **MUST** be installed and in `PATH`:

- [Zsh](https://www.zsh.org/) - on macOS, verify the version isn't too old
- [Starship](https://starship.rs) for the prompt
- [fzf](https://github.com/junegunn/fzf) for better history search

The setup does **NOT** require any NerdFont fonts to be used by the Terminal.

### Extensions

The main `.zshrc` is set up to source files from `~/.zsh_setup.d`.
Files are sourced in natural sorting order, as outlined in the main repo Readme.

### Plugins

Only a few plugins are used.
They are loaded via the `~/.zsh_setup.d` mechanism.

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - suggests commands from history on typing
* [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode) - allows navigating in prompt with VI keybinds

These are included in this repository directly for ease of use.

### Helpers

Some helpers are setup to make working with Zsh nicer

- Pipe into `clipcopy` to copy it to the clipboard (automatically picks correct tool)
- Redirect from `clippaste` to past from the clipboard (automatically picks correct tool)
- To get absolute path to a file, run `realpath file`

## References

- https://thevaluable.dev/zsh-install-configure-mouseless/
  - Ideas and examples of how to configure ZSH _without_ oh-my-zsh
- https://zsh.sourceforge.io/Doc/Release/Options.html
  - List of ZSH _built-in_ options to influence how the shell handles
- https://github.com/z0rc/dotfiles/
  - Dotfiles repo that is also without any framework
