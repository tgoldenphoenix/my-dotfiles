return  {
    -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
    --
    -- This is often very useful to both group configuration, as well as handle
    -- lazy loading plugins that don't need to be loaded immediately at startup.
    --
    -- For example, in the following configuration, we use:
    --  event = 'VimEnter'
    --
    -- which loads which-key before all the UI elements are loaded. Events can be
    -- normal autocommands events (`:help autocmd-events`).
    --
    -- Then, because we use the `opts` key (recommended), the configuration runs
    -- after the plugin has been loaded as `require(MODULE).setup(opts)`.

    { -- Useful plugin to show you pending keybinds.
        'folke/which-key.nvim',
        event = 'VeryLazy',
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            plugins = {
                registers = false, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
            },
            spec = {
                { "<leader>fb", function() print("hello") end, desc = "Foobar" },
            },
            icons = {
                keys = {
                    Tab = "fuck",
                },
            },
        },
        
        config = function()
            local wk = require("which-key")
            wk.add({})
        end,
    },
}