# pyenv init
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Use VIM keybindings in terminal input
set -o vi
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^R" history-incremental-search-backward

# fzf initialization
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# git zsh completion
# requires git-completion.bash & git-completion.zsh (saved as _git) from git repository
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit -u

