# Adds the Brew installed tools to `PATH`. Must run first.
# 
# This is the default for Apple Silicon.
# If more flexible setup is required, see the oh-my-zsh plugin
local BREW_LOCATION="/opt/homebrew/bin/brew"
eval "$("$BREW_LOCATION" shellenv)"

