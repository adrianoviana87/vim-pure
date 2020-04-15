if has('win64')
  let g:python_host_prog = 'c:\Python27\python.exe'
  let g:python3_host_prog = 'c:\Python38\python.exe'
endif

" ****** Important ******
set nocompatible




" ****** multi-byte characters ******
set encoding=utf-8
set emoji




" ****** command line editing ******
set history=1000
set wildmenu
set wildignorecase
set wildignore+=node_modues/**




" ****** editing text ******
set backspace=indent,eol,start
set undodir=~/vimundo




" ****** messages and info ******
set noshowcmd
set shortmess+=I
set noshowmode
set noruler
set noerrorbells
set visualbell
set confirm " Display a confirmation dialog when closing an unsaved file




" ****** reading and writing files ******
set autoread
set nowb
set backupdir==~/vimbackup//




" ****** multiple windows ******
set hidden
set noequalalways	" make all windows the same size when adding/removing windows
set laststatus=2




" ****** displaying text ******
set number
set relativenumber
set nowrap
set linebreak
set scrolloff=3 " The number of screen lines to keep above and below the cursor
set sidescrolloff=5 " The number of screen columns to keep to the left and right of the cursor
" if has("win32") || has("win64")
"   set renderoptions=type:directx,gamma:1.5,contrast:0.5,geom:1,renmode:5,taamode:1,level:0.5
" endif




" ****** syntax, highlighting and spelling ******
syntax enable
set nospell
set spelllang=en
set background=dark
set nocursorline
filetype plugin indent on
filetype indent on
set hlsearch
set termguicolors




" ****** terminal ******
set title




" ****** using the mouse ******
set mouse=a




" ****** gui ******
set guifont=SauceCodePro\ NF:h12
set guioptions+=! " execute commands inside vim terminal emulator
set guioptions-=a " set selection to system clipboard but not in * register
set guioptions+=P " set selection to system clipboard in + register instead
set guioptions+=c " use console dialog for simple choices
set guioptions+=e " show tab pages in gui
set guioptions-=t " no option to dettach system menu
set guioptions-=T " no toolbar
set guioptions-=r " right hand scrollbar not always present
set guioptions-=R " right hand scrollbar not present when there is a vsplit
set guioptions-=l " left hand scrollbar not always present
set guioptions-=L " left hand scrollbar not present when there is a vsplit
set guioptions-=b " no bottom scrollbar
set guioptions-=m " no menubar




" ****** Insert mode ******
inoremap <c-J> <esc>
inoremap jk <esc>
inoremap kj <esc>




" ****** Command mode ******
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
cnoremap <c-j> <up>
cnoremap <c-k> <down>
" ****** Normal mode ******
nnoremap ; :
nnoremap <leader>. :CocAction<cr>
nnoremap <leader>p :CocCommand<cr>
nnoremap <leader>l :CocList lines<cr>
nnoremap <leader>cc :CocList colors<cr>
nnoremap <leader>P :CocList vimcommands<cr>
nnoremap <c-p> :CocList files<cr>
nnoremap <c-m> :CocList mru<cr>
nnoremap <leader>f :CocList grep<cr>
nnoremap <c-n> :CocCommand explorer<cr>
nnoremap <leader>= :Goyo<cr>
nnoremap <leader>+ :Limelight!!<cr>
nnoremap <leader>o :CocList outline<cr>

" go to previous next error
nnoremap <down> :cnext<cr>

" go to previous error
nnoremap <up> :cprev<cr>

" go to first error
nnoremap <left> :cfirst<cr>

" go to last error
nnoremap <right> :clast<cr>




" ****** Terminal mode *******
tnoremap <c-j> <c-\><c-n>




" ****** File explorer ******
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 30
let g:netrw_banner = 0




" ****** the swap file ******
set directory=$HOME/vimswp//





" ****** tabs and indenting ******
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab





" ****** moving around, searching and patterns ******
set incsearch " show match for partly typed search command
set magic	" change the way backslashes are used in search patterns
set ignorecase
set smartcase
set path+=**




" ****** Plugins ******
call plug#begin('~/dot-files/vim-pure/plugged')

Plug 'kana/vim-textobj-user'
Plug 'sgur/vim-textobj-parameter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'w0rp/ale'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'mhinz/vim-startify'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

call plug#end()




" ****** ALE ******
let g:ale_linters = {
\ 'typescript': [],
\ 'javascript': ['eslint']
\}

" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1




" ****** airline ******
let g:airline#extensions#tabline#enabled = 0
let g:airline_theme='kolor'



" ****** colorscheme ******
silent! colorscheme OceanicNext




" ****** vuejs ******
augroup VueJsFiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.vue call MySetVueOptions()
augroup END
function MySetVueOptions()
  set filetype=vue
  set syntax=html
 endfunction





