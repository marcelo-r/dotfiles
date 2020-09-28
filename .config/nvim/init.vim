if !exists('g:vscode')
    " remove space bar map
    " make it leader
    nnoremap <SPACE> <Nop>
    let mapleader=" "
    " set mouse to scroll nvim instead of terminal emulator output
    set mouse=a

    " search with case insensitive
    set hlsearch
    set incsearch
    set ignorecase
    set smartcase

    " Some servers have issues with backup files, see #649.
    set nobackup
    set nowritebackup

    " Give more space for displaying messages.
    set cmdheight=2

    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300

    " Don't pass messages to |ins-completion-menu|.
    set shortmess+=c

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved.
    if has("patch-8.1.1564")
      " Recently vim can merge signcolumn and number column into one
      set signcolumn=number
    else
      set signcolumn=yes
    endif

    set splitbelow
    set splitright
    
    """ keymap
    " easier command input, especially for keymaps with bad : location
    " ; will work like :
    nnoremap ; :
    vnoremap ; :

    " easier moving between tabs
    map <leader>bn <esc>:tabprevious<CR>
    map <leader>bm <esc>:tabnext<CR>
    
    " insert ipython debugger line
    map <Leader>id import ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

    if has('nvim')
        command! -nargs=* T split | resize 16 | terminal <args>
        command! -nargs=* VT vsplit | terminal <args>
        nnoremap <leader>t <esc>:T<CR>
        vnoremap <leader>t <esc>:T<CR>

        " quick exit the terminal 
        :tnoremap <C-t> <C-\><C-n>:q<CR>
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


    
    " i don't know what this does, but 'stackoverflow' recommends
    set hidden


    " Showing line numbers and length
    set number  " show line numbers
    set tw=79   " width of document (used by gd)
    set nowrap  " don't automatically wrap on load
    set fo-=t   " don't automatically wrap text when typing
    set colorcolumn=80
    highlight ColorColumn ctermbg=233


    """ setup plugins
    call plug#begin('~/.local/share/nvim/plugged')

    " language client and completion engine
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    set statusline^=%{coc#status()}
    set sessionoptions+=globals
    " coc recommends
    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Use K to show documentation in preview window
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      else
        call CocAction('doHover')
      endif
    endfunction




    " file explorer - nerd tree
    Plug 'scrooloose/nerdtree'
    map <C-N> :NERDTreeToggle<CR>

    " minimap
    Plug 'severin-lemaignan/vim-minimap'

    Plug 'jremmen/vim-ripgrep'

    " git support
    " git symbols on gutter
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'

    " git symbols on NERDTree
    Plug 'Xuyuanp/nerdtree-git-plugin'

    " auto complete
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

    """ auto complete - python
    "Plug 'davidhalter/jedi-vim'

    "Plug 'deoplete-plugins/deoplete-jedi'

    " bar
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " better comments
    Plug 'scrooloose/nerdcommenter'

    " auto complete () [] {} '' etc
    Plug 'jiangmiao/auto-pairs'
    Plug 'tpope/vim-surround'

    " syntax code checker
    Plug 'neomake/neomake'
    Plug 'psf/black', { 'branch': 'stable', 'for': 'python' }

    "Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

    """ support for file types and languages
    " python docstrings
    Plug 'heavenshell/vim-pydocstring', { 'do': 'make install' }
    let g:pydocstring_formatter = 'sphinx'
    nmap <silent> <C-_> <Plug>(pydocstring)
    
    "go lang
    Plug 'fatih/vim-go' 
    let g:go_def_mapping_enabled = 0

    " yaml 
    Plug 'stephpy/vim-yaml'

    "docker
    Plug 'ekalinin/dockerfile.vim'
    
    "rust lang
    Plug 'rust-lang/rust.vim'
    let g:rustfmt_autosave = 1

    Plug 'ctrlpvim/ctrlp.vim'

    "clojure
    Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'tpope/vim-salve'
    Plug 'tpope/vim-fireplace'

    """ utils
    " highlight copied text
    Plug 'machakann/vim-highlightedyank'
    " auto toggle relative line numbers
    Plug 'jeffkreeftmeijer/vim-numbertoggle'
    set number relativenumber

    " better folding
    Plug 'Konfekt/FastFold'
    " python folding
    Plug 'tmhedberg/SimpylFold'
    let g:SimpylFold_docstring_preview = 1

    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
    let g:UltiSnipsExpandTrigger="<Shift><tab>"
    let g:UltiSnipsJumpForwardTrigger="<c-b>"
    let g:UltiSnipsJumpBackwardTrigger="<c-z>"
    " If you want :UltiSnipsEdit to split your window.
    let g:UltiSnipsEditSplit="vertical"


    "let g:python_host_prog = '/home/mrc/code/snet/migrador/venv/bin/python'
    "let g:python_host_prog = '/bin/python'
    " neomake - python linter
    let g:neomake_python_enabled_makers = ['pylint']
    "let g:neomake_python_pylint_exe = "pylint"

    " when no file specified, open nerdtree
    "autocmd StdinReadPre * let s:std_in=1
    "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

    " git gutter - enable 
    let g:gitgutter_enabled = 1
    let g:gitgutter_signs = 1

    " deoplete - enable
    "let g:deoplete#enable_at_startup = 1


    """ themes 
    Plug 'joshdick/onedark.vim'
    Plug 'sonph/onehalf', {'rtp': 'vim/'}
    Plug 'bluz71/vim-nightfly-guicolors'

    Plug 'Yggdroot/indentLine'

    call plug#end()

    " set theme options
    syntax on
    set termguicolors
    colorscheme onehalfdark

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

    " key binds
    nnoremap <leader>f <esc>:Black<CR>
    nnoremap <leader>e <esc>:FZF<CR>

    " disable autocompletion, cause we use deoplete for completion
    "let g:jedi#completions_enabled = 0
    " open the go-to function in split, not another buffer
    "let g:jedi#use_splits_not_buffers = "right"

    "call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })

    " Full config: when writing or reading a buffer, and on changes in insert and
    " normal mode (after 500ms; no delay when writing).
    call neomake#configure#automake('nrwi', 300)

    " Use <c-space> to trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()

    au VimLeave * set guicursor=a:hor100
endif

