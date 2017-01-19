" Display the line numbers
set number

" Enable syntax highlighting
syntax on

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Highlight dynamically as pattern is typed
set incsearch

" Vundle plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'valloric/youcompleteme'
Plugin 'tomasr/molokai'
Plugin 'editorconfig/editorconfig-vim'

call vundle#end() 
filetype plugin indent on

" Plugin config: NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

" Plugin config: airline
set laststatus=2
let g:airline_powerline_fonts = 1

" PLugin config: molokai
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai
