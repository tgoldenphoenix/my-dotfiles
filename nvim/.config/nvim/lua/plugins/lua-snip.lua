-- vim.notify("num vu kim phuong completion")
-- completions & snippet

return {
	{ -- Autocompletion
		'hrsh7th/nvim-cmp', -- The completion plugin
		event = 'InsertEnter',
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = "make install_jsregexp"
			},

			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			-- 'neovim/nvim-lspconfig',
			-- 'hrsh7th/cmp-nvim-lsp',
			'saadparwaiz1/cmp_luasnip', -- snippet completions
			'hrsh7th/cmp-buffer', -- buffer completion
			'hrsh7th/cmp-path', -- path completion
			'hrsh7th/cmp-cmdline', -- cmdline completions

		}
	}
}