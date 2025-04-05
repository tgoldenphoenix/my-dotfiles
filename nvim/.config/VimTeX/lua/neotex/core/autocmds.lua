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

-- Neovim can pick folding method automatically
-- https://stackoverflow.com/questions/78077278/treesitter-and-syntax-folding
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "lua",
--   callback = function()

--     -- check if treesitter has parser 
--     -- if require("nvim-treesitter.parsers").has_parser() then
        
--     --     -- use treesitter folding
--     --     vim.opt.foldmethod = "expr"
--     --     vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--     -- else

--     --     -- use alternative foldmethod
--     --     vim.opt.foldmethod = "syntax"
--     -- end

--   vim.opt.foldlevelstart = 99 -- start unfolded
--   vim.opt.foldmethod = 'expr'
--   vim.opt.foldminlines = 0 -- Allow closing even 1-line folds.
--   vim.opt.foldexpr = 'v:lua.neotex.foldexpr(v:lnum)'
--   vim.opt.foldtext = 'v:lua.neotex.foldtext()'
-- end,
-- })