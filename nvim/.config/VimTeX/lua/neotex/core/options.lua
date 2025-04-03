-- vim.cmd.echo('"nvim/lua/vim-options.lua"')

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

local options = {     -- Nếu không để "local" thì default là global variables

  -- GENERAL

  -- If timeoutlen = 100 some keymap like "dse" will not have enough time to be pressed
  -- I spent an entire day figuring this bug out!!!
  timeoutlen = 1400,               -- time to wait for a mapped sequence to complete (in milliseconds); Decrease mapped sequence wait time

  -- This is a funny one, press ESC to get back to normal mode and wait :D
  -- ttimeoutlen = 3000,
  updatetime = 200,               -- faster completion (4000ms default); Decrease update time
  swapfile = false,               -- creates a swapfile
  undofile = true,                -- enable persistent undo, Save undo history
  writebackup = false,            -- if a file is being edited by another program, it is not allowed to be edited

  -- APPEARANCE
  laststatus = 3,                 -- views can only be fully collapsed with the global statusline
  fileencoding = "utf-8",         -- the encoding written to a file
  guifont = "monospace:h17",      -- the font used in graphical neovim applications

  -- will affect colorscheme like guvbox
  background = "dark",            -- colorschemes that can be light or dark will be made dark

  termguicolors = true,           -- set term gui colors (most terminals support this)
  conceallevel = 0,               -- so that `` is visible in markdown files

  number = true,                  -- make line numbered
  -- You can also add relative line numbers, to help with jumping. 
  -- Experiment for yourself to see if you like it!
  relativenumber = true,          -- set relative numbered lines

  numberwidth = 2,                -- set number column width to 2 {default 4}
  signcolumn = "yes",             -- always show the sign column, otherwise it would shift the text each time

  -- fillchars = "eob: ",            -- don't show tildes
  fillchars = {
    foldopen = "", -- mark the beginning of a fold
    foldclose = "",  -- show a closed fold
    fold = " ", -- filling 'foldtext'
    foldsep = " ",
    diff = "╱",
    eob = " ",  -- empty lines at the end of a buffer
  },
  
  cursorline = true,              -- highlight the current line
  -- colorcolumn = "100",             -- highlight vertical colorcolumn (moved to after/python.lua)

  cmdheight = 1,                  -- space in the neovim command line for displaying messages; can be set to '2' for more space
  pumheight = 7,                 -- pop up menu height
  showmode = false,               -- we don't need to see things like -- INSERT -- anymore

  -- Configure how new splits should be opened
  splitbelow = true,              -- force all horizontal splits to go below current window
  splitright = true,              -- force all vertical splits to go to the right of current window
  scrolloff = 7,                  -- minimal number of screen lines to keep above and below the cursor
  sidescrolloff = 7,              -- minimal number of screen columns either side of cursor if wrap is `false`
  shortmess = "filnxtToOFc",      -- which errors to suppress
  mousemoveevent = true,

  -- INDENT

  -- can try tabstop 2
  tabstop = 2,                    -- insert 2 spaces for a tab
  shiftwidth = 2,                 -- the number of spaces inserted for each indentation
  softtabstop = 2,                -- insert 2 spaces for a tab
  expandtab = true,               -- convert tabs to spaces
  breakindent = true,             -- tab wrapped lines
  linebreak = true,               -- companion to wrap, don't split words
  backspace = "indent,eol,start", -- allow backspace on indent, end of line or insert mode start position

  -- wrap = true,                    -- display lines as one long line
  wrap = true, -- Disable line wrap
  -- showbreak = "  ",               -- set indent of wrapped lines
  -- showbreak = "wrap>",               -- set indent of wrapped lines

  -- EDIT
  spell = true,                   -- turns on spellchecker
  spelllang = { 'en_us' },        -- sets spelling dictionary

  -- Sync clipboard between OS and Neovim.
  --  Remove this option if you want your OS clipboard to remain independent.
  --  See `:help 'clipboard'`
  clipboard = "unnamedplus",      -- allows neovim to access the system clipboard

  mouse = "a",                    -- allow the mouse to be used in neovim
  mousescroll = "ver:2,hor:4",    -- change the speed of the scroll wheel

  -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
  ignorecase = true,              -- ignore case in search patterns
  smartcase = true,               -- smart case

  virtualedit = "block",          -- vitualblock mode doesn't get stuck at the end of line

  -- shows all inline replacements in split; Preview substitutions live, as you type!
  inccommand = "split",
  autoread = true,

  -- FOLDING settings
  -- foldenable = false,      -- Disable folding by default
  -- foldmethod = "expr",   -- Set manual folding
  foldlevel = 99,         -- Open all folds by default

  -- https://www.jackfranklin.co.uk/blog/code-folding-in-vim-neovim/
  foldlevelstart = 1, -- top level folds are open, but anything nested beyond that is closed
  -- foldtext = "",

}

-- turns on all values in options table above
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- https://neovim.io/doc/user/options.html#'list'
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.iskeyword:append "-"  -- hyphenated words recognized by searches

-- Set to true if you have a Nerd Font installed and selected in the terminal
-- vim.g.have_nerd_font = false
-- vim.g.have_nerd_font = true

-- CLIPBOARD -- (for yanky)
-- May help Arch/Debian Linux users
-- vim.g.clipboard = {
--   name = "xsel_override",
--   copy = {
--     ["+"] = "xsel --input --clipboard",
--     ["*"] = "xsel --input --primary",
--   },
--   paste = {
--     ["+"] = "xsel --output --clipboard",
--     ["*"] = "xsel --output --primary",
--   },
--   cache_enabled = 1,
-- }

-- Settings for the brianhuster/autosave.nvim plugin
-- vim.cmd[[
--   " Vimscript goes here!
  
--   " Legacy Vimscript

--   " Enable autosave when the plugin is loaded. Set to v:false to disable autosave, and only enable it when you run the :AutoSave toggle command.
--   let g:autosave_enabled = v:false
--   let g:autosave_disable_inside_paths = [] " A list of paths inside which autosave should be disabled. 
-- ]]