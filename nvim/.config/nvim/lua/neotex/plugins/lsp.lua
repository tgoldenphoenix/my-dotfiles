return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        -- Mason must be loaded before its dependents so we need to set it up here.
        -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
        { 'williamboman/mason.nvim', opts = {} },
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls" }
        })

        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup({})

        -- Jump to the definition of the word under your cursor.
        --  This is where a variable was first declared, or where a function is defined, etc.
        --  To jump back, press <C-t>.
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = '[G]oto [D]efinition' })
        
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover lsp' })
    end,
}