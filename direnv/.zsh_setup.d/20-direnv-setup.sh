# Setup direnv, as per their documentation
# https://github.com/direnv/direnv/blob/master/docs/hook.md
case "$(basename $SHELL)" in
  "zsh") eval "$(direnv hook zsh)";;
  "bash") eval "$(direnv hook bash)";;
  *)
esac
