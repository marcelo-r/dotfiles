"Automatically reloads neovim configuration file on write (w)
autocmd! bufwritepost init.vim source %

call plug#begin('~/.local/share/nvim/plugged')
""" base for IDE-like XP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
" file explorer 
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'
" git support
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
" status line
Plug 'vim-airline/vim-airline'
"Plug 'itchyny/lightline.vim'
""" utils
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'machakann/vim-highlightedyank'
" auto close () [] {} '' etc
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
""" langs
" python
"Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'psf/black', { 'branch': 'stable', 'for': 'python' }
" golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'sebdah/vim-delve'
" yaml 
Plug 'stephpy/vim-yaml'
"docker
Plug 'ekalinin/dockerfile.vim'
Plug 'Konfekt/FastFold'

""" optionals
" themes 
Plug 'sainnhe/sonokai'
let g:sonokai_diagnostic_text_highlight = 1
Plug 'joshdick/onedark.vim'
" minimap
if has('nvim-0.5')
    Plug 'wfxr/minimap.vim'
    let g:minimap_width = 10
    let g:minimap_git_colors = 1
endif
"Plug 'jeffkreeftmeijer/vim-numbertoggle'
"set number relativenumber
"Plug 'ervandew/supertab'
"let g:SuperTabDefaultCompletionType = "<c-n>"
Plug 'szw/vim-smartclose'

call plug#end()

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
highlight ColorColumn ctermbg=233
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Give more space for displaying messages.
set cmdheight=2
" shorter updatetime for better UX
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" ensure spliting below or to the right
set splitbelow
set splitright

" configure tabs spaces indetation
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab smarttab

" Enable filetype plugins
filetype plugin on
filetype indent on

" syntax and theme options
syntax enable
if has('termguicolors')
  set termguicolors
endif
let g:sonokai_style = 'atlantis'
colorscheme sonokai

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
" remove spacebar mapping and make it leader
nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader=","

" easier command input, especially for keymaps with bad : location
" ; will work like :
nnoremap ; :
vnoremap ; :

" easier navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>w <C-W>

"Highlights code for multiple indents without reselecting
vnoremap < <gv
vnoremap > >gv

" redraws the screen and removes any highlighting.
nnoremap <leader>l :nohl<CR><C-S-l>

""" plugins configuration

" avoid conflict between ALE and coc-vim
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1

let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6, 'border': 'rounded', 'highlight': 'Identifier',  }}

let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1

let g:lightline = {
	\ 'colorscheme': 'sonokai',
	\ }

let g:airline#extensions#tabline#enabled = 1
let g:airline_extensions = ['fzf', 'branch', 'coc', 'quickfix', 'searchcount']
let g:airline_section_z = '%c %l/%L'
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#buffers_label = 'b'
let g:airline#extensions#tabline#tabs_label = 't'

let g:go_code_completion_enabled = 0
let g:go_info_mode='gopls'
let g:go_def_mode='gopls'
let g:go_doc_popup_window = 1
let g:go_metalinter_command = 'golangci-lint'
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = [ 'bodyclose', 'deadcode', 'depguard', 'dogsled', 'dupl',
    		\ 'errcheck', 'exhaustive', 'gochecknoinits', 'goconst', 'gocritic',
    		\ 'gocyclo', 'gofmt', 'goimports', 'revive', 'gomnd',
    		\ 'goprintffuncname', 'gosec', 'gosimple', 'govet', 'ineffassign',
    		\ 'lll', 'misspell', 'nakedret', 'noctx', 'nolintlint',
    		\ 'rowserrcheck', 'exportloopref', 'staticcheck', 'structcheck', 'stylecheck',
    		\ 'typecheck', 'unconvert', 'unparam', 'unused', 'varcheck',
    		\ 'asciicheck', 'gocognit', 'godox', 'goerr113', 'nestif',
    		\ 'prealloc', 'whitespace']
let g:go_metalinter_autosave_enabled = ['vet', 'revive', 'errcheck', 'deadcode',
	\ 'ineffassign', 'lll', 'staticcheck', 'prealloc', 
	\ 'gomnd', 'goconst', 'gosec']
"let g:go_metalinter_deadline = "3s"
"let g:go_list_height = 5 
let g:go_list_type = "locationlist"
let g:go_test_show_name = 1
let g:go_jump_to_error = 0
let g:go_fmt_autosave = 1
" syntax highlight
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
"let g:go_highlight_build_constraints = 1
"let g:go_highlight_function_parameters = 0
"let g:go_highlight_function_calls = 1
"let g:go_highlight_fields = 1
"let g:go_highlight_extra_types = 1

let g:indentLine_char_list = ['⎸']

" Utilsnips
let g:UltiSnipsExpandTrigger="<C-l>"

""" plugin mappings - <leader>p
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

" coc.nvim
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <F2> <Plug>(coc-rename)

" Navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <leader>[ <Plug>(coc-diagnostic-prev)
nmap <leader>] <Plug>(coc-diagnostic-next)

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" completion on enter
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" completion trigger and confirmation using tab
"inoremap <silent><expr> <TAB>
"  \ pumvisible() ? coc#_select_confirm() :
"  \ coc#expandableOrJumpable() ?
"  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"  \ <SID>check_back_space() ? "\<TAB>" :
"  \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"let g:coc_snippet_next = '<tab>'

" Remap <C-f> and <C-b> for scroll float windows/popups. (optional)
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

" fzf
nmap <leader>ff <esc>:FzfFiles<CR>
nmap <leader>fe <esc>:FzfGFiles<CR>
nmap <leader>fc <esc>:FzfCommands<CR>
nmap <leader>fs <esc>:FzfLines<CR>
nmap <leader>bb <esc>:FzfBuffers<CR>

nnoremap <leader>pn :NERDTreeToggle<CR>
nnoremap <leader>pm :MinimapToggle<CR>
nnoremap <leader>pf :Black<CR>
nnoremap <leader>pa :ALEFix<CR>

" custom commands
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')
" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 ORG :call CocAction('runCommand', 'editor.action.organizeImport')

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

" Use K to show documentation in preview window
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
au VimLeave * set guicursor=a:hor100

