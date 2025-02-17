let b:ale_fixers = ['black']

" insert ipython debugger line
map <localleader>b oimport ipdb; ipdb.set_trace() # BREAKPOINT<CR><C-c>

let g:pydocstring_formatter = 'google'
nmap <leader>pd <Plug>(pydocstring)

" Code action on <leader>a
vmap <leader>a <Plug>(coc-codeaction-selected)<CR>
nmap <leader>a <Plug>(coc-codeaction-selected)<CR>

" Format action on <leader>f
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Goto definition
nmap <silent> gd <Plug>(coc-definition)
" Open definition in a split window
nmap <silent> gv :vsp<CR><Plug>(coc-definition)<C-W>L
