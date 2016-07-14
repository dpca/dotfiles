# Path to oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="agnoster"
plugins=(git osx brew vagrant docker docker-compose npm)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

export PATH="$HOME/.bin:$PATH"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh --no-rehash)"

# Haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Aliases
alias docker-stop-all='docker stop $(docker ps -a -q)'
alias docker-stop-running='docker stop $(docker ps -q)'
alias docker-remove-exited='docker rm -v $(docker ps -a -q -f status=exited)'
alias docker-remove-dangling='docker rmi $(docker images -f "dangling=true" -q)'
alias docker-remove-untagged='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias docker-remove-stopped='docker rm $(docker ps -qa)'
alias docker-gc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc'
alias generate-ctags='ctags -R --exclude=.git --exclude=tmp --exclude=.bundle --exclude=coverage --exclude=public --exclude=log --exclude=vendor --exclude=doc .'
