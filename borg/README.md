# Borg Backup

Some scripts and configuration to create data backups using [Borg](https://borgbackup.readthedocs.io/en/stable/usage/upgrade.html).

**NOTE:** To not have the secret hard-coded anywhere, it is stored in the [Apple Keychain](https://synocommunity.com/package/borgbackup).
This won't be portable for other systems, but we'll worry about that later.

## Client setup

1. Download "Borg to Diskstation" SSH Key from 1password to `~/.ssh/borg_diskstation`
2. Ensure that `borg` uses the specific SSH key to connect to the remote server (also in script):

```
BORG_RSH='ssh -i ~/.ssh/borg_diskstation'
```

3. Copy "Borg MacBook Repo" password from 1Password and add it to the default keychain

```
security add-generic-password -s BORG_MACBOOK -a "$(whoami)" -w "$(clippaste)"
```

4. Run the `backup.fish` script

## Synology setup

Mostly taken from [this post](https://soyuka.me/borg-backups-archlinux-synology/):

1. Install "Borg" from the [SynoCommunity repo](https://synocommunity.com/package/borgbackup)
2. Copy the SSH **public** key onto the DiskStation:

```
$ ssh Lukas@diskstation
# In the home folder!
$ mkdir .ssh
$ chmod 700 .ssh
$ touch ~/.ssh/authorized_keys
$ chmod 600 ~/.ssh/authorized_keys
```

3. Edit `~/.ssh/authorized_keys` and set the following data:

```
command="/usr/local/bin/borg serve --restrict-to-path /path/to/backup",restrict <pubkey> <any-email>
```

Done.
