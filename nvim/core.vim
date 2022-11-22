" color
colorscheme molokai

syntax enable
set cursorline

" key binding
nmap <C-w>: :split<CR>
nmap <C-w>" :vsplit<CR>
command! Q q
command! W w

nmap <silent> <Leader><Leader> :<C-u>update<CR>
imap <silent> <C-c> <C-[>

nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
nnoremap + <C-a>
nnoremap - <C-x>

" encoding
scriptencoding utf-8
set encoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932,sjis

" split
set splitbelow

" file path completion
set wildmenu
set wildmode=longest:full

" search
set hlsearch
set ignorecase
set incsearch
set smartcase

" line number
set number
set numberwidth=5
set relativenumber

" deleting
set backspace=indent,eol,start


" swap
if !filewritable($HOME . '/.cache/nvim/swp')
	call mkdir($HOME . '/.cache/nvim/swp', 'p')
endif
set directory=~/.cache/nvim/swp
set swapfile

set listchars=eol:~,tab:>-
set foldmethod=marker

" clipboard
set clipboard& clipboard^=unnamedplus

" indent
set expandtab
set shiftwidth=4
set smartindent
set softtabstop=-1
set tabstop=4

" braket
set showmatch
set matchtime=1

" misc
set ambiwidth=double
set fileformats=unix,dos,mac
set laststatus=2
set showcmd
set history=3141
set ruler
set whichwrap=b,s,h,l,<,>,[,],~
