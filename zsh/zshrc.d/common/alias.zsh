# Convenience aliases use their own names; keep standard commands unchanged.
alias l='ls'

## OS
case $(uname) in
    Darwin*)
        alias l='ls -lrtFG'
        alias web='open -a Safari'
        alias clipcopy='pbcopy'
        alias clippaste='pbpaste'
        ;;
    Linux*)
        alias l='ls -lrtF --color=auto'
        alias web='vivaldi-stable'
        alias xopen='xdg-open'
        alias exe='powershell.exe /c start'
        alias clipcopy='xsel --clipboard --input'
        alias clippaste='xsel --clipboard --output'
        ;;
    FreeBSD*)
        alias l='ls -lrtFG'
        ;;
esac

## explicit options
alias dfh='df -h'
alias duh='du -h'
alias grepc='grep --color=auto'
alias lessr='less -R'
alias mkp='mkdir -p'

## explicit confirmation
alias cpi='cp -i'
alias mvi='mv -i'
alias rmi='rm -i'

## 2-characters
alias ca='cargo'
alias la='l -A'
alias ll='clear && l'
alias to='touch'

## directories
alias ldirs='l -d */'

## git
alias ga='git add'
alias gb='git branch'
alias gcm='git commit -m'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gr='git rm'
alias gst='git status'
alias gco='git checkout'
alias gme='git merge'
alias gpl='git pull'
alias gps='git push'

## cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias dotfiles='cd ~/.dotfiles'

alias dev='cd ~/dev/$USER'
alias work='cd ~/work'

alias pro='cd ~/projects'
alias me='cd ~/projects/$USER'
alias others='cd ~/projects/others'
alias unsorted='cd ~/projects/unsorted'

alias cache='cd ~/.cache'

## pacman
alias pac-s='pacman -S'
alias pac-r='pacman -Rs'
alias pac-u='pacman -Syu'
alias pac-y='pacman -Syy'

## power
alias sys-o='systemctl poweroff'
alias sys-r='systemctl reboot'
alias sys-s='systemctl suspend'

## network
alias wifi='nmtui'
alias pingg='ping -c 3 www.google.com'

## typo
alias ks='l'
alias kess='lessr'

## shell
alias valias='nvim ~/.dotfiles/zsh/zshrc.d/common/alias.zsh'
alias sozsh='source ~/.zshrc'

## trans
alias t-j='trans ja:en'
alias t-e='trans en:ja'

function lle() {
    l *.$1
}

function countlines() {
    find . -name "*.$1" -type f | xargs cat | wc -l
}
