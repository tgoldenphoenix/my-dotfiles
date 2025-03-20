return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "lua", "vim", "vimdoc", "javascript", "html" },
          ignore_install = { "latex" },

          -- Install parsers synchronously (only applied to `ensure_installed`)
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },

          -- Automatically install missing parsers when entering buffer
          -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
          auto_install = false,
        })
    end
}