zstyle ':vcs_info:git+set-message:*' hooks git-config-user
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f:%F{blue}%m%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]:%m'

function +vi-git-config-user(){
  hook_com[misc]+=`git config user.name`
}

precmd () {
  print
  local left=' %{\e[38;5;2m%}(%~)%{\e[m%}'
  vcs_info
  local right="%{\e[38;5;32m%}${vcs_info_msg_0_}%{\e[m%}"
  local invisible='%([BSUbfksu]|([FK]|){*})'
  local leftwidth=${#${(S%%)left//$~invisible/}}
  local rightwidth=${#${(S%%)right//$~invisible/}}
  local padwidth=$(($COLUMNS - ($leftwidth + $rightwidth) % $COLUMNS))

  print -P $left${(r:$padwidth:: :)}$right
}
PROMPT="%B%F{3}ζ*'ヮ')ζ%#%f%b "
RPROMPT=$'%{\e[38;5;251m%}%D{%b %d}, %*%{\e[m%}'
TMOUT=1
TRAPALRM(){
    zle reset-prompt
}

function set-prompt () {
    if [ "$1" = 'pub' ]; then
        PROMPT="%B%F{3}%#%f%b "
    else
        PROMPT="%B%F{3}ζ*'ヮ')ζ%#%f%b "
    fi
}
