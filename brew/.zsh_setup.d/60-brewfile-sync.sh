# Automatically dump current Brewfile if changes are made to the system
# Functions are available to execute just like commands.
# Mostly stolen from: https://github.com/Homebrew/brew/issues/3933#issuecomment-373771217

brew() {
  local dump_commands=('install' 'uninstall') # Include all commands that should do a brew dump
  local main_command="${1}"

  "$HOMEBREW_PREFIX/bin/brew" ${@}

  for command in "${dump_commands[@]}"; do
    [[ "${command}" == "${main_command}" ]] && "$HOMEBREW_PREFIX/bin/brew" bundle dump --global --force --describe
  done
}

