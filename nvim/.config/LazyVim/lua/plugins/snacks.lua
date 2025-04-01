return {
  "folke/snacks.nvim",
  opts = function(_, opts)
    -- why not override as i expected
    -- working ok now???
    opts.dashboard = {
      preset = {
        keys = {
          { icon = "", key = "s", desc = "Restore Session cwd", action = function() require("persistence").load() end },
          { icon = " ", key = "e", desc = "Explorer", action = ":Neotree toggle" },
          { icon = " ", key = "f", desc = "Find File cwd", action = ":lua require('telescope.builtin').find_files()" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text cwd", action = ":lua require('telescope.builtin').live_grep()" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua require('telescope.builtin').oldfiles()" },
          -- { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          -- { icon = " ", key = "i", desc = "Info", action = ":e ~/.config/CheatSheet.md" },
          { icon = " ", key = "l", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "h", desc = "Checkhealth", action = ":checkhealth" },
          -- { icon = " ", key = "q", desc = "Quit", action = ":qa!" },
        }
      }
    } -- dashboard
    
  end
}