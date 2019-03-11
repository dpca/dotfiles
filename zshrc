# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"
plugins=(
asdf
autojump
brew
bundler
cp
docker
docker-compose
fzf
git
mix
node
npm
osx
python
rbenv
ruby
tmux
yarn
)

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

source $ZSH/oh-my-zsh.sh

# Load .env file if it exists
[ -f ~/dotfiles/.env ] && source ~/dotfiles/.env

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

# Less
export LESS=-R

# Use neovim if it's installed
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

export PATH="$HOME/.bin:$HOME/.local/bin:$PATH"

# asdf
source "$HOME/.asdf/asdf.sh"
source "$HOME/.asdf/completions/asdf.bash"

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
export PATH="/usr/local/opt/openssl/bin:$PATH"

# completions
timetrap_lib=$(gem which timetrap)
timetrap=$(dirname $(dirname "${timetrap_lib}"))
fpath=("$timetrap/completions/zsh" $fpath)

autoload -U compinit
compinit
