-- LazyVim also use neo-tree
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  lazy = false, -- neo-tree will lazily load itself
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        hide_by_name = {
          ".git",
          ".DS_Store",
        },
        hide_by_pattern = {},

        always_show = {
          ".env"
        },
        always_show_by_pattern = { -- remains visible even if other settings would normally hide it
          -- "*.txt",
        },
      }, -- filtered_items
    },  -- filesystem

    window = {
      -- position = "right",
      mappings = {
        ["l"] = "open", -- open node
        ["h"] = "close_node",
        ["<space>"] = "none",
        ["Y"] = {
          function(state)
            local node = state.tree:get_node()
            local path = node:get_id()
            vim.fn.setreg("+", path, "c")
          end,
          desc = "Copy Path to Clipboard",
        },
        ["O"] = {
          function(state)
            require("lazy.util").open(state.tree:get_node().path, { system = true })
          end,
          desc = "Open with System Application",
        },
        ["P"] = { "toggle_preview", config = { use_float = false } },
        -- problem with neoscroll, have to wait ~ 1 second
        ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
      },
    },

  },

  keys = {
    {"<leader>e", "<cmd>Neotree toggle<CR>", desc = "Toggle Neotre[e]"},
  },

  -- config = function()
  -- end,
}
