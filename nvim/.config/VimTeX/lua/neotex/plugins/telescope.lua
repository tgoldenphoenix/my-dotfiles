return { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 
            -- Make telescope search faster.
            -- If encountering errors, see telescope-fzf-native README for installation instructions
            'nvim-telescope/telescope-fzf-native.nvim',

            -- `build` is used to run some command when the plugin is installed/updated.
            -- This is only run then, not every time Neovim starts up.
            build = 'make',

            -- `cond` is a condition used to determine whether this plugin should be
            -- installed and loaded.
            cond = function()
            return vim.fn.executable 'make' == 1
            end,
        },
        -- used to select lsp action for example
        -- try this command
        -- :lua vim.ui.select({"one", "two"}, {}, function(selection) print(selection) end)
        -- https://github.com/nvim-telescope/telescope-ui-select.nvim
        { 'nvim-telescope/telescope-ui-select.nvim' },

        -- Useful for getting pretty icons, but requires a Nerd Font.
        { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },

    config = function()
        -- print("Telescope config")
        
        -- Two important keymaps to use while in Telescope are:
        --  - Insert mode: <c-/>
        --  - Normal mode: ?
        --
        -- This opens a window that shows you all of the keymaps for the current
        -- Telescope picker. This is really useful to discover what Telescope can
        -- do as well as how to actually do it!

        -- [[ Configure Telescope ]]
        -- See `:help telescope` and `:help telescope.setup()`
        local actions = require('telescope.actions')

        require('telescope').setup {
            -- You can put your default mappings / updates / etc. in here
            --  All the info you're looking for is in `:help telescope.setup()`
            --
            defaults = {
              -- keymaps inside the picker window
              mappings = {
                i = { 
                    -- ['<c-enter>'] = 'to_fuzzy_refine',

                    -- default mappings: https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#default-mappings 
                    ['<c-j>'] = actions.move_selection_next,
                    ['<c-k>'] = actions.move_selection_previous,
                },
              },
            },
            pickers = {
                find_files = {
                  theme = "ivy"
                }
            },      
            extensions = {
                ['ui-select'] = {
                    require('telescope.themes').get_dropdown(),
                },
            },
        }

        -- Enable Telescope extensions if they are installed
        pcall(require('telescope').load_extension, 'fzf')
        pcall(require('telescope').load_extension, 'ui-select')

        -- See `:help telescope.builtin`
        local builtin = require 'telescope.builtin'

        -- If dont see telescope preview window, try <C -> to zoom out a bit

        vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
        -- vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })

        -- or "fd" find directory
        -- Try typing `:Telescope find_files`
        -- vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles cwd' })
        vim.keymap.set('n', '<leader><space>', builtin.find_files, { desc = '[S]earch [F]iles cwd' })
        
        -- search funtions builtin of telescope
        vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = '[S]earch [S]elect Telescope' })

        -- test this!
        -- BurntSushi/ripgrep is required for live_grep and grep_string. Run `rg --version`
        -- look for the string under the cursor inside the cwd
        vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
        -- find string in cwd
        vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep (Root Dir)' })

        -- vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
        -- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
        vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })

        -- Just like toggle buffer list
        -- think about this
        -- the other you can delete buffer, i think is better than this telescope builtin
        vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = '[ ] Find existing buffers' })

        -- Slightly advanced example of overriding default behavior and theme
        vim.keymap.set('n', '<leader>/', function()
            -- You can pass additional configuration to Telescope to change the theme, layout, etc.
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
            winblend = 10,
            previewer = false,
            })
        end, { desc = '[/] Fuzzily search in current buffer' })

        -- It's also possible to pass additional configuration options.
        --  See `:help telescope.builtin.live_grep()` for information about particular keys
        -- vim.keymap.set('n', '<leader>s/', function()
        --     builtin.live_grep {
        --         grep_open_files = true,
        --         prompt_title = 'Live Grep in Open Files',
        --     }
        -- end, { desc = '[S]earch [/] in Open Files' })

        -- Shortcut for searching your Neovim configuration files
        -- "ed" edit neovim
        vim.keymap.set('n', '<leader>sn', function()
            -- try :echo stdpath("config")
            builtin.find_files { cwd = vim.fn.stdpath 'config' }
        end, { desc = '[S]earch [N]eovim files' })

        -- ==== start persisted.nvim ====
        require("telescope").load_extension("persisted")
        -- ==== end persisted.nvim ====
    end,
}