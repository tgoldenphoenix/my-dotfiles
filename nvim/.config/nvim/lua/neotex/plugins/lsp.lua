return {
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs and related tools to stdpath for Neovim
        -- Mason must be loaded before its dependents so we need to set it up here.
        -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
        { 'williamboman/mason.nvim', opts = {} },
        'williamboman/mason-lspconfig.nvim',
        
        -- Allows extra capabilities provided by nvim-cmp
        'hrsh7th/cmp-nvim-lsp',
    },
    config = function()
        --  This function gets run when an LSP attaches to a particular buffer.
        --    That is to say, every time a new file is opened that is associated with
        --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
        --    function will be executed to configure the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
            callback = function(event)
                -- helper function
                local map = function(keys, func, desc, mode)
                    mode = mode or 'n'
                    vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
                end

                -- ===== start Set lsp keymaps

                -- Jump to the definition of the word under your cursor.
                --  This is where a variable was first declared, or where a function is defined, etc.
                --  To jump back, press <C-t>.
                map('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')

                -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover lsp' })

                -- vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code Action lsp' })

            end,
        })

        require("mason-lspconfig").setup({
            -- Type `:Mason' to open it
            ensure_installed = { 
                "lua_ls", 
                "pyright",  -- python
            }
        })

        local lspconfig = require('lspconfig')
        lspconfig.lua_ls.setup({})

    end,
}