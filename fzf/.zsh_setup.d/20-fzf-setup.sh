# Setup FZF, as per https://github.com/junegunn/fzf?tab=readme-ov-file#setting-up-shell-integration
# NOTE: Since NixOS doesn't have the package version with `--zsh` command yet, we only use it if
# the helper command `fzf-share` isn't available.
if [ -n "${commands[fzf-share]}" ]; then
  case "$(basename $SHELL)" in
    "zsh")
    source "$(fzf-share)/key-bindings.zsh"
    source "$(fzf-share)/completion.zsh"
    ;;
    "bash")
    source "$(fzf-share)/key-bindings.bash"
    source "$(fzf-share)/completion.bash"
    ;;
    *)
  esac
else
  case "$(basename $SHELL)" in
    "zsh") eval "$(fzf --zsh)";;
    "bash") eval "$(fzf --bash)";;
    *)
  esac
fi
