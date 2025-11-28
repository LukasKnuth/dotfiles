# Brew (OS X package manager)

The Brewfile contains all packages installed through `brew`. It's a simple way to set up macOS from scratch.
This package also contains a Script to automatically update the Brewfile every time a new package is installed.

## Installing without adding

For dependencies only installed as deps e.g. to compile a C program:

```bash
brew install --as-dependency [formulae]
```

This will install the formula but not add it to the Brewfile (see below).

## Removing incorrect entries

Dumping the current Brewfile can contain packages originally installed as dependencies.
The `brew bundle dump` command includes a formula if:

- `installed_on_request` is true **OR**
- `installed_as_dependency` is false

Bot can be changed _manually_ by editing the `.json` file:

```bash
# Manually update
hx /opt/homebrew/Cellar/[formulae]/*/INSTALL_RECEIPT.json
# ONLY marks as "not requested" - can still be a dependency
brew tab --no-installed-on-request [formulae]
```

## Installing everything from the file

After stowing the file into the Home directory, run

```bash
brew bundle install --file="$HOME/.Brewfile"
```

**NOTE**: To get this to work unattended, we can use the `SUDO_ASKPASS` variable: It must have the path of an executable/script which prints the password to use to stdout, for example:

```bash
echo "this is my pw"
```

The script must be made executable with `chmod +x script.sh`. Then, run:


```bash
SUDO_ASKPASS=/path/to/pw.sh brew bundle install --file="$HOME/.Brewfile"
```

## Dumping the file manually

```bash
brew bundle dump --global --force --describe
```

This will create a `~/.Brewfile` that contains **all** formulae which where _explicitly_ installed, meaning they are not dependencies of other formulae.

## Brew basics

* Explicitly installed `brew leaves --installed-on-request`

Get descriptions for each entry in the list with:

* Formulae: `brew leaves | xargs brew desc --eval-all`
* Casks: `brew ls --casks | xargs brew desc --eval-all`

# Sources

* https://apple.stackexchange.com/a/154750/369828
* https://apple.stackexchange.com/a/452677/369828
* https://github.com/Homebrew/brew/issues/18754
