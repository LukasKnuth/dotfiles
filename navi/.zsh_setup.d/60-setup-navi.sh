# Setting this varaible causes navi to _find_ my cheats that are packaged with the
# dotfiles. It also causes Navi to download cheats from public repos into the default
# directory, outside the dotfiles.
export NAVI_PATH="~/.my_cheats:$(navi info cheats-path)"

# Setup shell integration
eval "$(navi widget zsh)"
