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
      sections = require("neotex.plugins.snacks.gh_dashboard"),
    },

    -- Better vim.ui.input
    -- works with nvimtree, lsp
    -- https://github.com/folke/snacks.nvim/blob/main/docs/input.md
    input = { 
      enabled = true,

      icon = " ",
      icon_hl = "SnacksInputIcon",
      icon_pos = "left",
      prompt_pos = "title",
      win = { style = "input" },
      expand = true,
    },
  },

  keys = {
    -- Delete current buffer
    -- src: https://github.com/folke/snacks.nvim/blob/main/docs/bufdelete.md
    { "<leader>bd", "<cmd>lua Snacks.bufdelete()<CR>", desc = "[D]elete current buffer" },
  },

  init = function ()
  end,
}

-- dressing.nvim
-- https://github.com/stevearc/dressing.nvim
-- :lua vim.ui.input({prompt = "Enter input: "}, function(input) print(input) end)

-- Already have ui.select