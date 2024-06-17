# Setting this varaible causes navi to _find_ my cheats that are packaged with the
# dotfiles. It also causes Navi to download cheats from public repos into the default
# directory, outside the dotfiles.
export NAVI_PATH="~/.my_cheats:$(navi info cheats-path)"

# Setup shell integration
eval "$(navi widget zsh)"

# The default "bindkey" command in the eval above doesn't set the keymap. I _think_
# this is why this doesn't work if the zsh-vi-mode plugin is loaded. We specfically
# set the CTRL-G keybind for the VI INSert mode.
bindkey -M viins '^g' _navi_widget

