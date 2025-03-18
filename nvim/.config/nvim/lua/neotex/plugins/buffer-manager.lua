return {
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
        vim.keymap.set('n', '<leader>bt', builtin.toggle_quick_menu, { desc = 'toggle buffer menu' })
    end
}