let g:go_code_completion_enabled = 0
let g:go_info_mode='gopls'
let g:go_def_mode='gopls'
let g:go_doc_popup_window = 1
let g:go_metalinter_command = 'golangci-lint'
let g:go_metalinter_autosave = 1
let g:go_metalinter_enabled = ['vet', 'revive', 'errcheck', 'deadcode', 'gosimple', 'unused', 'ineffassign', 'lll', 'staticcheck', 'prealloc', 'gomnd', 'goconst', 'gosec', 'cyclop']
let g:go_metalinter_autosave_enabled = ['vet', 'revive', 'errcheck', 'deadcode', 'gosimple', 'unused', 'ineffassign', 'lll', 'staticcheck', 'prealloc', 'gomnd', 'goconst', 'gosec']
let g:go_test_show_name = 1
let g:go_jump_to_error = 0
let g:go_fmt_autosave = 1

" syntax highlight
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1

nmap <leader>rr <Plug>(go-run)
nmap <leader>b <Plug>(go-build)
nmap <leader>tt <Plug>(go-test)
nmap <leader>tf <Plug>(go-test-func)

nnoremap <silent><F9> :GoDebugBreakpoint<CR>

