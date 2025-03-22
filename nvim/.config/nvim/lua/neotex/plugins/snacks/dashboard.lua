local M = {}

M.preset = {
  -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
  ---@type fun(cmd:string, opts:table)|nil
  pick = nil,

  -- Used by the `keys` section to show keymaps.
  -- Set your custom keymaps here.
  -- When using a function, the `items` argument are the default keymaps.
  ---@type snacks.dashboard.Item[]
  keys = {
    -- { icon = " ", key = "s", desc = "Restore Session", action = ":SessionManager load_session" },
    -- { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
    { icon = "", key = "s", desc = "Restore Session cwd", action = ":SessionLoad" },
    { icon = " ", key = "e", desc = "Explorer", action = ":Neotree toggle" },
    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
    -- { icon = "󰱼 ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
    { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
    { icon = " ", key = "i", desc = "Info", action = ":e ~/.config/CheatSheet.md" },
    { icon = " ", key = "m", desc = "Manage Plugins", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
    { icon = " ", key = "h", desc = "Checkhealth", action = ":checkhealth" },
    { icon = " ", key = "q", desc = "Quit", action = ":qa!" },
    
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
