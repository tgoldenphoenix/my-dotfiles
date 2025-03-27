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
    ---@module "neo-tree"
    ---@type neotree.Config?
    -- opts = {},
    config = function()
        -- keymaps
        vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<CR>", {desc = "Toggle Neotre[e]"})
        vim.keymap.set("v", "<leader>e", "<cmd>Neotree toggle<CR>", {desc = "Toggle Neotre[e]"})
        
        require("neo-tree").setup({
          filesystem = {
            filtered_items = {
              hide_by_name = {},
              hide_by_pattern = {},

              always_show = {},
              always_show_by_pattern = { -- remains visible even if other settings would normally hide it
                -- "*.txt",
              },
            }
          },
        })
    end,
}
