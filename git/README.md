# Git

My personal git configuration with all my aliases.

## Professional

The config has a `includeIf` entry, which conditionally includes an _additional_ configuration file.
This configuration is only included if the current working directory begins with `~/work`, which is where all my work related repositories are kept.

The `.gitconfig-work` file is not in this repository but usually just looks like this:

```
[user]
  email = lukas@work.email
```
