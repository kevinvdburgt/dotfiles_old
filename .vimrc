" Be iMproved
set nocompatible

" ???
filetype off

" Enable syntax highlighting
syntax enable

" Set the tabspacing to 4 spacing
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab

" Display the line numbers
set nu

" Powerline ?
set laststatus=2

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Cundele, required
Plugin 'gmarik/Vundle.vim'

"Plugin 'powerline/powerline'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'


" All of your Plugins must be added before the following line
call vundle#end() 
filetype plugin indent on

" Mapping
map <F3> :NERDTreeToggle<CR>

