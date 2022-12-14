ZSHHOME="$HOME/zshrc.d"

while read file
do
    source $ZSHHOME/$file
done < $ZSHHOME/zshrc.conf

if [ -d $ZSHHOME/local ]; then
    for file in $ZSHHOME/local/*.zsh
    do
        [ -r $file ] && source $file
    done
fi
