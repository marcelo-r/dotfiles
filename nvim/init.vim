call plug#begin('~/.local/share/nvim/plugged')

""" base for IDE-like XP
Plug 'sheerun/vim-polyglot'							" sytanx highlight
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" intellisense
Plug 'dense-analysis/ale'							" linters
Plug 'SirVer/ultisnips'								" snippets
" file explorer 
Plug 'scrooloose/nerdtree'							" sidebar explorer
Plug 'ryanoasis/vim-devicons'						" icons for nerdtree
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'							" ripgrep plugin
" git support
Plug 'tpope/vim-fugitive'							" git integration
Plug 'airblade/vim-gitgutter'						" show diff on buffer
Plug 'Xuyuanp/nerdtree-git-plugin'					" git icons for nerdtree
" status line (choose one of these)
Plug 'vim-airline/vim-airline'
"Plug 'itchyny/lightline.vim'
""" utils
Plug 'ctrlpvim/ctrlp.vim' "				
Plug 'scrooloose/nerdcommenter'
Plug 'easymotion/vim-easymotion'
Plug 'machakann/vim-highlightedyank'				" highlight copied text
Plug 'jiangmiao/auto-pairs'							" auto close () [] {} '' etc
"Plug 'luochen1990/rainbow'							" rainbow parenteses
Plug 'tpope/vim-surround'							" surround phrases with stuff
Plug 'Yggdroot/indentLine'							" show indetation level
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

Plug 'github/copilot.vim'
"call Copilot('disable')
"imap <silent><script><expr> <C-Space> copilot#Accept("\<CR>")
"let g:copilot_no_tab_map = v:true

""" languages support
" python
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'psf/black', { 'branch': 'stable', 'for': 'python' }
" golang
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'sebdah/vim-delve'
" rust
Plug 'rust-lang/rust.vim'
" yaml 
Plug 'stephpy/vim-yaml'
"docker
Plug 'ekalinin/dockerfile.vim'
Plug 'Konfekt/FastFold'
Plug 'andrewstuart/vim-kubernetes'
" typescript
"Plug 'neovim/nvim-lspconfig'
"Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'MunifTanjim/prettier.nvim'
" formatting in normal mode
nmap <localleader>f <Plug>(prettier-format)

""" optionals
" themes 
Plug 'sainnhe/sonokai'
let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_disable_italic_comment=1
let g:sonokai_style = 'atlantis'
Plug 'joshdick/onedark.vim'
Plug 'projekt0n/github-nvim-theme'
let g:github_comment_style = 'none'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}

" only in neovim:
if has('nvim-0.5')
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
" remove spacebar mapping and make it leader
nnoremap <SPACE> <Nop>
let mapleader=" "
let maplocalleader="\\"

" easier command input, especially for keymaps with bad : location
" ; will work like :
"nnoremap ; :
"vnoremap ; :
"nnoremap <C-S> :w<CR>
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

" open NERDTree on starup when no file specified
function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction
autocmd VimEnter * call StartUp()

let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=1
let NERDTreeIgnore=["\.git$", "\.vscode", "bin$"]

" avoid conflict between ALE and coc-vim
let g:ale_disable_lsp = 1
let g:ale_sign_column_always = 1
let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\}

let g:fzf_command_prefix = 'Fzf'
let g:fzf_buffers_jump = 1
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'rounded', 'highlight': 'Identifier',  }}
"let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'relative': v:true, 'yoffset': 1.0 } }
"let g:fzf_layout = { 'down': '~40%' }
" See `man fzf-tmux` for available options
if exists('$TMUX')
	let g:fzf_layout = { 'tmux': '-p70%,60%' }
else
	let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6, 'border': 'rounded', 'highlight': 'Identifier',  }}
endif

let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1

let g:lightline = {
	\ 'colorscheme': 'github_dark_default',
	\ }

let g:airline#extensions#tabline#enabled = 1
let g:airline_extensions = ['fzf', 'branch', 'coc', 'quickfix', 'searchcount']
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
" coc.nvim
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Symbol renaming.
nmap <leader>r <Plug>(coc-rename)

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

" completion confirm on enter
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Use tab to trigger completion and navigate to next item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"inoremap <silent><expr> <CR>
"  \ pumvisible() ? coc#_select_confirm() :
"  \ coc#expandableOrJumpable() ?
"  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"  \ <SID>check_back_space() ? "\<CR>" :
"  \ coc#refresh()
"
"function! s:check_back_space() abort
"  let col = col('.') - 1
"  return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"let g:coc_snippet_next = '<CR>'

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
nmap <leader>fb <esc>:FzfBuffers<CR>
nmap <leader>bb <esc>:FzfBuffers<CR>
nmap <leader>fr <esc>:FzfRg<CR>

nnoremap <leader>pn :NERDTreeToggle<CR>
nnoremap <leader>pm :MinimapToggle<CR>
"nnoremap <leader>pf :Black<CR>
nnoremap <leader>pa :ALEFix<CR>

xmap <leader>pf  <Plug>(coc-format-selected)
nmap <leader>pf  <Plug>(coc-format-selected)

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
"nnoremap <silent> K :call <SID>show_documentation()<CR>
"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  elseif (coc#rpc#ready())
"    call CocActionAsync('doHover')
"  else
"    execute '!' . &keywordprg . " " . expand('<cword>')
"  endif
"endfunction

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Remap <C-f> and <C-b> to scroll float windows/popups
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif


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

nnoremap <leader>pn :NERDTreeToggle<CR>
" sync nerdtree
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction
nnoremap <silent> <leader>k :bnext<CR>:call SyncTree()<CR>
nnoremap <silent> <leader>j :bprev<CR>:call SyncTree()<CR>
nnoremap <silent> <F12> :NERDTreeToggle<cr><c-w>l:call SyncTree()<cr><c-w>h
nnoremap <silent> <leader>pn :NERDTreeToggle<cr><c-w>l:call SyncTree()<cr><c-w>h

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

" enable when using _ as terminal cursor so vim can reset it on exit
au VimLeave * set guicursor=a:hor100

" spellcheck
" use F11 to toggle spellcheck
" use <C-x>s in insert mode to show suggestions
set spelllang=en
set spellsuggest=best,9
nnoremap <silent> <F11> :set spell!<cr>
inoremap <silent> <F11> <C-O>:set spell!<cr>

"let &t_SI = "\e[4 q"
"let &t_EI = "\e[4 q"
