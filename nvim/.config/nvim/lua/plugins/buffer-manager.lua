return {
    {
        'j-morano/buffer_manager.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim'  -- basic dependency
        },
        config = function()
            -- open the buffer list with `:ls`
            -- read more: https://neovim.io/doc/user/windows.html#_11.-using-hidden-buffers
            
            -- `:pwd` inside neovim

            local builtin = require 'buffer_manager.ui'

            -- put toggle_quick_menu() with parentheses will yiel error
            -- You must pass a function as argument to the RHS
            vim.keymap.set('n', '<leader>tb', builtin.toggle_quick_menu, { desc = '[T]oggle [B]uffer menu' })
            
            -- go to next & previous buffer
            -- src: https://github.com/j-morano/buffer_manager.nvim?tab=readme-ov-file#go-to-next-or-previous-buffer-in-the-list
        end
    },

    {
        "leath-dub/snipe.nvim",
        keys = {
            {"gb", function () require("snipe").open_buffer_menu() end, desc = "Open Snipe buffer menu"}
        },
        opts = {}
    }

}