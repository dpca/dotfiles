# Path to oh-my-zsh installation.
export ZSH=~/.oh-my-zsh

ZSH_THEME="agnoster"
plugins=(git osx brew tmux docker docker-compose rbenv npm yarn mix)

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

# Ruby
eval "$(rbenv init - zsh --no-rehash)"

# Haskell
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# travis
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag --hidden -g ""'

# Local config
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases
export PATH="/usr/local/opt/openssl/bin:$PATH"
