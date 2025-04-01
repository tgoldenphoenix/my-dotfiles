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
        "karb94/neoscroll.nvim",
        opts = {},
    },

    {
      'arnamak/stay-centered.nvim',
      lazy = false,
        opts = {
            -- The filetype is determined by the vim filetype, not the file extension. In order to get the filetype, open a file and run the command:
            -- :lua print(vim.bo.filetype)
            skip_filetypes = { 'lua', 'typescript' },
        },
        keys = {
            {"<leader>tc", function() require('stay-centered').toggle() end, desc = "Toggle stay-[C]entered.nvim"},
            -- {"gb", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
        }
    }

    -- { 
    --     'echasnovski/mini.nvim', version = false,
    --     config = function()
    --         require('mini.animate').setup()
    --     end 
    -- },

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