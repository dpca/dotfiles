export PATH="$HOME/.bin:$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

if [[ -d "$HOME/.workbin" ]]; then
  export PATH="$HOME/.workbin:$PATH"
fi

# Go
if [[ -d "$HOME/go/bin" ]]; then
  export PATH="$HOME/go/bin:$PATH"
fi

if [[ -n '$TMUX' ]]; then;
  bindkey -e
fi

export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export LESS=-R
export BAT_THEME="Dracula"

# Use neovim if it's installed
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi

# Enable completion
autoload -Uz compinit
compinit

autoload -U select-word-style
select-word-style bash

# Prefix-aware search history
autoload -U history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^[[A" history-beginning-search-backward-end
bindkey "^[[B" history-beginning-search-forward-end

[[ -f ~/.aliases ]] && source ~/.aliases
[[ -f ~/.workaliases ]] && source ~/.workaliases

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# https://mise.jdx.dev/
eval "$(mise activate zsh)"
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init --cmd j zsh)"
# https://docs.atuin.sh/
eval "$(atuin init zsh --disable-up-arrow)"
# https://starship.rs/
eval "$(starship init zsh)"
