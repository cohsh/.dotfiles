export EDITOR=nvim
export LESS='--tabs=4 --no-init --LONG-PROMPT --ignore-case'
export DISPLAY=$(grep -oP "(?<=nameserver ).+" /etc/resolv.conf):0