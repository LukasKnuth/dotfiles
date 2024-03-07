# Dotfiles

I use [GNU Stow](https://www.gnu.org/software/stow/manual/stow.html#Installing-Packages) to link these into the actual home directory.

```bash
# Always run commands from within this dir
cd dotfiles

# Link config into HOME
stow zsh

# Unlink config
stow -D zsh

# To replace existing config with link
stow zsh --adopt

# After doing some linking/unlinking
chkstow --badlinks
```

## Structure

The folder structure inside this repository is devided by individual applications. Each app has it's own directory.

_Within_ these directories, the folder structure **must match** the structure in the home directory.

```bash
/home/lukas/
└── .config
   └── waybar
      ├── config.jsonc
      └── style.css
```

Is placed under:

```bash
/home/lukas/dotfiles
└─ waybar
  └── .config
     └── waybar
        ├── config.jsonc
        └── style.css
```

## Things to know

These files go into different directories to be picked up by the specific tools.

* `$HOME` resolves to to root home directory, like `/home/lukas`
* `$XDG_CONFIG_HOME` resolves to something like `/home/lukas/.config`

## Inspiration

This was largely inspired by two Blog posts:

* [A decade of dotfiles](https://evanhahn.com/a-decade-of-dotfiles/) by Evan Hahn
* [Using GNU Stow to manage your dotfiles](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) by Brandon Invergo

