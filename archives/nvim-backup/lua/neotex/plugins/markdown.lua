return {
    -- check out these plugings
    -- https://github.com/roodolv/markdown-toggle.nvim

    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
        -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
        keys = {
            -- { "<leader>b", "<cmd>lua Snacks.bufdelete()<CR>", desc = "[D]elete current buffer" },
          },
    },

    {
        'antonk52/markdowny.nvim',
        config = function()
            require('markdowny').setup()
        end
    },

    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        keys = { -- Example mapping to toggle outline
          { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {
          -- Your setup opts here
        },
    },

    {
        'bullets-vim/bullets.vim',
        config = function()
            -- Disable deleting the last empty bullet when pressing <cr> or 'o'
            -- default = 1
            -- vim.g.bullets_delete_last_bullet_if_empty = 1
        
            -- (Optional) Add other configurations here
            -- For example, enabling/disabling mappings
            -- vim.g.bullets_set_mappings = 1
          end,
    },
}