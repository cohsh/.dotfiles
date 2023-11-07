#!/bin/sh -eu

__remove_linklist_comment() {(
    sed -e 's/\s*#.*//' -e '/^\s*$/d' $1
)}

linklist='install.conf'
if [ ! -r "$linklist" ]
then
    exit
fi

mkdir ~/.config

__remove_linklist_comment "$linklist" | while read target link
do
    target=$(eval echo "${PWD}/${target}")
    link=$(eval echo "${link}")
    ln -fns ${target} ${link}
done