return {
  "folke/persistence.nvim",
  keys = {
    -- disable LazyVim keymap
    { "<leader>qs", false },
    -- add my own keymap
    { "<leader>qc", function() require("persistence").load() end, desc = "Restore Session cwd" },
  }
}