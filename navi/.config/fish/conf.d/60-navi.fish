if status is-interactive
    # Navi setup
    set -gx NAVI_PATH "~/.my_cheats:$(navi info cheats-path)"
    navi widget fish | source
end
