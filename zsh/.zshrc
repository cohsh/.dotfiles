ZSHHOME="$HOME/zshrc.d"

for file in $(<$ZSHHOME/zshrc.conf)
do
    source $ZSHHOME/$file
done

if [ -d $ZSHHOME/local ]; then
    for file in $ZSHHOME/local/*.zsh
    do
        [ -r $file ] && source $file
    done
fi
