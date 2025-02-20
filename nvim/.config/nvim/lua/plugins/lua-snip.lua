-- vim.notify("num vu kim phuong completion")
-- completions & snippet

return {
	{ -- Autocompletion
		'hrsh7th/nvim-cmp', -- The completion plugin
		-- event src: https://neovim.io/doc/user/autocmd.html#InsertEnter
		event = 'InsertEnter',
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				-- follow latest release.
				version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
				-- install jsregexp (optional!).
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
					  return
					end
					return 'make install_jsregexp'
				  end)(),

				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					{
					  'rafamadriz/friendly-snippets', -- a bunch of snippets
					  config = function()
					    require('luasnip.loaders.from_vscode').lazy_load()
					  end,
					},
				  },
			},
			'saadparwaiz1/cmp_luasnip', -- snippet completions

			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			-- 'neovim/nvim-lspconfig',
			-- 'hrsh7th/cmp-nvim-lsp',
			-- 'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-buffer', -- buffer completion
			'hrsh7th/cmp-path', -- path completion
			'hrsh7th/cmp-cmdline', -- cmdline completions
		},
		config = function()
			-- vim.notify("config of cmp")

			-- set keymaps for latex luasnip
			-- Yes, we're just executing a bunch of Vimscript, but this is the officially
			-- endorsed method; see https://github.com/L3MON4D3/LuaSnip#keymaps
			vim.cmd[[
				" Vimscript goes here!
				
				" Set snippet trigger and tabstop navigation keys
				
				" Expand snippets in insert mode with Tab
				imap <silent><expr> <Tab> luasnip#expandable() ? '<Plug>luasnip-expand-snippet' : '<Tab>'
				
				" Jump forward in through tabstops in insert and visual mode with Control-f
				imap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
				smap <silent><expr> <C-f> luasnip#jumpable(1) ? '<Plug>luasnip-jump-next' : '<C-f>'
				
				" Jump backward through snippet tabstops with Shift-Tab (for example)
				imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
				smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ? '<Plug>luasnip-jump-prev' : '<S-Tab>'
				
				" Cycle forward through choice nodes with Control-f (for example)
				imap <silent><expr> <C-k> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
				smap <silent><expr> <C-k> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
			]]

			-- Somewhere in your Neovim startup, e.g. init.lua
			require("luasnip").config.set_config({ -- Setting LuaSnip config

			-- Enable autotriggered snippets
			enable_autosnippets = true,

			-- Use Tab (or some other key if you prefer) to trigger visual selection
			store_selection_keys = "<Tab>",

			-- For repeated nodes to update as you type
			update_events = 'TextChanged,TextChangedI'
			})
			
		end,
	}
}