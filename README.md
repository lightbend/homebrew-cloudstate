# Homebrew cloudstate

This Homebrew tap provides a formula for [Cloudstate CLI][0], a command-line client for the Lightbend [Cloudstate][1] managed cloud service.

## Requirements

* [Homebrew][2]
    * Mac OS X
        * High Sierra
        * Mojave
        * Catalina
* [Linuxbrew][3]
    * Ubuntu
        * 16.04 (Xenial Xerus)
        * 18.04 (Bionic Beaver)
        * 20.04 (Focal Fossa)

Untested everywhere else.

## Dependencies

None. This formula installs a self-contained static binary without any additional runtime dependencies.

## Usage

![Formula usage](usage.gif?raw=true "Formula usage")

Add the Homebrew tap:

```sh
$ brew tap lightbend/cloudstate
==> Tapping lightbend/cloudstate
Cloning into '/usr/local/Homebrew/Library/Taps/lightbend/homebrew-cloudstate'...
remote: Enumerating objects: 22, done.
remote: Counting objects: 100% (22/22), done.
remote: Compressing objects: 100% (19/19), done.
remote: Total 22 (delta 0), reused 22 (delta 0), pack-reused 0
Receiving objects: 100% (22/22), 13.24 KiB | 6.62 MiB/s, done.
Tapped 1 formula (20 files, 39.5KB).
```

Install the formula:

```sh
$ brew install csctl
==> Installing csctl from lightbend/cloudstate
==> Downloading https://downloads.lbcs.io/0.0.7/csctl_darwin_amd64_0.0.7.tar.gz
######################################################################## 100.0%
==> Caveats
Thank you for installing the Lightbend Cloudstate CLI!

To see help and a list of available commands type:
  $ csctl help

You can sign into your Cloudstate account using:
  $ csctl auth login

Remember to set your current project with:
  $ csctl config set project

For more information on how to use the Cloudstate CLI and
the Lightbend Cloudstate managed cloud service, visit:
  https://docs.lbcs.io/

Bash completion has been installed to:
  /usr/local/etc/bash_completion.d

zsh completions have been installed to:
  /usr/local/share/zsh/site-functions
==> Summary
🍺  /usr/local/Cellar/csctl/0.0.7: 5 files, 14.6MB, built in 3 seconds
```

Uninstall the formula:

```sh
$ brew uninstall csctl
Uninstalling /usr/local/Cellar/csctl/0.0.7... (5 files, 14.6MB)
```

## Installation

Run the following in your command-line to add the Homebrew tap:

```sh
$ brew tap lightbend/cloudstate
```

Once the tap is installed, you can install `csctl` formula via:

```sh
$ brew install csctl
```

You can also install the formula directly via URL (which will not receive updates):

```sh
$ brew install https://raw.githubusercontent.com/lightbend/homebrew-cloudstate/master/Formula/csctl.rb
```

As part of the default installation process, this formula will install programmable shell completion support for the _Lightbend Cloudstate CLI_ for both the Bash and Zsh shells. If you prefer not to install the completion, then use the `--without-completion` command-line switch when installing the formula in to prevent the shell completion from being installed.

## Upgrade and keeping up-to-date

Update current Homebrew to the newest version and refresh updated formulae:

```sh
$ brew update
```

Once Homebrew finishes refreshing updated formulae, upgrade formula to the latest version:

```sh
$ brew upgrade csctl
```

## Uninstalling and clean-up

Run the following in your command-line to remove the formula:

```sh
$ brew uninstall csctl
```

Once the formula has been removed, you can also remove the Homebrew tap:

```sh
$ brew untap lightbend/cloudstate
```

You can also remove cached downloads, stale installation files, and old formulae with:

```
$ brew cleanup --prune 0
```

## Shell completion

This formula will install Bash and Zsh shells completion into the following locations:

- Bash shell:  

  `/usr/local/etc/bash_completion.d`

- Z shell:  

  `/usr/local/share/zsh/site-functions`

You then need to instruct your shell or configure your environment to load completion from this additional location.

The following Homebrew formulae offer seamless support for shell completion:

- [Bash shell][4]

- [Z shell][5]

A popular alternative to the completion formulae available in Homebrew can be in the form of a shell configuration framework such as _[Oh My BASH!][6]_ or _[Oh My ZSH!][7]_ with is also capable of loading programmable completion either directly or via provided plugins - you might need to update your configuration to ensure that completion is loaded from the additional location.

An example configuration for Z shell using the _Oh my ZSH!_ framework that supports loading completion from a number of additional locations can look as follows.

Example Z shell configuration file (to be saved as `~/.zshrc`):

```zsh
export ZSH="/Users/${USER}/.oh-my-zsh"
export ZSH_DISABLE_COMPFIX=true

fpath=(
  /usr/local/share/zsh-completions
  /usr/local/share/zsh/site-functions
  $fpath
)

source "${ZSH}/oh-my-zsh.sh"
```

A plugin can aslo be developed for either of those frameworks to generate and cache completion on the first run instead of installing this formula's provided completion.

Example plugin for the _Oh my ZSH!_ framework (to be saved as `~/.oh-my-zsh/plugins/csctl/csctl.plugin.zsh`):

```zsh
if (( $+commands[csctl] )); then
    __CSCTL_COMPLETION_FILE="${ZSH_CACHE_DIR}/csctl_completion"

    if [[ ! -f $__CSCTL_COMPLETION_FILE ]]; then
        csctl completion --shell zsh >! $__CSCTL_COMPLETION_FILE
    fi

    [[ -f $__CSCTL_COMPLETION_FILE ]] && source $__CSCTL_COMPLETION_FILE

    unset __CSCTL_COMPLETION_FILE
fi
```

Note, that using programmable shell completion might lead to performance issues concerning your shell and/or runtime environment, please keep this in mind.

## License

See [LICENSE](LICENSE).

[0]: https://docs.lbcs.io/cli/cli.html
[1]: https://cloudstate.io
[2]: https://brew.sh
[3]: https://linuxbrew.sh
[4]: https://formulae.brew.sh/formula/bash-completion@2
[5]: https://formulae.brew.sh/formula/zsh-completions
[6]: https://github.com/ohmybash/oh-my-bash
[7]: https://github.com/ohmyzsh/ohmyzsh
