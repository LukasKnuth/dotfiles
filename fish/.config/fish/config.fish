# `conf.d/*.fish` integrations setup, sourced in natural order. See main repo README for information
# `config.fish` (this file): general Fish shell configuration ONLY
#  NOTE: `config.fish` is loaded **AFTER** files in `conf.d`!
# `completions/*.fish` automatically loaded, provide completions for command with same name as file
# `functions/*.fish` automatically run when command with same name as file is executed
# See https://fishshell.com/docs/current/index.html#configuration

# Disable Fish greeting
set fish_greeting ""

# Only run if we are in an interactive shell
if status is-interactive
    # Color changes
    set fish_color_valid_path white --underline
    set fish_color_param blue

    # Use VI mode for Input
    fish_vi_key_bindings
    # _also_ allow ctrl-r to spawn history in insert mode.
    bind -M insert ctrl-r history-pager repaint-mode
end
