#!/usr/bin/env bash

set -eo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

reset="\\e[0m"
# red="\\e[0;31m"
green="\\e[0;32m"
yellow="\\e[0;33m"
cyan="\\e[0;36m"
# white="\\e[0;37m"

function fancy_echo() {
  local color=${2:-$cyan}
  local fmt="$color$1$reset"; shift

  # shellcheck disable=SC2059
  printf "$fmt\\n" "$@"
}

function symlink() {
  input_file="$1"
  symlink="$2"

  if [ -L "$symlink" ]; then
    fancy_echo "Symlink $symlink exists" "$green"
  elif [ -f "$symlink" ]; then
    fancy_echo "$symlink exists but is a file, skipping" "$yellow"
  elif [ -d "$symlink" ]; then
    fancy_echo "$symlink exists but is a dir, skipping" "$yellow"
  else
    fancy_echo "Creating $symlink -> $input_file"
    ln -s "$input_file" "$symlink"
  fi
}

# Symlink files
symlink "$DIR/aliases" "$HOME/.aliases"
symlink "$DIR/config/nvim/init.lua" "$HOME/.config/nvim/init.lua"
symlink "$DIR/config/ghostty/config" "$HOME/.config/ghostty/config"
symlink "$DIR/gitconfig" "$HOME/.gitconfig"
symlink "$DIR/gitignore_global" "$HOME/.gitignore_global"
symlink "$DIR/rgignore" "$HOME/.rgignore"
symlink "$DIR/tmux.conf" "$HOME/.tmux.conf"
symlink "$DIR/zshrc" "$HOME/.zshrc"

# Symlink dirs
symlink "$DIR/bin" "$HOME/.bin"
