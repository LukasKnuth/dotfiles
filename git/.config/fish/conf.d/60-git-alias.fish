alias g='git'

# Do not include remote branches when tap-completing
# "git switch" or "git checkout" commands
# Taken from: https://stackoverflow.com/a/43747486/717341
set -gx GIT_COMPLETION_CHECKOUT_NO_GUESS 1
