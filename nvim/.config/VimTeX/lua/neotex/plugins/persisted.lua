return {
  "olimorris/persisted.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- Your config goes here ...
    -- autostart = true -- Automatically start the plugin on load?

    -- sessions are stored inside ~/.local/share/nvim/sessions
    -- Do not auto save, must save manually for each directory (only one time though)
  },
  keys = {
    { "<leader>qt", "<cmd>Telescope persisted<cr>", desc = "[T]oggle [S]ession menu" },
    { "<leader>qc", "<cmd>SessionLoad<cr>", desc = "Load the [S]ession for the [C]urrent directory" },
    { "<leader>ql", "<cmd>SessionLoadLast<cr>", desc = "Load the [L]ast recent [S]ession" },

    -- each time you change folding option, remember to save again
    -- if you do not change any setting, you only need to save session once for
    -- each directory
    { "<leader>qs", "<cmd>SessionSave<cr>", desc = "Save session cwd" },
    { "<leader>qd", "<cmd>SessionDelete<cr>", desc = "[S]ession [D]elete current" },

    -- stop Persistence => session won't be saved on exit
    -- { "<leader>qd", function() require("persistence").stop() end, desc = "stop Persistence" },
  },
  config = function() end,
}

