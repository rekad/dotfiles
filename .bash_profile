# Editor
export EDITOR=nvim

# FZF
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND -g='!.Trash' -g='!Library' -g='!.nvm' -g='!.pyenv'" 

# Use vim keybindings
# this breaks ctrl-r with fzf?
#set -o vi

# Style 
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
export PS1="\[\033[33;1m\]\w\[\033[m\] \$(parse_git_branch)\[\033[00m\] "

# Initialize pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# Initialize nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm

# Git completion
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion || {
    # if not found in /usr/local/etc, try the brew --prefix location
    [ -f "$(brew --prefix)/etc/bash_completion.d/git-completion.bash" ] && \
        . $(brew --prefix)/etc/bash_completion.d/git-completion.bash
}

# locale
export LC_ALL=en_US.UTF-8

# aliases
alias notes="cd ~/Dropbox/notes && nvim ."
alias vim="nvim"
alias ls='ls -GFh'

# custom scripts
function set_wallpaper() {
    sqlite3 qlite3 ~/Library/Application\ Support/Dock/desktoppicture.db "update data set value = '$1'" && killall Dock
}

function yt-dl() {
    youtube-dl -i --extract-audio --audio-format mp3 --audio-quality 0 --write-thumbnail -o '/Users/rekad/Music/%(title)s.%(ext)s' $1
}
