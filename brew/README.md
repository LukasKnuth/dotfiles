# Brew (OS X package manager)

The Brewfile contains all packages installed through `brew`. It's a simple way to set up macOS from scratch.
This package also contains a Script to automatically update the Brewfile every time a new package is installed.

## Dumping the file manually

```bash
brew bundle dump --global --force --describe
```

This will create a `~/.Brewfile` that contains **all** formulae which where _explicitly_ installed, meaning they are not dependencies of other formulae.

## Installing everything from the file

After stowing the file into the Home directory, run

```bash
brew bundle install --file="$HOME/.Brewfile"
```

## Brew basics

* Find a with `brew search <pkg>`
* Install with `brew install <pkg>`
* Uninstall with `brew uninstall <pk>`
* List all installed `brew leaves --installed-on-request`
* List taps (sources) `brew tap`
* Remove tap `brew untap <tap>`

For a bit more usability, it's also possible to get descriptions with installed lists:

* Formulae: `brew leaves | xargs brew desc --eval-all`
* Casks: `brew ls --casks | xargs brew desc --eval-all`

# Sources

* https://apple.stackexchange.com/a/154750/369828
* https://apple.stackexchange.com/a/452677/369828
