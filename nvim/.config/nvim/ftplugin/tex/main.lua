vim.cmd[[
" This is for testing
" nmap <localleader>c <Cmd>echo "anhao muon chich kim phuong"<CR>

" Use `<localleader>c` to trigger continuous compilation...
nmap <localleader>c <Plug>(vimtex-compile)

" Define a custom shortcut to trigger VimtexView
nmap <localleader>v <plug>(vimtex-view)
]]