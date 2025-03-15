-- vim.notify("muon bu num vu kim phuong trong ftplugin")

vim.cmd[[
  " This is for testing
  " nmap <localleader>c <Cmd>echo "test from ftplugin/tex/main.lua"<CR>

  " Use `<localleader>c` to trigger continuous compilation...
  " nmap <localleader>c <Plug>(vimtex-compile)

  " Define a custom shortcut to trigger VimtexView
  " nmap <localleader>v <plug>(vimtex-view)
]]

-- vim.keymap.set('n', '<localleader>c', '<Cmd>VimTexCompile<CR>', { desc = 'trigger continuous compilation...' })
