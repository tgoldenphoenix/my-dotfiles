return {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    -- Mason must be loaded before its dependents so we need to set it up here.
    -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
    'williamboman/mason.nvim',
    -- opts = {

    -- },
    dependencies = {
        -- the bridge between mason & nvim-lsp-config
        'williamboman/mason-lspconfig.nvim',
    },
    config = function()
        -- import mason
        local mason = require("mason")

        -- enable mason and configure icons
        mason.setup({
            ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗",
            },
            },
        })

        -- import mason-lspconfig
        -- local mason_lspconfig = require("mason-lspconfig")
        -- this must be called after mason.setup()
        require("mason-lspconfig").setup({
            -- Type `:Mason' to open it
            -- list of server for Mason to install
            ensure_installed = { 
                "lua_ls", 
                "pyright",  -- python
                -- "tsserver",
                "html",
                "cssls",
                "tailwindcss",
            }
        })

    end
}