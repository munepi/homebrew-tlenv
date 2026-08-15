# tlenv Homebrew Tap

This repository contains formulae for use with Homebrew: https://brew.sh


## Formulae

* `tlenv`: [tlenv](https://github.com/munepi/tlenv), a TeX Live version manager
  tool inspired by [rbenv](https://github.com/rbenv/rbenv)
* `tlenv-texlive-install`:
  [tlenv-texlive-install](https://github.com/munepi/tlenv-texlive-install), the
  tlenv plugin providing `tlenv install` and `tlenv uninstall`


## Installation

``` shell
brew tap munepi/tlenv
brew install tlenv
```

`tlenv-texlive-install` is a recommended dependency of `tlenv`, so it is
installed along with `tlenv` unless you pass `--without-tlenv-texlive-install`.
You can also install it on its own to use the standalone `texlive-install`
command:

``` shell
brew install munepi/tlenv/tlenv-texlive-install
```


## Getting started

Run `tlenv init` and it will append the necessary line to the startup file of
your shell. Restart your shell afterwards so that the changes take effect.

``` shell
tlenv init
```

Then install a TeX Live version:

``` shell
tlenv install current
tlenv global current
```

TeX Live versions are installed under `TLENV_ROOT` (`~/.tlenv` by default).

The zsh completion is linked into Homebrew's `site-functions` directory, so it
works as soon as `compinit` runs; the bash completion is loaded by `tlenv init`.


## Other plugins

The following tlenv plugins are not packaged here; clone them into
`${TLENV_ROOT}/plugins/` as described in the
[tlenv README](https://github.com/munepi/tlenv#plugins).

* [texlive-install-darwin](https://github.com/munepi/tlenv-texlive-install-darwin)
* [texlive-install-haranoajifonts](https://github.com/munepi/tlenv-texlive-install-haranoajifonts)
* [shared-texmflocal](https://github.com/munepi/tlenv-shared-texmflocal)
* [tlnet-texjporg](https://github.com/munepi/tlenv-tlnet-texjporg)


## License

This program is licensed under the terms of the MIT License.

--------------------

Munehiro Yamamoto
https://github.com/munepi
