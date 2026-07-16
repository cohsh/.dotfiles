#!/bin/sh -eu

__remove_linklist_comment() {(
    sed -e 's/[[:space:]]*#.*//' -e '/^[[:space:]]*$/d' $1
)}

linklist='install.conf'
if [ ! -r "$linklist" ]
then
    exit
fi

os=$(uname | tr '[:upper:]' '[:lower:]')

mkdir -p ~/.config

__remove_linklist_comment "$linklist" | while read target link target_os
do
    if [ -n "${target_os}" ] && [ "${target_os}" != "${os}" ]
    then
        continue
    fi
    target=$(eval echo "${PWD}/${target}")
    link=$(eval echo "${link}")
    ln -fns ${target} ${link}
done
