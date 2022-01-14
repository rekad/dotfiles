# Update path for pip --user installs
export PATH=$PATH:~/.local/bin
# pyenv init
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Project shortcuts
alias hermes="cd ~/code/carvolution/hermes"
alias genomelink="cd ~/code/awakens/genomelink"

# Use VIM keybindings in terminal input
setopt vi
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey "^R" history-incremental-search-backward

# don't need cd
setopt autocd

# shell history
# HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
setopt sharehistory
setopt appendhistory
setopt incappendhistory
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

# fzf initialization
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# completion

# requires git-completion.bash & git-completion.zsh (saved as _git) from git repository
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)

# partial completion suggestions
zstyle ':completion:*' list-suffixes zstyle ':completion:*' expand prefix suffix 

# enable zsh autocompletion system
autoload -Uz compinit && compinit -u # autoload: declare function from file in fpath

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# add git branch to prompt
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

setopt prompt_subst
PROMPT='%F{147}%1~%f$(parse_git_branch) %# '

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/rekad/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/rekad/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/rekad/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/rekad/google-cloud-sdk/completion.zsh.inc'; fi
