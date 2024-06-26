# alias
## OS
case $(uname) in
    Darwin*)
        alias ls='ls -lrtFG'
        alias web='open -a Safari'
        ;;
    Linux*)
        alias ls='ls -lrtF --color=auto'
        alias web='vivaldi-stable'
        alias open='xdg-open'
        alias exe='powershell.exe /c start'
        alias pbcopy='xsel --clipboard --input'
        alias pbpaste='xsel --clipboard --output'
        ;;
    FreeBSD*)
        alias ls='ls -lrtFG'
        ;;
esac

## replacement
alias cp='cp -i'
alias df='df -h'
alias du='du -h'
alias grep='grep --color=auto'
alias less='less -R'
alias mkdir='mkdir -p'
alias mv='mv -i'
alias rm='rm -i'
alias sudo='sudo '

## 1-character
alias a=''
alias b='cd $OLDPWD'
alias c='pbcopy'
alias d='date +%Y%m%d'
alias e=''
alias f=''
alias g='git'
alias h='cd ~'
alias i='inkscape'
alias j=''
alias k='kill -9'
alias l='ls'
alias m=''
alias o='open'
alias p='pbpaste'
alias q='clear'
alias r='rm'
alias s='ls'
alias t='tree -C'
alias u=''
alias v='nvim'
alias w='web'
alias x='exit'
alias y='yarn'
alias z='zathura'

## 2-characters
alias ca='cargo'
alias gg='googler'
alias la='ls -A'
alias ll='clear && ls'
alias to='touch'

### 3-characters
alias del='rm -rf'
alias lld='ls -d */'

## chmod
alias 644='chmod 644'
alias 755='chmod 755'
alias 777='chmod 777'

## git
alias ga='git add'
alias gb='git branch'
alias gc='git commit -m'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gr='git rm'
alias gs='git status'
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
alias dc='cd'
alias ks='ls'
alias sl='ls'
alias kess='less'

## shell
alias valias='nvim ~/.dotfiles/zsh/zshrc.d/common/alias.zsh'
alias sozsh='source ~/.zshrc'

## trans
alias t-j='trans ja:en'
alias t-e='trans en:ja'

function lle() {
    ls *.$1
}

function countlines() {
    find . -name "*.$1" -type f | xargs cat | wc -l
}