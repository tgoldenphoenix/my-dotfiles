-- START testing Lua commands
-- use `:messages` to view all logged messages

-- print('hello from init.lua')
-- vim.notify("console log")
-- END testing Lua commands

-- require .lua files in ./lua/
-- require("user.options")
-- require("user.keymaps")

-- Nếu path là ~/lua/core/keymaps.lua
-- require("core.keymaps")

require("neotex.core")

-- boot plugins
require("neotex.bootstrap")

-- require("anhao.core")
-- require("anhao.bootstrap")