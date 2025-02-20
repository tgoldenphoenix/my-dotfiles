return {
    'ThePrimeagen/vim-be-good',
    {
    -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
    'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        }
    },

    {
        -- install with yarn or npm
        "iamcco/markdown-preview.nvim",
        -- cmd key for Lazy-load on command
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
          vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
      },
}