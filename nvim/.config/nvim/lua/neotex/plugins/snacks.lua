return {
  "folke/snacks.nvim",
  priority = 1000,  -- make sure to load this before all the other start plugins
  lazy = false,
  -- below is lua "type annotation" for the LSP
  -- src: https://github.com/LuaLS/lua-language-server/wiki/Annotations?utm_source=chatgpt.com
  -- ---@type snacks.Config
  opts = {   
    dashboard = {
      enabled = true,
      
      preset = require("neotex.plugins.snacks.dashboard").preset,
      -- sections = require("neotex.plugins.snacks.dashboard").sections,

      -- github dashboard style
      -- sections = require("neotex.plugins.snacks.gh_dashboard").sections,
    },
  },

  keys = {},
  init = function ()
  end,
}
