return {
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },

        config = function()
            -- REQUIRED
            -- harpoon:setup()
            -- dùng `.` hay `:` đều được
            require("harpoon"):setup() -- same as require('harpoon').setup()

            -- require file from different directory
            -- Use ~/lua/ as the root of require
            -- local harpoon = require("neotex.plugins.harpoon")

            -- if require a file in the same directory
            -- file name in ~/lua/neotex/plugins/ must be exactly harpoon.lua
            local harpoon = require("harpoon")

            vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = '[A]dd harpoon file' })
            -- vim.keymap.set("n", "<leader>th", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[T]oggle [H]arpoon menu' })
            vim.keymap.set("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = '[H]arpoon menu' })

            vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = 'harpoon to file 1' })
            vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = 'harpoon to file 2' })
            vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = 'harpoon to file 3' })
            vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = 'harpoon to file 4' })

            -- Toggle previous & next buffers stored within Harpoon list
            vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end, { desc = 'harpoon previous file' })
            vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end, { desc = 'harpoon next file' })
        end,

    }
}
