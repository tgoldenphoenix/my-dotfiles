return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    -- add any custom options here
  },
  keys = {
    { "<leader>qs", function() require("persistence").load() end, desc = "load the session for the current directory" },
    { "<leader>qS", function() require("persistence").select() end, desc = "select a session to load" },
    { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "load the last session" },

    -- stop Persistence => session won't be saved on exit
    { "<leader>qd", function() require("persistence").stop() end, desc = "stop Persistence" },
  }
}