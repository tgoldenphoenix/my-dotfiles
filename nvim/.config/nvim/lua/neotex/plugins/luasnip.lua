-- completions & snippet

local kind_icons = {
	Text = "󰉿",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = " ",
	Variable = "󰀫",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "󰑭",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = " ",
	Misc = " ",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

return {
	{ -- Autocompletion
		'hrsh7th/nvim-cmp', -- The completion plugin
		-- event src: https://neovim.io/doc/user/autocmd.html#InsertEnter
		-- event = 'InsertEnter',
		event = { "BufReadPre", "BufNewFile" },
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
					    -- require('luasnip.loaders.from_vscode').lazy_load()
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

			-- Somewhere in your Neovim startup, e.g. init.lua
			require("luasnip").config.set_config({ -- Setting LuaSnip config
				-- Enable autotriggered snippets
				enable_autosnippets = true,

				-- Use Tab (or some other key if you prefer) to trigger visual selection
				store_selection_keys = "<Tab>",

				-- For repeated nodes to update as you type
				-- default is "InsertLeave" which will update repeated nodes only after leaving insert mode
				update_events = 'TextChanged,TextChangedI'
			})

			-- Load all snippets from the nvim/LuaSnip directory at startup
			-- require("luasnip.loaders.from_lua").load({paths = "~/.config/nvim/LuaSnip/"})

			-- Lazy-load snippets, i.e. only load when required, e.g. for a given filetype
			require("luasnip.loaders.from_lua").lazy_load({paths = "~/.config/nvim/LuaSnip/"})

			-- require('luasnip.loaders.from_vscode').lazy_load()

			-- If do not use protected calls
			-- local cmp = require 'cmp'
			-- local luasnip = require 'luasnip'

			-- 'hrsh7th/nvim-cmp'
			local cmp_status_ok, cmp = pcall(require, "cmp")
			if not cmp_status_ok then
			return
			end

			local snip_status_ok, luasnip = pcall(require, "luasnip")
			if not snip_status_ok then
			return
			end
	  
			cmp.setup {
				-- REQUIRED - you must specify a snippet engine
				snippet = {
					expand = function(args)
					  luasnip.lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = {
					-- ==== Set snippet trigger, tabstop navigation keys and other functions
					-- I still can't find a way to add description for these mappings

					["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }), -- "c" stands for command mode
					["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),

					--  Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),

					-- Can change to Esc
					["<C-e>"] = cmp.mapping {
						i = cmp.mapping.abort(),
						c = cmp.mapping.close(),
					},
					
					-- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
					["<C-y>"] = cmp.config.disable,
					
					-- Expand snippets in insert mode, you can also use <TAB>
					['<C-y>'] = cmp.mapping(function(fallback)
						if cmp.visible() then
							if luasnip.expandable() then
								luasnip.expand()
							else
								-- Accept currently selected item. If none selected, `select` first item.
								-- Set `select` to `false` to only confirm explicitly selected items.
								--  This will expand snippets if the LSP sent a snippet.
								cmp.confirm({
									select = true,
								})
							end
						else
							fallback()
						end
					end),

					-- Separate jump & select_next_item
					-- <C-j> & <C-k> to select next & prev item in the cmp menu
					["<C-j>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
						  cmp.select_next_item() -- bị dính phải C-e to quit :/
						else
						  fallback()
						end
					end, { "i", "s" }),

					["<C-k>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
						  cmp.select_prev_item() -- bị dính phải C-e to quit :/
						else
						  fallback()
						end
					end, { "i", "s" }),

					-- <C-n> to jump forward
					["jk"] = cmp.mapping(function(fallback)
						if luasnip.locally_jumpable(1) then
						  luasnip.jump(1)
						else
						  fallback()
						end
					end, { "i", "s" }),
					
					-- <C-p> to jump backward
					["<C-p>"] = cmp.mapping(function(fallback)
						if luasnip.locally_jumpable(-1) then
						  luasnip.jump(-1)
						else
						  fallback()
						end
					end, { "i", "s" }),

					-- Combine jump & select_next_item into one keymap
					-- Jump forward in through tabstops in insert and visual mode with Control-n
					-- ["<C-n>"] = cmp.mapping(function(fallback)
					-- 	if cmp.visible() then
					-- 	  cmp.select_next_item() -- bị dính phải C-e to quit :/
					-- 	elseif luasnip.locally_jumpable(1) then
					-- 	  luasnip.jump(1)
					-- 	else
					-- 	  fallback()
					-- 	end
					-- end, { "i", "s" }),

					-- Jump backward through snippet tabstops
					-- ["<C-p>"] = cmp.mapping(function(fallback)
					-- 	if cmp.visible() then
					-- 	  cmp.select_prev_item()
					-- 	elseif luasnip.locally_jumpable(-1) then
					-- 	  luasnip.jump(-1)
					-- 	else
					-- 	  fallback()
					-- 	end
					-- end, { "i", "s" }),

					-- Think of <c-l> as moving to the right of your snippet expansion.
					--  So if you have a snippet that's like:
					--  function $name($args)
					--    $body
					--  end
					--
					-- <c-l> will move you to the right of each of the expansion locations.
					-- <c-h> is similar, except moving you backwards.
					['<C-l>'] = cmp.mapping(function()
						if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
						end
					end, { 'i', 's' }),
					['<C-h>'] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
						end
					end, { 'i', 's' }),

				}, -- END mapping

				sources = {
					-- Order of precedence top to bottom
					-- nên để lsp & snippet on top thứ tự ưu tiên
					{
					  name = 'lazydev',
					  -- set group index to 0 to skip loading LuaLS completions as lazydev recommends it
					  group_index = 0,
					},
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = "buffer" }, -- buffer là những files đang currently opened
					{ name = 'path' },
					{ name = 'nvim_lsp_signature_help' },
				},
				formatting = {
					fields = { "kind", "abbr", "menu" },
					format = function(entry, vim_item)
					  -- Kind icons
					  vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
					  -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
					  vim_item.menu = ({
						nvim_lsp = "[LSP]",
						luasnip = "[Snippet]",
						buffer = "[Buffer]",
						path = "[Path]",
					  })[entry.source.name]
					  return vim_item
					end,
				},
			} -- END cmp.setup()

			vim.cmd[[
				" Vimscript goes here!
				
				" Cycle forward through choice nodes with Control-f (for example)
				" Choice nodes are a more advanced tool that I won\'t cover in this article, so you can safely skip this step for now.
				" imap <silent><expr> <C-k> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
				" smap <silent><expr> <C-k> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-f>'
			]]
		end,
	}
}