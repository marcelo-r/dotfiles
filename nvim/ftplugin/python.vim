let b:ale_fixers = ['black']

" insert ipython debugger line
map <localleader>b oimport ipdb; ipdb.set_trace() # BREAKPOINT<CR><C-c>

let g:pydocstring_formatter = 'google'
nmap <leader>pd <Plug>(pydocstring)
