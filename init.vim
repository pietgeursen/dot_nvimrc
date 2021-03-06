set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'
Plugin 'garbas/vim-snipmate'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'pietgeursen/vim-snippets'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic.git'
Plugin 'pangloss/vim-javascript'
Plugin 'flazz/vim-colorschemes'
Plugin 'vim-airline/vim-airline'
Plugin 'moll/vim-node'
Plugin 'mileszs/ack.vim'
call vundle#end()            " required

filetype plugin indent on    " required

" directory settings
set nobackup            " do not write backup files
set noswapfile          " do not write .swp files
if has("persistent_undo")
  silent !mkdir -vp ~/.backup/vim/undo/ > /dev/null 2>&1
  set backupdir=~/.backup/vim,.       " list of directories for the backup file
  set directory=~/.backup/vim,~/tmp,. " list of directory names for the swap file
  set undofile
  set undodir=~/.backup/vim/undo/,~/tmp,.
endif

let g:syntastic_javascript_checkers = ['standard']

syntax enable

"nerdtree toggle
map <F3> :NERDTreeToggle<CR>

" colours
set background=dark
colorscheme candycode

"Remap leader
let mapleader = ","

"Remap ESC keys
:imap jj <Esc>
:tnoremap jj <C-\><C-n>
" Tab between buffers
noremap <tab> <c-w><c-w>
" Ctrl tab between alternate buffer
nmap <leader><tab> <c-^> 
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <leader>q :bd<CR>

"Paste from os clipboard
noremap <leader>y "+y
noremap <leader>yy "+Y

" Preserve indentation while pasting text from the OS X clipboard
noremap <leader>p :set paste<CR>:put  +<CR>:set nopaste<CR>

" Fugitive
nmap <leader>t :Gstatus<CR>
nmap <leader>r :Git co 
nmap <leader>u :Gpush origin 
nmap <leader>um :Gpush origin master <CR>

"" ctrlp.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__,node_modules
let g:ctrlp_working_path_mode = 'ra'

" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_use_caching = 0
cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
noremap <leader>b :CtrlPBuffer<CR>
let g:ctrlp_map = '<leader>e'
let g:ctrlp_open_new_file = 'r'

" send to node
nmap <leader>n :w !node<CR>
" test
nmap ` :!npm test<CR>

set ts=2                " number of spaces in a tab
set sw=2                " number of spaces for indent
set softtabstop=2
set et                  " expand tabs into spaces
