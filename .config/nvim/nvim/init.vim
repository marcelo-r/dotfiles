" do not load any config when embedded in vscode
if !exists('g:vscode')
    "Automatically reloads neovim configuration file on write (w)
    autocmd! bufwritepost init.vim source %

    "set nocompatible

    """ setup plugins
    call plug#begin('~/.local/share/nvim/plugged')

    "Plug 'sheerun/vim-polyglot'

    " neovim native LSP client
    "Plug 'neovim/nvim-lspconfig'

    " language client and completion engine
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    set sessionoptions+=globals

    " syntax checker
    Plug 'dense-analysis/ale'
    " avoid conflict with coc-vim
    let g:ale_disable_lsp = 1
    let g:ale_sign_column_always = 1
    let g:ale_elixir_elixir_ls_release = '~/.elixir-ls/release'

    " file explorer - nerd tree
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/fzf.vim'
    let g:fzf_command_prefix = 'Fzf'
    let g:fzf_buffers_jump = 1
    "let g:fzf_layout = { 'down': '40%' }
    let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6, 'border': 'rounded', 'highlight': 'Identifier',  }}

    Plug 'jremmen/vim-ripgrep'

    " git support
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    let g:gitgutter_enabled = 1
    let g:gitgutter_signs = 1

    " git symbols on NERDTree
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " status line
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    Plug 'itchyny/lightline.vim'

    " better comments
    Plug 'scrooloose/nerdcommenter'

    " auto complete () [] {} '' etc
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'

    " syntax code checker
    Plug 'neomake/neomake'
    " neomake - python linter
    let g:neomake_python_enabled_makers = ['pylint']

    " python docstrings
    Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
    let g:pydocstring_formatter = 'sphinx'
    nmap <leader>pd <Plug>(pydocstring)
    " python auto format
    Plug 'psf/black', { 'branch': 'stable', 'for': 'python' }
    
    " golang
    Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
    Plug 'sebdah/vim-delve'
    "let g:go_code_completion_enabled = 0
    "let g:go_def_mapping_enabled = 0
    let g:go_def_mode='gopls'
    "let g:go_auto_sameids = 1
    let g:go_auto_type_info = 1
    let g:go_doc_popup_window = 1
    let g:go_fillstruct_mode = 'gopls'
    let g:go_def_reuse_buffer = 1
    let g:go_metalinter_autosave = 1
    let g:go_metalinter_autosave_enabled = ['all']
    let g:go_list_height = 10
    " Auto formatting and importing
    let g:go_fmt_autosave = 1
    let g:go_fmt_command = "goimports"
    " syntax highlight
    let g:go_highlight_operators = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_parameters = 0
    let g:go_highlight_function_calls = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_extra_types = 1

    "rust lang
    Plug 'rust-lang/rust.vim'
    let g:rustfmt_autosave = 1

    Plug 'ctrlpvim/ctrlp.vim'

    " general LISP family support
    Plug 'kovisoft/slimv'
    
    " racket 
    Plug 'wlangstroth/vim-racket'

    " elixir
    Plug 'elixir-editors/vim-elixir'
    autocmd FileType elixir setlocal formatprg=mix\ format\ -

    " yaml 
    Plug 'stephpy/vim-yaml'

    "docker
    Plug 'ekalinin/dockerfile.vim'
    
    """ utils
    Plug 'easymotion/vim-easymotion'
    Plug 'kien/rainbow_parentheses.vim'
    " highlight copied text
    Plug 'machakann/vim-highlightedyank'
    " auto toggle relative line numbers
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    set number relativenumber

    " vim-tmux integration
    Plug 'preservim/vimux'

    Plug 'Yggdroot/indentLine'
    let g:indentLine_char_list = ['⎸']

    " better folding
    Plug 'Konfekt/FastFold'
    " python folding
    Plug 'tmhedberg/SimpylFold'
    let g:SimpylFold_docstring_preview = 1

    Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType = "<c-n>"

    " Utilsnips
    Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger="<c-space>"

    """ themes 
    Plug 'joshdick/onedark.vim'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'sainnhe/sonokai'
    let g:sonokai_diagnostic_text_highlight = 1

    Plug 'tomasr/molokai'

    Plug 'morhetz/gruvbox'
    let g:gruvbox_contrast_dark = 'hard'

    call plug#end()

    " must come after plug#end
    " Full config: when writing or reading a buffer, and on changes in insert and
    " normal mode (after 500ms; no delay when writing).
    call neomake#configure#automake('nrwi', 300)
    
    " Highlight the current line the cursor is on
    set cursorline
    
    " set mouse to scroll nvim instead of terminal emulator output
    set mouse=a

    " remove spacebar mapping and make it leader
    nnoremap <SPACE> <Nop>
    let mapleader=" "
    let maplocalleader=","
    
    " allow buffers to open in background
    set hidden

    " search with case insensitive
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase
    
    " Showing line numbers and length
    set number  " show line numbers
    set tw=79   " width of document (used by gd)
    set nowrap  " don't automatically wrap on load
    set fo-=t   " don't automatically wrap text when typing
    set colorcolumn=80
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
    "set cmdheight=2
    
    " shorter updatetime for better UX
    " (default is 4000 ms = 4 s)
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " ensure spliting below or to the right
    set splitbelow
    set splitright

    " syntax and theme options
    syntax on

    if has('termguicolors')
      set termguicolors
    endif

    " theme
    let g:sonokai_style = 'atlantis'
    colorscheme sonokai

    " status bar theme
    let g:lightline = {'colorscheme' : 'sonokai'}

    " easier command input, especially for keymaps with bad : location
    " ; will work like :
    nnoremap ; :
    vnoremap ; :
    
    " easier navigation
    nnoremap <C-J> <C-W><C-J>
    nnoremap <C-K> <C-W><C-K>
    nnoremap <C-L> <C-W><C-L>
    nnoremap <C-H> <C-W><C-H>

    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " redraws the screen and removes any highlighting.
    nnoremap <leader>l :nohl<CR><C-S-l>

    nnoremap <leader>pf <esc>:Black<CR>

    " fzf
    nmap <leader>ff <esc>:FzfFiles<CR>
    nmap <leader>fe <esc>:FzfGFiles<CR>
    nmap <leader>fc <esc>:FzfCommands<CR>
    nmap <leader>fs <esc>:FzfLines<CR>
    nmap <leader>bb <esc>:FzfBuffers<CR>

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    map <C-N> :NERDTreeToggle<CR>
    nnoremap <leader>af :ALEFix<CR>
    
    " easier moving between tabs
    "map <leader>bp <esc>:tabprevious<CR>
    "map <leader>bn <esc>:tabnext<CR>

    " Use <C-l> for trigger snippet expand.
    imap <C-l> <Plug>(coc-snippets-expand)

    "Highlights code for multiple indents without reselecting
    vnoremap < <gv
    vnoremap > >gv

    " when no file specified, open nerdtree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    " configure tabs spaces indetation
    set tabstop=4 softtabstop=0 expandtab shiftwidth=4 smarttab

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
    " autocompletion on tab key
    inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
    set splitbelow
    
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

    "Open file at same line last closed
    if has("autocmd")
      au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g'\"" | endif
    endif

    " terminal
    if has('nvim')
        command! -nargs=* T split | resize 16 | terminal <args>
        command! -nargs=* VT vsplit | terminal <args>
        nnoremap <leader><S-T> <esc>:T<CR>

        " quick exit the terminal 
        ":tnoremap <C-t> <C-\><C-n>:q<CR>
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

    au VimLeave * set guicursor=a:hor100
endif

