" remove spacebar mapping and make it leader
nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader="\\"

call plug#begin('~/.local/share/nvim/plugged')
    Plug 'nvim-lua/plenary.nvim' " required by some lua plugins
    Plug 'neovim/nvim-lspconfig'
    Plug 'folke/neodev.nvim'

    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'SirVer/ultisnips'

    " navigation
    Plug 'jremmen/vim-ripgrep'
    Plug 'easymotion/vim-easymotion'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate', 'branch': '0.5-compat'}
    Plug 'nvim-treesitter/nvim-treesitter-textobjects', {'branch': '0.5-compat'}

    " notification UI
    Plug 'j-hui/fidget.nvim'

    " git support
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " statusline
    Plug 'vim-airline/vim-airline' 

    """ utils
    Plug 'ryanoasis/vim-devicons'
    Plug 'machakann/vim-highlightedyank'
    Plug 'jiangmiao/auto-pairs'	
    Plug 'tpope/vim-surround'
    Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'v3.3.7'}
    Plug 'tpope/vim-sleuth', {'branch': 'v2.0'}

    Plug 'github/copilot.vim'

    " LSP servers installer
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'

    """ languages support
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'rust-lang/rust.vim'

    """ optionals
    " themes 
    Plug 'sainnhe/sonokai'
    let g:sonokai_diagnostic_text_highlight = 1
    let g:sonokai_disable_italic_comment=1
    let g:sonokai_style = 'atlantis'
    Plug 'joshdick/onedark.vim'
    Plug 'projekt0n/github-nvim-theme'
    let g:github_comment_style = 'none'

    Plug 'szw/vim-smartclose'

call plug#end()

"Automatically reloads neovim configuration file on write (w)
autocmd! bufwritepost init.vim source %

set encoding=utf-8
" allow buffers to open in background
set hidden
" Highlight the current line the cursor is on
"set cursorline
" set mouse to scroll nvim instead of terminal emulator output
set mouse=a

" search with case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

set nocompatible
set sessionoptions+=globals

" Showing line numbers and length
set number  " show line numbers
set tw=79   " width of document (used by gd)
set nowrap  " don't automatically wrap on load
set fo-=t   " don't automatically wrap text when typing
set colorcolumn=80,120
set signcolumn=yes

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" shorter updatetime for better UX
set updatetime=200
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" ensure spliting below or to the right
set splitbelow
set splitright

"" configure tabs spaces indetation
"" tabstop:          Width of tab character
"" softtabstop:      Fine tunes the amount of white space to be added
"" shiftwidth        Determines the amount of whitespace to add in normal mode
"" expandtab:        When this option is enabled, vi will use spaces instead of tabs
set tabstop=4 
"set softtabstop=4 
"set shiftwidth=4 
"set noexpandtab 
""set expandtab
"set smarttab
"set autoindent
" display tab and show them as the character |
"set list
"set lcs=tab:\|\ 

" Enable filetype plugins
filetype plugin on
filetype indent on

" syntax and theme options
syntax enable
if has('termguicolors')
  set termguicolors
endif
colorscheme sonokai
"highlight ColorColumn ctermbg=233 ctermfg=233 guibg=#262626 guifg=#262626

"Open file at same line last closed
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif

" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" persist undo history after closing file
try
    set undodir=~/.local/share/nvim/temp_dirs/undodir
    set undofile
catch
endtry

""" mappings

" easier command input, especially for keymaps with bad : location
" ; will work like :
nnoremap ; :
vnoremap ; :
" save with crtl-s
noremap <silent><C-S> :update<CR>
vnoremap <silent><C-S> <C-C>:update<CR>
inoremap <silent><C-S> <C-O>:update<CR>

" easier navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>w <C-W>
" easier tab navigation
nmap <leader>1 <esc>1gt
nmap <leader>2 <esc>2gt
nmap <leader>3 <esc>3gt
nmap <leader>4 <esc>4gt
nmap <leader>5 <esc>5gt
nmap <leader>6 <esc>6gt
nmap <leader>7 <esc>7gt
nmap <leader>8 <esc>8gt
nmap <leader>9 <esc>9gt
nmap <leader>0 <esc>0gt

"Highlights code for multiple indents without reselecting
vnoremap < <gv
vnoremap > >gv

" redraws the screen and removes any highlighting.
nnoremap <leader>l :nohl<CR><C-S-l>

nnoremap <leader>b <esc>:buffers<CR>

""" plugins configuration

" avoid conflict between ALE and coc-vim
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1

let g:lightline = {
	\ 'colorscheme': 'github_dark_default',
	\ }

let g:airline#extensions#tabline#enabled = 1
let g:airline_extensions = ['branch', 'quickfix', 'searchcount']
let g:airline_section_z = '%c %l/%L'
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'

let g:indentLine_enabled = 0
"let g:indentLine_char_list = ['⎸']
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_setColors = 0

" Utilsnips
let g:UltiSnipsExpandTrigger="<C-l>"

""" plugin mappings - <leader>p

"nnoremap <leader>pf :Black<CR>
nnoremap <leader>pa :ALEFix<CR>

" terminal
if has('nvim')
    command! -nargs=* T split | resize 16 | terminal <args>
    command! -nargs=* VT vsplit | terminal <args>
    nnoremap <leader><S-T> <esc>:T<CR>

    " exit terminal mode
    :tnoremap <esc><esc> <C-\><C-n>
    " enable window navigation while in terminal mode
    :tnoremap <C-w> <C-\><C-n><C-w>

    " auto close terminal window after shell exit
    augroup terminal_settings
        autocmd!

        autocmd BufWinEnter,WinEnter term://* startinsert
        autocmd BufLeave term://* stopinsert

        " Ignore various filetypes as those will close terminal automatically
        " Ignore fzf, ranger, coc
        autocmd TermClose term://*
              \ if (expand('<afile>') !~ "fzf") && (expand('<afile>') !~ "ranger") && (expand('<afile>') !~ "coc") |
              \   call nvim_input('<CR>')  |
              \ endif
    augroup END
endif

" enable when using _ as terminal cursor so vim can reset it on exit
"au VimLeave * set guicursor=a:hor100

" spellcheck
" use F11 to toggle spellcheck
" use <C-x>s in insert mode to show suggestions
set spelllang=en
set spellsuggest=best,9
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

lua << EOF
	require'init'
EOF
