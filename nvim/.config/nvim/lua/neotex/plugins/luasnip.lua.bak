return {
    "L3MON4D3/LuaSnip",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      -- Somewhere in your Neovim startup, e.g. init.lua
			require("luasnip").config.set_config({ -- Setting LuaSnip config
        -- Enable autotriggered snippets
        enable_autosnippets = true,

        -- Use Tab (or some other key if you prefer) to trigger visual selection
        store_selection_keys = "<Tab>",

        -- For repeated nodes to update as you type
        update_events = 'TextChanged,TextChangedI'
      })

      -- Lazy-load snippets, i.e. only load when required, e.g. for a given filetype
			require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})

      require("luasnip.loaders.from_snipmate").load({ paths = "~/.config/nvim/snippets/" })
    end
  }