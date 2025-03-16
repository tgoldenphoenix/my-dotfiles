-- Repeated nodes
local rep = require("luasnip.extras").rep

-- Alternative is to write a regex that detect line begin manually
local line_begin = require("luasnip.extras.expand_conditions").line_begin

--  ==== START section: Functions to be passed to the condition key in opts table

-- Silly example: returns true when the cursor is on an even-numbered line
is_even_line = function()
    local line_number = vim.fn['line']('.')
    if ((line_number % 2) == 0) then  -- an even-numbered line
        return true
    else  -- an odd-numbered line
        return false
    end
end
-- (Yes, I know I could have written `return ((line_number % 2) == 0)`,
-- but I wanted to make the if/else logic explicitly clear.)

-- Include this `in_mathzone` function at the start of a snippets file...
local tex_utils = {}

-- Then pass the table `{condition = in_mathzone}` to any snippet you want to
-- expand only in math contexts such as inside $$.
tex_utils.in_mathzone = function()  -- math context detection
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

-- local in_mathzone = function()
--     -- The `in_mathzone` function requires the VimTeX plugin
--     return vim.fn['vimtex#syntax#in_mathzone']() == 1
-- end

tex_utils.in_tikz = function()  -- TikZ picture environment detection
    return tex_utils.in_env('tikzpicture')
end

--  ==== END section: Functions to be passed to the condition key in opts table

-- From any snippet file, source `get_visual` from global helper functions file
local helpers = require('neotex.luasnip-helper-funcs') -- from ~/lua/neotex/
local get_visual = helpers.get_visual

-- the return table must be placed at the end of the .lua file
return {
    -- Example of a multiline text node
    s({trig = "lines", dscr = "Demo: a text node with three lines."},
        {
        t({
            "Line 1: muốn bú vú kim phượng", 
            "Line 2", 
            "Line3: Toi muon xuat tinh vao lon Kim Phuong"
        })
        }
    ),

    -- Example use of insert node placeholder text
    s({trig="hr", dscr="The hyperref package's href{}{} command (for url links)"},
        fmta( -- Use [[ ]] instead of " " will not need to escape backslash
        [[\href{<>}{<>}]],
        {
            i(1, "url"),
            i(2, "display name"),
        }
        )
    ),

    -- Inspied by the HTML <h1> tag
    s({trig = "h1", dscr="Top-level section"},
        fmta(
            [[\section{<>}]],
            { i(1) }
        ), 
        {condition = line_begin}  -- set condition in the `opts` table
    ),

    -- Expand 'dd' into \draw, but only in TikZ environments
    s({trig = "dd"},
        fmta(
            "\\draw [<>] ",
            {
                i(1, "params"),
            }
        ),
        { condition = tex_utils.in_tikz }
    ),

    -- s({trig="test", snippetType="autosnippet"},
    --     {t("The current line number is even and toi muon moc lon kim phuong")},
    --     {condition = is_even_line}
    -- ),

    -- test regex capture
    -- s(
	-- 	{ trig = "b(%d)", regTrig = true },
	-- 	f(function(_, snip)
	-- 		return "Captured Text: " .. snip.captures[1] .. "."
	-- 	end, {})
	-- ),

    
}

  