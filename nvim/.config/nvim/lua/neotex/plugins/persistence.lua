return {
  -- deprecated
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
    keys = {
      -- { "<leader>qs", function() require("persistence").load() end, desc = "load the session for the current directory" },
      -- { "<leader>qS", function() require("persistence").select() end, desc = "select a session to load" },
      -- { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "load the last session" },

      -- stop Persistence => session won't be saved on exit
      -- { "<leader>qd", function() require("persistence").stop() end, desc = "stop Persistence" },
    }
  },

  -- Use this one
  {
    "olimorris/persisted.nvim",
    event = "BufReadPre", -- Ensure the plugin loads only when a buffer has been loaded
    opts = {
      -- Your config goes here ...
    },
    keys = {
      { "<leader>qs", "<cmd>SessionSave<cr>", desc = "Save the current session" },
      { "<leader>qS", "<cmd>Telescope persisted<cr>", desc = "select a session to load" },
      -- { "<leader>ql", function() require("persistence").load({ last = true }) end, desc = "load the last session" },

      -- stop Persistence => session won't be saved on exit
      -- { "<leader>qd", function() require("persistence").stop() end, desc = "stop Persistence" },
    },
    config = function()
      
    end

  },
}