# Interactively pick formulae/casks to be upgraded.
# This is an interactive alternative to pinning formulae (which doesn't work for casks)
# Taken from: https://github.com/orgs/Homebrew/discussions/3786#discussioncomment-3875187
# And https://github.com/junegunn/fzf/discussions/4358#discussioncomment-12904554
function brew-pick --wraps brew -d "Interactively pick casks/formulae to upgrade"
    set -l outdated $(command brew outdated)
    if test -n "$outdated"
        printf "%s\n" $outdated | fzf --multi \
            --preview 'brew info {} --json | jq ".[] | pick(.name, .desc, .versions.stable, .installed.[].version)"' \
            # TODO does the tripple <<< work in fish? What to use instead?
            --bind 'enter:transform:(( FZF_SELECT_COUNT )) && echo accept || echo ignore' | xargs --no-run-if-empty brew upgrade
    end
end
