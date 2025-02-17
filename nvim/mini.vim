call plug#begin('~/.local/share/nvim/plugged')

" required by some lua plugins
Plug 'nvim-lua/plenary.nvim'

"Plug 'sheerun/vim-polyglot'							" sytanx highlight
Plug 'neoclide/coc.nvim', {'branch': 'release'}		" intellisense
Plug 'dense-analysis/ale'							" linters
Plug 'SirVer/ultisnips'								" snippets
" navigation
Plug 'scrooloose/nerdtree'							" sidebar explorer
Plug 'ryanoasis/vim-devicons'						" icons for nerdtree
"Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'jremmen/vim-ripgrep'							" ripgrep plugin
Plug 'nvim-telescope/telescope.nvim'
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

lua << EOF
	require('init')
EOF
