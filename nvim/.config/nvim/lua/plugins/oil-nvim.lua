vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts

    -- Use `opts = {}` to force a plugin to be loaded.
    -- This is equivalent to :
    --      require(MAIN).setup({})
    opts = {},
    -- Optional dependencies
    -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}