return {
  "nvim-neo-tree/neo-tree.nvim",
  -- opts = {
  --   filesystem = {
  --     bind_to_cwd = true,
  --     follow_current_file = { enabled = true },
  --     use_libuv_file_watcher = true,
  --   },
  -- },
  -- opts = {},
  -- override lazyvim completely
  opts = function(_, opts)
    opts.filesystem = {}
    -- do not need to return opts
    -- return opts
  end,
}