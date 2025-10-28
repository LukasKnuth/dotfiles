#! /opt/homebrew/bin/fish
# Use Borgmatic once https://projects.torsion.org/borgmatic-collective/borgmatic/pulls/991
# Taken from https://soyuka.me/borg-backups-archlinux-synology/
set -lx BORG_REPO 'ssh://Lukas@192.168.107.4/volume1/backup/borg/macbook.work'
set -lx BORG_REMOTE_PATH /usr/local/bin/borg
# Created and stored in 1password!
set -lx BORG_RSH 'ssh -i ~/.ssh/borg_diskstation'
# Created via `security add-generic-password -s BORG_MACBOOK -a "$(whoami)" -w "$(clippaste)"`
# See https://gist.github.com/tamakiii/9c3eadc493597ed819b9ff96cbcf61d4
set -lx BORG_PASSCOMMAND "security find-generic-password -s BORG_MACBOOK -a '$(whoami)' -w"

# 1. Setup the repo ONCE
# borg init --encryption repokey-blake2 ::
# 2. Export the key ONCE
# borg key export :: encrypted-key-backup
# 3. Do actual backups (relative to home!)
cd
fd . --type file --type symlink --hidden \
    device_hacking/ Documents/ dotfiles/ hobbies/ | borg create \
    --exclude-caches --paths-from-stdin --progress ::{user}-hobbies-{now}
# TODO when using this more regularly, prune/compact and check the backup (or switch to borgmatic)
