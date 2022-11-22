# alias
## replacement
alias cp='cp -fir'
alias df='df -h'
alias du='du -h'
alias grep='grep --color=auto'
alias less='less -R'
alias ls='ls -alrtF --color=auto'
alias mkdir='mkdir -p'
alias mv='mv -i'
alias sudo='sudo '

## 1-character
alias a='alias'
alias b='vivaldi-stable'
alias c='xsel --clipboard --input'
alias d='less'
alias e=''
alias f=''
alias g='git'
alias h='cd ~'
alias i=''
alias j=''
alias k=''
alias l='clear && ls'
alias m='mkdir'
alias n=''
alias o='xdg-open'
alias p='xsel --clipboard --output'
alias q='clear'
alias r='rm'
alias s='ssh'
alias t='tree'
alias u=''
alias v='nvim'
alias w=''
alias x='exit'
alias y=''
alias z=_zathura

## 2-characters
alias to='touch'

### 3-characters
alias del='rm -rf'

## chmod
alias 644='chmod 644'
alias 755='chmod 755'
alias 777='chmod 777'

## git
alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gd='git diff'
alias gf='git fetch'
alias gl='git pull'
alias gp='git push'
alias gr='git rm'
alias gs='git status'
alias gco='git checkout -b'

## cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias dot='cd ~/.dotfiles'
alias cache='cd ~/.cache'

## pacman
alias pac-s='sudo pacman -S'
alias pac-r='sudo pacman -Rs'
alias pac-u='sudo pacman -Syu'
alias pac-y='sudo pacman -Syy'

## sect
alias code='nvim'
alias emacs='nvim'
alias ed='nvim'
alias nano='nvim'

## power
alias sys-o='systemctl poweroff'
alias sys-r='systemctl reboot'
alias sys-s='systemctl suspend'

## network
alias wifi='nmtui'

## typo
alias dc='cd'
alias ks='ls'
alias sl='ls'
alias kess='less'

## shell
alias zshrc='nvim ~/.zshrc'
alias sozsh='source ~/.zshrc'

## function
function _zathura() {
    zathura $1 &;
}
