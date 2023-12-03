# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
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
node
npm
macos
python
ruby
tmux
yarn
)

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# For pip installing psycopg2
export LDFLAGS='-L/usr/local/lib -L/usr/local/opt/openssl/lib -L/usr/local/opt/readline/lib'

source $ZSH/oh-my-zsh.sh

# Load .env file if it exists
[ -f ~/.env ] && source ~/.env

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='nvim'
fi

# Less
export LESS=-R

# Use neovim if it's installed
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

export PATH="$HOME/.bin:$HOME/.local/bin:$PATH"

if [[ -d "$HOME/.workbin" ]]; then
  export PATH="$HOME/.workbin:$PATH"
fi

# Go
if [[ -d "$HOME/go/bin" ]]; then
  export PATH="$HOME/go/bin:$PATH"
fi

# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.workaliases ]] && source ~/.workaliases

# Python certs
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export REQUESTS_CA_BUNDLE=/usr/local/etc/openssl@1.1/cert.pem

# Docker
export COMPOSE_DOCKER_CLI_BUILD=1

export BAT_THEME="Dracula"

fpath+=~/.zfunc
autoload zmv
autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f "/Users/dcahoon/.ghcup/env" ] && source "/Users/dcahoon/.ghcup/env" # ghcup-env

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)
