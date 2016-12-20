# dotfiles

Dotfiles and setup scripts to automate OS X setup. Largely inspired by
Thoughtbot's [laptop](https://github.com/thoughtbot/laptop) and
[dotfiles](https://github.com/thoughtbot/dotfiles) repos but modified to suit
my own needs.

## Install

```bash
git clone git@github.com:dpca/dotfiles.git ~/dotfiles
~/dotfiles/setup/mac
```

Run `rcup` after adding new files to the directory to properly symlink them.

## Other apps

* Google Chrome
  * Postman
* OmniFocus
* Tweetbot
* Slack
* iTerm
* SourceTree
* 1Password
* Docker for Mac
* Alfred
* Viscosity
* [Aerial screen saver](https://github.com/JohnCoates/Aerial)

## Settings

* Trackpad
  * Scroll direction: NOT NATURAL
  * Look up & data detectors: Yes
  * Swipe between pages: 3 fingers
  * Swipe between full-screen apps: 4 fingers
  * Mission control: 4 fingers
  * App Expose: Down w/ 4 fingers

## ESLint

Airbnb's .eslintrc is pretty great, so I just extend it. See here for setup:
https://github.com/airbnb/javascript/tree/master/packages/eslint-config-airbnb
