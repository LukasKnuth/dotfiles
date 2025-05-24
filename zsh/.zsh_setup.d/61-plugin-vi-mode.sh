# Loads the Zshell Vi Mode Plugin
# https://github.com/jeffreytse/zsh-vi-mode
# `${0:A:h}` takes $0 (the current scripts file path),
# resolves symlinks (the `A`) and drops the basename (`h`)
source "${0:A:h}/_vi-mode.zsh"
