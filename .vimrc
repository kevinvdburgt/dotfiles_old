"
" Vundle plugin manager
"
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"
" Plugins
"
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'valloric/youcompleteme'
Plugin 'editorconfig/editorconfig-vim'

"
" Color schemes
"
Plugin 'tomasr/molokai'


call vundle#end() 

"
" Colors
"
colorscheme molokai		" Awesome colorscheme
let g:molokai_original = 1	" - Use the original colorscheme
let g:rehash265 = 1		" - Not sure what this did tho..?

syntax enable			" Enable syntax highlighting

"
" Spaces and tabs
"
set tabstop=2			" Number of visual spaces per TAB
set softtabstop=2		" Number of spaces in tab when editing
set expandtab			" Tabs are spaces (spaces are just awesome looking)

"
" UI Configuration
"
set number			" Show line numbers
"set showcmd			" Show the command in bottom bar
set cursorline			" Highlight the current line
filetype indent on		" Load filetype-specific indent files
set wildmenu			" Visual autocomplete for command menu
set lazyredraw			" Redraw only when we need to
set showmatch			" Highlight matching {{()}]

"
" Searching
"
set incsearch			" Search as characters are entered
set hlsearch			" Highlight matches
set ignorecase			" Ignore case of search results

"
" Folding
"
"set foldenable			" Enable folding
"set foldlevelstart=10		" Open most folds by default
"set foldnestmax=10		" 10 nested fold max
"nnoremap <space> za
"set foldmethod=indent		" Fold based on indent level

"
" Movement
"
"nnoremap j gj
"nnoremap k gk

" Habit breaking, disable arrow keys for moving around in vim
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"
" Plugin: NERDTree
"
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"
" Plugin: airline
"
set laststatus=2
let g:airline_powerline_fonts = 1

