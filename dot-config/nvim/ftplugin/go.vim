let g:go_code_completion_enabled = 0

let g:go_def_mapping_enabled = 0

let g:go_info_mode='gopls'
let g:go_def_mode='gopls'
let g:go_doc_popup_window = 1
let g:go_metalinter_command = 'golangci-lint'
let g:go_metalinter_deadline = "5s"

let g:go_test_show_name = 1
let g:go_jump_to_error = 0
let g:go_fmt_autosave = 1
let g:go_list_height = 5 
"let g:go_list_type = "locationlist"
let g:go_def_reuse_buffer = 1

" syntax highlight
"let g:go_highlight_structs = 1 
"let g:go_highlight_methods = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_types = 1

let g:go_metalinter_autosave = 0
let g:go_metalinter_autosave_enabled = ['vet', 'revive', 'errcheck', 'deadcode', 'gosimple', 'unused', 'ineffassign', 'lll', 'staticcheck', 'prealloc', 'gomnd', 'goconst', 'gosec', 'funlen']

" disabled because of go 1.18
"'bodyclose', 
"'noctx', 
"'rowserrcheck', 
" 'structcheck',
"'unparam', 
let g:go_metalinter_enabled = [ 'deadcode', 'depguard', 'dogsled', 'dupl',
    		\ 'errcheck', 'exhaustive', 'gochecknoinits', 'goconst', 'gocritic',
    		\ 'gocyclo', 'gofmt', 'goimports', 'revive', 'gomnd',
    		\ 'goprintffuncname', 'gosec', 'gosimple', 'govet', 'ineffassign',
    		\ 'lll', 'misspell', 'nakedret', 'nolintlint',
    		\ 'exportloopref', 'staticcheck', 'stylecheck',
    		\ 'typecheck', 'unconvert', 'unused', 'varcheck',
    		\ 'asciicheck', 'gocognit', 'godox', 'goerr113', 'nestif',
    		\ 'prealloc', 'whitespace']

nmap <localleader>r <Plug>(go-run)
nmap <localleader>b <Plug>(go-build)
nmap <localleader>tt <Plug>(go-test)
nmap <localleader>tf <Plug>(go-test-func)
nnoremap <localleader>pl <esc>:GoMetaLinterAutoSaveToggle<CR>
nnoremap <localleader>ll <esc>:GoMetaLinter<CR>

nmap <localleader>* <esc>:GoSameIdsToggle<CR>

nnoremap <F9> <esc>:GoDebugBreakpoint<CR>
nnoremap <F5> <esc>:GoDebugContinue<CR>
nnoremap <C><S><F5> <esc>:GoDebugRestart<CR>
nnoremap <F8> <esc>:GoDebugHalt<CR>
nnoremap <F10> <esc>:GoDebugNext<CR>
" step in
nnoremap <F11> <esc>:GoDebugStep<CR>

