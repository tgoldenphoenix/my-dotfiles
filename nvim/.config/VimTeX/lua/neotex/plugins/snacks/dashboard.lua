local M = {}

M.preset = {
  -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
  pick = nil,
  -- pick = function(cmd, opts)
  --   return LazyVim.pick(cmd, opts)()
  -- end,

  -- Used by the `keys` section to show keymaps.
  -- Set your custom keymaps here.
  -- When using a function, the `items` argument are the default keymaps.
  keys = {
    -- "olimorris/persisted.nvim",
    { icon = "", key = "s", desc = "Restore Session cwd", action = ":SessionLoad" },
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
  },

  header = [[
                                                                         
                                                                       
         ████ ██████           █████      ██                     
        ███████████             █████                             
        █████████ ███████████████████ ███   ███████████   
       █████████  ███    █████████████ █████ ██████████████   
      █████████ ██████████ █████████ █████ █████ ████ █████   
    ███████████ ███    ███ █████████ █████ █████ ████ █████  
   ██████  █████████████████████ ████ █████ █████ ████ ██████ 
                                                                         ]],
}

M.sections = {
  { section = 'header' },
  { section = "keys", gap = 0, padding = 1 },
  { section = 'startup' },
}

return M
