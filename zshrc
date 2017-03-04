# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
plugins=(git osx brew tmux docker docker-compose rbenv npm yarn mix)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# Load .env file if it exists
[ -f $HOME/dotfiles/.env ] && source $HOME/dotfiles/.env

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

alias vim="mvim -v"
if [ -n $TMUX ]; then
  alias vim="TERM=screen-256color mvim -v"
fi

export PATH="$HOME/.bin:$PATH"

# Ruby
eval "$(rbenv init - zsh --no-rehash)"

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# added by travis gem
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh

# Functions
github-clone() {
  # Since work email is the default user.email, this makes it easier to not
  # forget about setting my personal email for github work
  if [ -n $HOME_EMAIL ]; then
    git clone "$1" && cd "$(basename "$1" .git)" && git config user.email "$HOME_EMAIL"
  else
    echo "Oops! You need to set HOME_EMAIL in your environment"
  fi
}

git-delete-merged() {
  git branch --merged | egrep -v "(^\*|master)" | xargs git branch -d
}

gem_install_or_update() {
  if gem list "$1" --installed > /dev/null; then
    gem update "$@"
  else
    gem install "$@"
    rbenv rehash
  fi
}

npm_install_with_peer_deps() {
  npm info "$1@latest" peerDependencies --json | command sed 's/[\{\},]//g ; s/: /@/g' | xargs npm install -g "$1@latest"
}

# Aliases
alias docker-stop-all='docker stop $(docker ps -a -q)'
alias docker-stop-running='docker stop $(docker ps -q)'
alias docker-remove-exited='docker rm -v $(docker ps -a -q -f status=exited)'
alias docker-remove-dangling='docker rmi $(docker images -f "dangling=true" -q)'
alias docker-remove-untagged='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias docker-remove-stopped='docker rm $(docker ps -qa)'
alias docker-gc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc'
alias generate-ctags='ctags -R --exclude=.git --exclude=tmp --exclude=.bundle --exclude=coverage --exclude=public --exclude=log --exclude=vendor --exclude=doc .'
