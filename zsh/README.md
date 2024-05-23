# Z-Shell

My main Shell is Z-Shell.
I use [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh) as my zsh framework.

## Installation

```bash
brew install zsh # or other means
sh -c "$(curl -fsSL https://install.ohmyz.sh/)" # clones local .oh-my-zsh repo
# Install custom plugins
stow zsh # load my config and theme
```

## Theme

My theme is "gitster", which is bundled with this directory.
It's a custom theme made by [Shashank Mehta](https://github.com/shashankmehta/dotfiles/blob/master/thesetup/zsh/.oh-my-zsh/custom/themes/gitster.zsh-theme).

The theme does **NOT** require any NerdFont fonts to be used by the Terminal.

## Plugins

A few custom plugins are used which do not ship with oh-my-zsh by default:

* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) - suggests commands from history on typing
* [zsh-vi-mode](https://github.com/jeffreytse/zsh-vi-mode) - allows navigating in prompt with VI keybinds

These are shipped with this config for ease of use.

## Update

oh-my-zsh is configured to remind about updates automatically.

Alternatively, `omz update` manually fetches the newest version from github and prints all changes/fixes

## Built-in

Most of these come built into oh-my-zsh as nice helpers to be aware of:

- Pipe into `clipcopy` to copy it to the clipboard (automatically picks correct tool)
- Redirect from `clippaste` to past from the clipboard (automatically picks correct tool)
- `cd -` takes you to the previous directory. `cd -2` takes you two directories back, etc
- To open something with its default application _on the desktop, use the `open` function
- To get absolute path to a file, run `realpath file`

## References

- https://thevaluable.dev/zsh-install-configure-mouseless/
  - Ideas and examples of how to configure ZSH _without_ oh-my-zsh
- https://zsh.sourceforge.io/Doc/Release/Options.html
  - List of ZSH _built-in_ options to influence how the shell handles
