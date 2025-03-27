return {
  {
    "nvimtools/none-ls.nvim",
    dependencies = {'nvimtools/none-ls-extras.nvim'},
    config = function()
      local null_ls = require 'null-ls'
      local formatting = null_ls.builtins.formatting   -- to setup formatters
      local diagnostics = null_ls.builtins.diagnostics -- to setup linters

      local sources = {
        formatting.prettier.with { filetypes = { 'html', 'json', 'yaml', 'markdown' } },
        formatting.shfmt.with { args = { '-i', '4' } },
        require('none-ls.formatting.ruff').with { extra_args = { '--extend-select', 'I' } },
        require 'none-ls.formatting.ruff_format',
      }
  
      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      null_ls.setup {
        -- debug = true, -- Enable debug mode. Inspect logs with :NullLsLog.
        sources = sources,
        -- you can reuse a shared lspconfig on_attach callback here
        on_attach = function(client, bufnr)
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format { async = false }
              end,
            })
          end
        end,
      }
    end,

  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        'prettier', -- ts/js formatter
        'shfmt',
        'ruff',
        'python-lsp-server',
        'debugpy',
        -- 'name-not-in-registry'
      },
    },

  },
}