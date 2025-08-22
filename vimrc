set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

  Plugin 'VundleVim/Vundle.vim'
  Plugin 'preservim/nerdtree'
  Plugin 'tpope/vim-commentary'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" Colorstuf
colorscheme murphy
syntax enable

" spaces and tabs
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

" Folderstuf
set backupdir=~/.vim/backups " set backup folder
set undodir=~/.vim/undo " set undo folder
set directory=~/.vim/swaps " set swap folder

" UI Config
set number
set relativenumber
set cursorline
map <F4> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
filetype plugin indent on " load filtype-specific indent and plugin file
set showmatch
set encoding=utf-8
set ruler
"set showcmd
map <Tab> :tabm<CR>
map <S-Tab> :tabp<CR>

" Searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" Clipboard thing
set clipboard=unnamed

"Mouse things
set mouse=n

" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Close the tab if NERDTree is the only window remaining in it. Can't
" understand why isTabTree doesn't work tho
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') | quit | endif

" Always show tabs
set showtabline=2

" Remove central line
set colorcolumn=0

" Always have terminal
:nnoremap <leader>t :wincmd b \| bel terminal<CR>

" Functions

"" restores cursor position
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
