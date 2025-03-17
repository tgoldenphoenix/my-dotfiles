local api = vim.api

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })
  
-- Set special buffers as fixed and map 'q' to close
-- api.nvim_create_autocmd(
--   "FileType",
--   {
--     pattern = { "man", "help", "qf", "lspinfo", "infoview", "NvimTree" }, -- "startuptime",
--     callback = function(ev)
--       -- Set the window as fixed
--       vim.wo.winfixbuf = true
--       -- Map q to close
--       vim.keymap.set("n", "q", ":close<CR>", { buffer = ev.buf, silent = true })
--     end,
--   }
-- )

-- Handle Avante help markdown file specifically
-- api.nvim_create_autocmd(
--   "BufEnter",
--   {
--     pattern = "*/avante.nvim.md",
--     callback = function(ev)
--       vim.bo[ev.buf].filetype = "help"  -- Set filetype to help
--       vim.wo.winfixbuf = true  -- Set as fixed buffer
--       vim.keymap.set("n", "q", ":close<CR>", { buffer = ev.buf, silent = true })
--     end,
--   }
-- )

-- vim.api.nvim_create_autocmd({ "TermOpen" }, {
--   pattern = { "term://*" }, -- use term://*toggleterm#* for only ToggleTerm
--   command = "lua set_terminal_keymaps()",
-- })

-- vim.api.nvim_create_autocmd({ "BufEnter", "BufReadPre", "BufNewFile" }, {
--   pattern = { "*.md" },
--   command = "lua set_markdown_keymaps()",
-- })
