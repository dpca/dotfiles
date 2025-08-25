# dotfiles

Dotfiles and setup scripts to automate macOS setup.

[Homebrew](https://brew.sh/) is used for package management and
[mise](https://mise.jdx.dev/) for managing programming languages.

## Install

```bash
git clone git@github.com:dpca/dotfiles.git ~/dotfiles
~/dotfiles/create-symlinks.sh
~/dotfiles/setup/mac
```

## Settings

* System
  * Remap caps lock to control

* Trackpad
  * Scroll direction: NOT NATURAL
  * Look up & data detectors: Yes
  * Swipe between pages: 3 fingers
  * Swipe between full-screen apps: 4 fingers
  * Mission control: 4 fingers
  * App Expose: Down w/ 4 fingers

* Terminal
  * [Dracula](https://draculatheme.com/) color theme
  * [Powerlevel10k](https://github.com/romkatv/powerlevel10k) zsh theme
    * Meslo Nerd Font patched for Powerlevel10k
  * Use option as Meta key

## Acknowledgements

Many thanks to [Thoughtbot](https://thoughtbot.com/) for their
[laptop](https://github.com/thoughtbot/laptop) and
[dotfiles](https://github.com/thoughtbot/dotfiles) repos, which served as the
starting point for this repo.
