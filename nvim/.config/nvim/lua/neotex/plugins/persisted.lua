return {
  "olimorris/persisted.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- Your config goes here ...
    -- autostart = true -- Automatically start the plugin on load?
  },
  keys = {
    
    { "<leader>ts", "<cmd>Telescope persisted<cr>", desc = "[T]oggle [S]ession menu" },
    { "<leader>Sc", "<cmd>SessionLoad<cr>", desc = "Load the [S]ession for the [C]urrent directory" },
    { "<leader>Sl", "<cmd>SessionLoadLast<cr>", desc = "Load the [L]ast recent [S]ession" },
    { "<leader>Ss", "<cmd>SessionSave<cr>", desc = "[S]ession [S]ave current" },
    { "<leader>Sd", "<cmd>SessionDelete<cr>", desc = "[S]ession [D]elete current" },

    -- stop Persistence => session won't be saved on exit
    -- { "<leader>qd", function() require("persistence").stop() end, desc = "stop Persistence" },
  },
  config = function()
  end,
}