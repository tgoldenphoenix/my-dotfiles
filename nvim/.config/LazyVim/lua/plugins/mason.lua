return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      -- prettier if enable now will mess up the eslint format from VSCode which is very very bad
      -- 'prettier', -- ts/js formatter (I don't need it now)
      'shfmt',
      'ruff',
      'python-lsp-server',
      'debugpy',
      -- 'a-name-not-in-registry-just-to-see-what-happen'
    },
  },
}