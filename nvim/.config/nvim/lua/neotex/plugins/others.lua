return {
    'ThePrimeagen/vim-be-good',
    
    {   -- https://github.com/numToStr/Comment.nvim/tree/master
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    },

    {   -- https://github.com/lukas-reineke/indent-blankline.nvim
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },

    { 
        'echasnovski/mini.nvim', version = false,
        config = function()
            require('mini.animate').setup()
        end 
    },

    -- {
    --     "brianhuster/autosave.nvim",
    --     event="InsertEnter",
    --     opts = {}, -- Configuration here
    --     keys = {

    --         { "<leader>ta", "<cmd>Autosave toggle<cr>", desc = "[T]oggle [A]uto [S]ave" },
    --         -- { "<leader>as", "<cmd>Autosave status<cr>", desc = "[A]uto-save [S]tatus" },
    --     },
    --     config = function()
    --         vim.cmd[[
    --             Autosave off
    --         ]]
    --     end
    -- },
}