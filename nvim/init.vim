" remove spacebar mapping and make it leader
nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader="\\"

call plug#begin('~/.local/share/nvim/plugged')
	Plug 'nvim-lua/plenary.nvim' " required by some lua plugins
	Plug 'neovim/nvim-lspconfig'

	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'

	Plug 'dense-analysis/ale'							" linters
	Plug 'SirVer/ultisnips'								" snippets
	" navigation
	Plug 'jremmen/vim-ripgrep'							" ripgrep plugin
	Plug 'easymotion/vim-easymotion'
	Plug 'nvim-telescope/telescope.nvim'
	" git support
	Plug 'tpope/vim-fugitive'							" git integration
	Plug 'airblade/vim-gitgutter'						" show diff on buffer
	" status line (choose one of these)
	Plug 'vim-airline/vim-airline'
	"Plug 'itchyny/lightline.vim'
	""" utils
	Plug 'ryanoasis/vim-devicons'						" icons for nerdtree
	Plug 'machakann/vim-highlightedyank'				" highlight copied text
	Plug 'jiangmiao/auto-pairs'							" auto close () [] {} '' etc
	Plug 'tpope/vim-surround'							" surround phrases with stuff
	Plug 'Yggdroot/indentLine'							" show indetation level
	let g:indentLine_char_list = ['|', '¦', '┆', '┊']

	Plug 'github/copilot.vim'
	"call Copilot('disable')
	"imap <silent><script><expr> <C-Space> copilot#Accept("\<CR>")
	"let g:copilot_no_tab_map = v:true

	""" languages support
	" golang
	Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
	" rust
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

	" only in neovim:
	if has('nvim')
		Plug 'radenling/vim-dispatch-neovim'
		" minimap
		"Plug 'wfxr/minimap.vim'
		"let g:minimap_width = 10
		"let g:minimap_git_colors = 1
	endif
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
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("patch-8.1.1564")
"  " Recently vim can merge signcolumn and number column into one
"  set signcolumn=number
"else
"  set signcolumn=yes
"endif
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

" configure tabs spaces indetation
" tabstop:          Width of tab character
" softtabstop:      Fine tunes the amount of white space to be added
" shiftwidth        Determines the amount of whitespace to add in normal mode
" expandtab:        When this option is enabled, vi will use spaces instead of tabs
set tabstop=4 
set softtabstop=4 
set shiftwidth=4 
set noexpandtab 
"set expandtab
set smarttab
set autoindent
" display tab and show them as the character |
set list
set lcs=tab:\|\ 

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
set list lcs=tab:\|\ 

" Utilsnips
let g:UltiSnipsExpandTrigger="<C-l>"

""" plugin mappings - <leader>p

"nnoremap <leader>pf :Black<CR>
nnoremap <leader>pa :ALEFix<CR>

""" functions
" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
    if pumvisible()
        if a:action == 'j'
            return "\<C-N>"
        elseif a:action == 'k'
            return "\<C-P>"
        endif
    endif
    return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

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
