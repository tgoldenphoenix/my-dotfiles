return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    -- you can use the VeryLazy event for things that can
    -- load later and are not important for the initial UI
    event = "VeryLazy",
    keys = {
      -- { "<leader>e", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
      -- { "<leader><Tab>", ":Neotree toggle left<CR>", silent = true, desc = "Left File Explorer" },
      { "<leader><Tab>", ":Neotree toggle float<CR>", silent = true, desc = "Float File Explorer" },
    },
    config = function()
      require("neo-tree").setup({
        
      })
    end,
}