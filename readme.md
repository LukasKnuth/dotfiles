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

The folder structure inside this repository is divided by individual applications. Each app has its own directory.

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

### Convention: Shell setup

Every tool can add scripts to be included in shell startup into the `.zsh_setup.d` directory, like this:

```bash
/home/lukas/dotfiles/git
├─ .gitconfig
└─ .zsh_setup.d
  └─ 60-git-aliases.sh
```

These scripts are then linked into `~/.zsh_setup.d` when the application config is linked via `stow`.
The `.zshrc` will source all files from this directory on launch.

This allows applications to run additional setup logic only when its config is actually linked.
This keeps the zsh config short and free of dependencies on installed tools.

**What do the numbers mean?**
This is modeled after init scripts in Unix systems used to work.
Every script-name can start with a number, which influences the file-ordering and therefor the order in which the scripts are sourced startup.

| Range | Meaning | Example |
| --- | --- | --- |
| 0-9 | Reserved for special things that **must** run first | Add `brew`-path to `PATH` |
| 10-19 | Setup configuration that other scripts could depend on | `export $EDITOR` |
| 20-29 | Setup applications that other scripts could depend on | `eval $(direnv --setup)` |
| 30-49 | Reserved |
| 50-59 | Scripts that depends on previous setup scripts | Direnv extra helpers |
| 60-69 | Independent scripts with no dependencies | `alias l='eza'` |

## Things to know

These files go into different directories to be picked up by the specific tools.

* `$HOME` resolves to to root home directory, like `/home/lukas`
* `$XDG_CONFIG_HOME` resolves to something like `/home/lukas/.config`

## Inspiration

This was largely inspired by two Blog posts:

* [A decade of dotfiles](https://evanhahn.com/a-decade-of-dotfiles/) by Evan Hahn
* [Using GNU Stow to manage your dotfiles](https://brandon.invergo.net/news/2012-05-26-using-gnu-stow-to-manage-your-dotfiles.html) by Brandon Invergo

