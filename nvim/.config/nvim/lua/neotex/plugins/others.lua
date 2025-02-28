return {
    'ThePrimeagen/vim-be-good',

    -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

    -- {
    --     'numToStr/Comment.nvim',
    --     opts = {
    --         -- add any options here
    --     }
    -- },

    -- Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.
    --

    -- Alternatively, use `config = function() ... end` for full control over the configuration.
    -- If you prefer to call `setup` explicitly, use:
    --    {
    --        'lewis6991/gitsigns.nvim',
    --        config = function()
    --            require('gitsigns').setup({
    --                -- Your gitsigns configuration here
    --            })
    --        end,
    --    }
    --

    -- session management
    -- {
    --     "folke/persistence.nvim",
    --     event = "BufReadPre", -- this will only start session saving when an actual file was opened
    --     opts = {
    --       -- add any custom options here
    --     },
    --     config = function()
    --         -- load the session for the current directory
    --         vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end)

    --         -- select a session to load
    --         vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)

    --         -- load the last session
    --         vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end)

    --         -- stop Persistence => session won't be saved on exit
    --         vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end)
    --     end,
    -- },

    -- See `:help gitsigns` to understand what the configuration keys do
    -- { -- Adds git related signs to the gutter, as well as utilities for managing changes
    --     'lewis6991/gitsigns.nvim',
    --     opts = {
    --         signs = {
    --         add = { text = '+' },
    --         change = { text = '~' },
    --         delete = { text = '_' },
    --         topdelete = { text = '‾' },
    --         changedelete = { text = '~' },
    --         },
    --     },
    -- },

    -- {
    --   -- install with yarn or npm
    --   "iamcco/markdown-preview.nvim",
    --   -- cmd key for Lazy-load on command
    --   cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    --   build = "cd app && npm install",
    --   init = function()
    --     vim.g.mkdp_filetypes = { "markdown" }
    --   end,
    --   ft = { "markdown" },
    -- },
}