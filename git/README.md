# Git

My personal git configuration with all my aliases.

The configuration requires additional tools to be installed:

- [difftastic](https://github.com/Wilfred/difftastic) for semantic diffs on `di` and `dis`
- [delta](https://github.com/dandavison/delta) for nicer diff output on `ddi` and `ddis`

## SSH Key

The configuration references an SSH key that isn't included in my dotfiles.
On new machines, this key should be generated and added to GitHub:

1. Run `ssh-keygen -t ed25519 -C "your_email@example.com"` to generate the key.
  * Note: The chosen algorithm also influences the file-name
2. Add the key [to the OS Keyring](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
3. Add the key as a [new "Authentication Key" to GitHub](https://github.com/settings/ssh/new)
4. Add the key as a [new "Signing Key" to GitHub](https://github.com/settings/ssh/new)
  * Note: **Both** should be done because the git config is set to sign commits with the same SSH key.

## Professional

The config has a `includeIf` entry, which conditionally includes an _additional_ configuration file.
This configuration is only included if the current working directory begins with `~/work`, which is where all my work related repositories are kept.

The `.gitconfig-work` file is not in this repository but usually just looks like this:

```
[user]
  email = lukas@work.email
```
