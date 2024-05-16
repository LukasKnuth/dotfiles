# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gitster"

# Change the command execution timestamp shown in the history command output.
HIST_STAMPS="dd.mm.yyyy"

# Don't set any aliases from oh-my-zsh and/or plugins - keep the aliases clean
zstyle ':omz:*' aliases no
# oh-my-zsh update behavior
zstyle ':omz:update' mode reminder
zstyle ':omz:update' verbose minimal
zstyle ':omz:update' frequency 14 # days

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(brew direnv asdf fzf zsh-autosuggestions zsh-vi-mode)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Load User configuration, as conditionally linked
for script in $HOME/.zsh_setup.d/*.sh; do
  [[ ${script:t} != '~'* ]] || continue # ignore files starting with tilde
  source "$script"
done
