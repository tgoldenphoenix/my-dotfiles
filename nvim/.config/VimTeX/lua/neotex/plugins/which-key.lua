return {
    "folke/which-key.nvim",

    -- you can use the VeryLazy event for things that can
    -- load later and are not important for the initial UI
    -- event = "VeryLazy",
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below

      ---@type false | "classic" | "modern" | "helix"
      preset = "classic",

      -- delay between pressing a key and opening which-key (milliseconds)
      -- this setting is independent of vim.opt.timeoutlen
      delay = 0,

      icons = {
        -- set icon mappings to true if you have a Nerd Font
        mappings = vim.g.have_nerd_font,
        -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
        -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
        keys = vim.g.have_nerd_font and {} or {
          Up = '<Up> ',
          Down = '<Down> ',
          Left = '<Left> ',
          Right = '<Right> ',
          C = '<C-…> ',
          M = '<M-…> ',
          D = '<D-…> ',
          S = '<S-…> ',
          CR = '<CR> ',
          Esc = '<Esc> ',
          ScrollWheelDown = '<ScrollWheelDown> ',
          ScrollWheelUp = '<ScrollWheelUp> ',
          NL = '<NL> ',
          BS = '<BS> ',
          Space = '<Space> ',
          Tab = '<Tab> ',
          F1 = '<F1>',
          F2 = '<F2>',
          F3 = '<F3>',
          F4 = '<F4>',
          F5 = '<F5>',
          F6 = '<F6>',
          F7 = '<F7>',
          F8 = '<F8>',
          F9 = '<F9>',
          F10 = '<F10>',
          F11 = '<F11>',
          F12 = '<F12>',
        },
      },

      -- Document existing key chains
      spec = {
        -- { '<leader>c', group = '[C]ode', mode = { 'n', 'x' } },
        -- { '<leader>d', group = '[D]ocument' },
        -- { '<leader>r', group = '[R]ename' },
        -- { '<leader>s', group = '[S]earch' },
        -- { '<leader>w', group = '[W]orkspace' },
        -- { '<leader>t', group = '[T]oggle' },
        -- { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
      },

    },

    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },

    config = function()
      local wk = require("which-key")
      wk.add({
        -- ===== groups ===== 
        { "<leader>t", group = "[T]oggle" }, 
        { "<leader>s", group = "[S]earch Telescope" },
        -- { "<leader>b", group = "[B]uffer" },
        { "<leader>q", group = "Session" },
        { "<leader>v", group = "[V]imtex" },

        -- ===== Start Vimtex keymaps =====
        -- NOTE: In which-key, I only add description
        -- The actualy mappings are inside ftplugin/vimtex.vim

        { "<leader>i", desc = "Vimtex [I]nfo" },  -- default mode "n"
        { "<leader>tv", desc = "[V]imtex [T]oc Toggle" },
        { "<leader>vc", desc = "[V]imtex [C]ompile" },
        { "<leader>vv", desc = "[V]imtex [V]iew" },
        { "<leader>wc", desc = "Vimtex [W]ord [C]ount" },
        -- ===== End Vimtex keymaps =====

        -- Write, used with Vimtex continuous compilation feature
        -- { "<leader>w", "<cmd>wa!<CR>", desc = "write" },
        { "<leader>w", "<cmd>wa<CR>", desc = "write" },

        -- write & quit
        { "<leader>Q", "<cmd>wa! | qa!<CR>", desc = "write & quit" },
        
        -- { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
        -- { "<leader>fb", function() print("hello") end, desc = "Foobar" },
        -- { "<leader>fn", desc = "New File" },
        -- { "<leader>f1", hidden = true }, -- hide this keymap
        -- { "<leader>w", proxy = "<c-w>", group = "windows" }, -- proxy to window mappings
        -- { "<leader>b", group = "buffers", expand = function()
        --     return require("which-key.extras").expand.buf()
        --   end
        -- },

        -- {
        --   -- Nested mappings are allowed and can be added in any order
        --   -- Most attributes can be inherited or overridden on any level
        --   -- There's no limit to the depth of nesting
        --   mode = { "n", "v" }, -- NORMAL and VISUAL mode
        --   { "<leader>q", "<cmd>q<cr>", desc = "Quit" }, -- no need to specify mode since it's inherited
        --   { "<leader>w", "<cmd>w<cr>", desc = "Write" },
        -- }

      })
    end,
}
