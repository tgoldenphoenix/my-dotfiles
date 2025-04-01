return {
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
}