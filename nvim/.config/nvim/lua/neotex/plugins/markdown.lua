return {
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