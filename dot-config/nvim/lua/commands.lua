-- mkdir from vim
vim.cmd('command! -nargs=1 -complete=dir Mkdir call mkdir(<q-args>, "p", 0777)')

