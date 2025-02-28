return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        -- NOTE: all leader driven mappings are in which-key.lua
        config = function()
            -- REQUIRED
            -- harpoon:setup()
            -- dùng `.` hay `:` đều được
            require("harpoon"):setup() -- same as require('harpoon').setup()
            -- require('harpoon'):setup({
            --     global_settings = {
            --         -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
            --         save_on_toggle = false,
            
            --         -- saves the harpoon file upon every change. disabling is unrecommended.
            --         save_on_change = true,
            
            --         -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
            --         -- enter_on_sendcmd = false,
            
            --         -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
            --         -- tmux_autoclose_windows = false,
            
            --         -- filetypes that you want to prevent from adding to the harpoon list menu.
            --         excluded_filetypes = { "harpoon" },
            
            --         -- set marks specific to each git branch inside git repository
            --         -- Each branch will have it's own set of marked files
            --         mark_branch = true,
            
            --         -- enable tabline with harpoon marks
            --         tabline = false,
            --         tabline_prefix = "   ",
            --         tabline_suffix = "   ",
            --     },
            -- })

            -- Harpoon telescope extension
            -- require('telescope').load_extension('harpoon')

            -- KEYMAPS
            local harpoon = require("harpoon")

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = 'add harpoon file' })
            -- vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = 'harpoon menu' })

            vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = 'harpoon file 1' })
            vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = 'harpoon file 2' })
            vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = 'harpoon file 3' })
            vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = 'harpoon file 4' })

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
            vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
        end,
        -- keys property này là của Lazy package manager, nó conflict với vim.keymap.set()
        -- keys = {
        --     { "<leader>A", function() require("harpoon"):list():append() end, desc = "harpoon file", },
        --     { "<leader>a", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu", },
        --     { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
        --     { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
        --     { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
        --     { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
        --     { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
        -- },
    }
}