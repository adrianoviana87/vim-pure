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
set wildignore+=node_modules/**




" ****** editing text ******
set backspace=indent,eol,start

set undodir=~/vimundo
set colorcolumn=80



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
set modeline
set nobackup




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




" ****** syntax, highlighting and spelling ******
syntax enable
set nospell
set spelllang=en
set t_Co=256
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
set guifont=Cousine\ Nerd\ Font:h14
set guioptions+=! " execute commands inside vim terminal emulator
set guioptions-=a " set selection to system clipboard but not in * register
set guioptions+=P " set selection to system clipboard in + register instead
set guioptions+=c " use console dialog for simple choices
set guioptions+=e " show tab pages in gui
set guioptions-=t " no option to detach system menu
set guioptions-=T " no toolbar
set guioptions-=r " right hand scrollbar not always present
set guioptions-=R " right hand scrollbar not present when there is a vsplit
set guioptions-=l " left hand scrollbar not always present
set guioptions-=L " left hand scrollbar not present when there is a vsplit
set guioptions-=b " no bottom scrollbar
set guioptions-=m " no menubar
set splitright




" ****** Insert mode ******
inoremap <c-J> <esc>
inoremap jk <esc>
inoremap kj <esc>
inoremap <c-\> <esc>:CocCommand terminal.Toggle<cr>
inoremap idate <C-O>:Date<cr>


" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


" ****** Command mode ******
let mapleader = "\<Space>"
let g:mapleader = "\<Space>"
let maplocalleader="\<Space>"
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
nnoremap <c-n> :CocCommand explorer <cr>
nnoremap <leader>, <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>
nnoremap <leader>= :Goyo<cr>
nnoremap <leader>+ :Limelight!!<cr>
nnoremap <leader>o :CocList outline<cr>
nnoremap <leader>r :CocListResume<cr>
nnoremap <leader>d gg=Gg;
nnoremap <leader>tt :CocCommand terminal.Toggle<cr>
nnoremap <c-\> :CocCommand terminal.Toggle<cr>
nnoremap <leader>cm :CocList marketplace<cr>
nnoremap <leader>j :CocNext<cr>
nnoremap <leader>k :CocPrev<cr>
nnoremap <leader>cl :color zellner<cr> :set background=light<cr> :AirlineTheme base16_google_light<cr>
nnoremap <leader>cd :color onedark<cr> :set background=dark<cr> :AirlineTheme onedark<cr>

" search all non-checked checkboxes in a markdown format
nnoremap <leader>td /☐<cr>

" search all checkbox in edit status (markdown format)
nnoremap <leader>tc /👉<cr>

" marks the todo item as done
nnoremap <leader>tx r☑

" adds a new todo item below
nnoremap <leader>tn o- ☐ 

" adds a new todo subitem below
nnoremap <leader>ts o- ☐ <C-O>>><C-O>A

" marks the todo item as current
nnoremap <leader>tw r👉


" open jira ticket under the cursor
nnoremap <leader>j :OpenJira<cr>

" open PR on github
nnoremap <leader>pv :GhPrView<cr>

" go to previous next error
nnoremap <down> :cnext<cr>

" go to previous error
nnoremap <up> :cprev<cr>

" go to first error
nnoremap <left> :cfirst<cr>

" go to last error
nnoremap <right> :clast<cr>

" print current file's path
nnoremap <leader>pwd :Pwd<cr>




" ****** Terminal mode *******
tnoremap <c-j> <c-\><c-n>
tnoremap <c-\> <c-\><c-n>:CocCommand terminal.Toggle<cr>




" ****** File explorer ******
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 30
let g:netrw_banner = 0




" ****** the swap file ******
set directory=$HOME/vimswp//
set noswapfile





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


if !exists('g:vscode')

  " ****** Plugins ******
  call plug#begin('~/dot-files/vim-pure/plugged')

  Plug 'kana/vim-textobj-user'
  Plug 'sgur/vim-textobj-parameter'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-fugitive'
  Plug 'w0rp/ale'
  Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'
  Plug 'junegunn/goyo.vim'
  Plug 'arrufat/vala.vim'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'ledger/vim-ledger'
  Plug 'OmniSharp/omnisharp-vim'
  Plug 'jackguo380/vim-lsp-cxx-highlight'
  Plug 'pangloss/vim-javascript'
  Plug 'joshdick/onedark.vim'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'yuezk/vim-js'
  Plug 'marcopaganini/mojave-vim-theme'
  Plug 'marcopaganini/termschool-vim-theme'
  Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
  Plug 'freitass/todo.txt-vim'
  Plug 'jacoborus/tender.vim'
  Plug 'rktjmp/lush.nvim'
  Plug 'alaric/nortia.nvim'  
  Plug 'junegunn/seoul256.vim'

  call plug#end()

  let dark_light = exists('$THEME_COLOR') ? $THEME_COLOR : 'dark'

  " ****** ALE ******
  let g:ale_linters = {
        \ 'typescript': [],
        \ 'javascript': ['eslint'],
        \ 'c': [],
        \ 'cpp': []
        \}

  " Set this. Airline will handle the rest.
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
  let g:airline_powerline_fonts = 1
  let g:airline#extensions#branch#displayed_head_limit = 10



  " ****** airline ******
  let g:airline#extensions#tabline#enabled = 1

  let g:airline_theme= dark_light == 'dark' ? 'onedark' : 'base16_google_light'




  " ****** colorscheme ******
  " For Neovim 0.1.3 and 0.1.4
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  
  if dark_light == 'dark'
    set background=dark
    silent! colorscheme seoul256
  else
    set background=light
    silent! colorscheme zellner
  endif

  hi Normal guibg=NONE ctermbg=NONE
  " highlight CocSelectedLine guibg=BLUE

  " ****** javascript *******
  let g:javascript_plugin_jsdoc = 1

  " ****** vuejs ******
  augroup VueJsFiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.vue call MySetVueOptions()
  augroup END
  function MySetVueOptions()
    set filetype=vue
    set syntax=html
  endfunction

  " ******** OmniSharp **********
  let g:OmniSharp_server_stdio = 0
  let g:OmniSharp_highlight_types = 3
  let g:OmniSharp_timeout = 10
  augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>

    " Finds members in the current buffer
    autocmd FileType cs nnoremap <buffer> <Leader>fm :OmniSharpFindMembers<CR>

    autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>tt :OmniSharpTypeLookup<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>dc :OmniSharpDocumentation<CR>
    autocmd FileType cs nnoremap <buffer> <C-\> :OmniSharpSignatureHelp<CR>
    autocmd FileType cs inoremap <buffer> <C-\> <C-o>:OmniSharpSignatureHelp<CR>

    " Navigate up and down by method/property/field
    autocmd FileType cs nnoremap <buffer> <C-k> :OmniSharpNavigateUp<CR>
    autocmd FileType cs nnoremap <buffer> <C-j> :OmniSharpNavigateDown<CR>

    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    autocmd FileType cs nnoremap <buffer> <Leader>. :OmniSharpGetCodeActions<CR>
    " Run code actions with text selected in visual mode to extract method
    autocmd FileType cs xnoremap <buffer> <Leader><Space> :call OmniSharp#GetCodeActions('visual')<CR>

    " Rename with dialog
    autocmd FileType cs nnoremap <buffer> <Leader>nm :OmniSharpRename<CR>
    autocmd FileType cs nnoremap <buffer> <F2> :OmniSharpRename<CR>
    " Rename without dialog - with cursor on the symbol to rename: `:Rename newname`
    command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

    autocmd FileType cs nnoremap <buffer> <Leader>cf :OmniSharpCodeFormat<CR>

    " Start the omnisharp server for the current solution
    autocmd FileType cs nnoremap <buffer> <Leader>ss :OmniSharpStartServer<CR>
    autocmd FileType cs nnoremap <buffer> <Leader>sp :OmniSharpStopServer<CR>
  augroup END

  augroup clangd_commands
    autocmd!

    autocmd CursorHold *.cpp CocCommand clangd.symbolInfo
    autocmd CursorHold *.c CocCommand clangd.symbolInfo
    autocmd CursorHold *.h CocCommand clangd.symbolInfo
    autocmd CursorHold *.hpp CocCommand clangd.symbolInfo

    autocmd FileType cpp nnoremap <buffer> <leader>h  :CocCommand clangd.switchSourceHeader<CR>
    autocmd FileType cpp nnoremap <buffer> <leader>d  :!clang-format -style=file -i %<cr>



  augroup END

  command! -nargs=* T split | terminal <args>
  command! -nargs=* VT vsplit | terminal <args>

  " **** Neovide ***
  let g:neovide_cursor_animation_length=0.15
  let g:neovide_cursor_trail_length=1
  let g:neovide_cursor_antialiasing=v:false
  let g:neovide_cursor_vfx_mode = "torpedo"
" other options for particles: pixiedust
  let g:neovide_cursor_vfx_particle_lifetime=10
  let g:neovide_cursor_vfx_opacity=250.0
  let g:neovide_cursor_vfx_particle_density=30
  let g:neovide_cursor_vfx_particle_speed=20.0
  let g:neovide_cursor_vfx_particle_phase=1.5
  let g:neovide_fullscreen=v:false

  " GIT
  nnoremap <leader>gs :Git<cr>
  nnoremap <leader>gc :Git commit<cr>
  nnoremap <leader>gp :Git push<cr>
  let g:coc_git_status=""
  let b:coc_git_status=""

endif "not in vscode

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Commands

command! -nargs=0 NoteTaking :tabedit ~/Documents/note-taking/tatango.todo.md
command! -nargs=0 PrTemplate :tabedit ~/Documents/note-taking/tatango.pr.template.md
command! -nargs=0 AlacrittyConfig :tabedit ~/.config/alacritty/alacritty.yml
command! -nargs=0 FontRanking :tabedit ~/Documents/note-taking/fonts-ranking.md


function CopyPath()
	let @*=expand('%')
endfunction

function CopyFileName()
	let @*=expand('%:t')
endfunction

command! -nargs=0 CopyPath call CopyPath()
command! -nargs=0 CopyFileName call CopyFileName()
command! Date :normal a<C-R>=strftime(' %Y-%m-%dT%H:%M')<CR>
command! TimeTrackingNewRow :normal o<C-R>=strftime('%Y-%m-%d')<CR>,00:00,00:00,,JUP-,<ESC>0f,l
command! OpenJira :normal yiW:!xdg-open https://tatango.atlassian.net/browse/<C-R>0<cr>
command! GhPrView :normal yiw:!xdg-open https://github.com/tatango/backend/pull/<C-R>0<cr>
command! Todos :tabedit ~/Documents/note-taking/tatango.todo.md
command! Pwd :echo expand('%')
command! ConfigNeovim :tabedit ~/vim-pure/settings.vim
