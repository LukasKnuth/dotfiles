# Options: https://zsh.sourceforge.io/Doc/Release/Options.html
unsetopt RM_STAR_SILENT # notify when rm is running with *
unsetopt FLOW_CONTROL   # disable start/stop characters
setopt RM_STAR_WAIT     # wait for 10 seconds confirmation when running rm with *

# Completion with TAB
zstyle ':completion:*' menu            select
zstyle ':completion:*' list-colors     "${(s.:.)LS_COLORS}"
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' verbose         true
zmodload zsh/complist

unsetopt MENU_COMPLETE  # do not cycle through options but show menu
setopt AUTO_PARAM_SLASH # complete folders with / at end
setopt AUTO_MENU        # show menu after 2nd request to complete
setopt COMPLETE_ALIASES # complete alias as if it where a standalone command
setopt LIST_TYPES       # show file-types in completion list
setopt HASH_LIST_ALL    # ensure to verify entire command before correcting
setopt ALWAYS_TO_END    # move the cursor to the end of selected completion
setopt COMPLETE_IN_WORD # don't move cursor during completion

# History configuration
HISTFILE="${HOME}/.zsh_history"
HISTSIZE=10000
SAVEHIST=50000

setopt EXTENDED_HISTORY       # record timestamp of command in HISTFILE
setopt HIST_EXPIRE_DUPS_FIRST # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt HIST_IGNORE_DUPS       # ignore duplicated commands history list
setopt HIST_IGNORE_SPACE      # ignore commands that start with space
setopt HIST_VERIFY            # show command with history expansion to user before running it
setopt SHARE_HISTORY          # share command history data

# plugins=(brew direnv asdf fzf zsh-autosuggestions zsh-vi-mode)

# Load User configuration and/or plugins.
# Anybody can add a file/symlink into this directory to extend the shell.
for script in $HOME/.zsh_setup.d/*.sh; do
  [[ ${script:t} != '~'* ]] || continue # ignore files starting with tilde
  source "$script"
done
unset script

# Load the prompt
eval "$(starship init zsh)"
