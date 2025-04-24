# Interactively pick formulae/casks to be upgraded.
# This is an interactive alternative to pinning formulae (which doesn't work for casks)
# Taken from: https://github.com/orgs/Homebrew/discussions/3786#discussioncomment-3875187
# And https://github.com/junegunn/fzf/discussions/4358#discussioncomment-12904554

brew-pick() {
  local outdated=$($HOMEBREW_PREFIX/bin/brew outdated)
  if [[ -n "$outdated" ]]
  then
    fzf --multi \
      --bind 'enter:transform:(( FZF_SELECT_COUNT )) && echo accept || echo ignore' \
      <<< $outdated | xargs --no-run-if-empty brew upgrade
  fi
}

