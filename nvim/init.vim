if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

runtime! core.vim
runtime! plug.vim
runtime! plugin/ddc.vim
runtime! plugin/vimtex.vim
runtime! plugin/neosnippet.vim
