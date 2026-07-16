export EDITOR=nvim
export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case -R'

command -v pyenv > /dev/null && eval "$(pyenv init --path)"

## pager for non-TTY output
[[ ! -t 1 ]] && export PAGER=cat GIT_PAGER=cat