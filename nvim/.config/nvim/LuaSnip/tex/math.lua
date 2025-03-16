-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node

local f = ls.function_node  -- used for regex capture
local d = ls.dynamic_node   -- used with visual selection
-- the format function for writing human-readable snippets
local fmt = require("luasnip.extras.fmt").fmt -- use {} as the default node placeholder
local fmta = require("luasnip.extras.fmt").fmta -- use <>
-- fmat is is more convenient for LaTeX, which itself uses curly braces to specify command and environment arguments

-- Repeated nodes
local rep = require("luasnip.extras").rep

-- Alternative is to write a regex that detect line begin manually
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Three progressively shorter ways to do the same thing---define a snippet
-- require("luasnip").snippet()
-- ls.snippet()
-- s()

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
    -- Example: how to set snippet parameters
    -- s(
    --   { -- Table 1: snippet parameters
    --     trig="hi",
    --     dscr="An autotriggering snippet that expands 'hi' into 'Hello, world!'",
    --     regTrig=false,
    --     priority=100,
    --     snippetType="autosnippet"
    --   },
    --   { -- Table 2: snippet nodes (don't worry about this for now---we'll cover nodes shortly)
    --     t("Hello, kim phuong! I want to suck your boobs!"), -- A single text node
    --   }
    --   -- Table 3, the advanced snippet options, is left blank.
    -- ),

    -- Shorthand
    -- s("vu",  -- LuaSnip expands this to {trig = "hi"}
    -- { t("Muon bu vu kim Phuong!"), }
    -- ),
    -- Here is the equivalent longhand
    -- s({trig = "vu"},  -- explicitly setting trigger via params table
    -- { t("Muon bu vu kim Phuong!"), }
    -- ),

    -- Examples of Greek letter snippets, autotriggered for efficiency
    s({trig=";a", snippetType="autosnippet"},
        {
        t("\\alpha"), -- remember: backslashes need to be escaped
        }
    ),
    s({trig=";b", snippetType="autosnippet"},
        {
        t("\\beta"),
        }
    ),
    s({trig=";g", snippetType="autosnippet"},
        {
        t("\\gamma"),
        }
    ),
    s({trig=";t", snippetType="autosnippet"},
        {
        t("\\theta"),
        }
    ),

    -- Example of a multiline text node
    s({trig = "lines", dscr = "Demo: a text node with three lines."},
        {
        t({"Line 1", "Line 2", "Line3: Toi muon xuat tinh vao lon Kim Phuong"})
        }
    ),

    -- \texttt
    s({trig="tt", dscr="Expands 'tt' into '\texttt{}'"},
        fmta(
            "\\texttt{<>}",
            { i(1) }
        )
    ),

    -- Equation
    s({trig="eq", dscr="A LaTeX equation environment"},
        fmt( -- The snippet code actually looks like the equation environment it produces.
            -- Equation snippet, using a multiline Lua string.
            -- (No need to escape backslashes in multiline strings.) 
            [[
                \begin{equation}
                    <>
                \end{equation}
            ]],
            -- The insert node is placed in the <> angle brackets
            { i(1) },
            { delimiters = "<>" } -- manually specifying angle bracket delimiters
        )
    ),

    -- Using a zero-index insert node to exit snippet in equation body
    -- https://ejmastnak.com/tutorials/vim-latex/luasnip/#files
    -- s({trig="eq", dscr="A LaTeX equation environment"},
    --     fmta( 
    --         [[
    --             \begin{equation}
    --                 <>
    --             \end{equation}
    --         ]],
    --         { i(0) }
    --     )
    -- ),

    -- environment snippet
    s({trig="env", snippetType="autosnippet"},
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            {
                i(1),
                i(2),
                rep(1),  -- this node repeats insert node i(1)
            }
        )
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

    -- Example: italic font implementing visual selection
    -- if there is no active visual selection, the dynamic node simply acts as a regular insert node.
    s({trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command."},
        fmta("\\textit{<>}",
            {
                d(1, get_visual),
            }
        )
    ),

    -- test regex capture
    -- s(
	-- 	{ trig = "b(%d)", regTrig = true },
	-- 	f(function(_, snip)
	-- 		return "Captured Text: " .. snip.captures[1] .. "."
	-- 	end, {})
	-- ),

    -- Using regex in trigger pattern
    -- INLINE MATH
    -- Make mm expand to $ $ (inline math), but not in words like “comment”, “command”, etc…
    -- s({trig = "([^%l])mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
    --   fmta(
    --     "<>$<>$",
    --     {
    --       f( function(_, snip) return snip.captures[1] end ),
    --       d(1, get_visual),
    --     }
    --   )
    -- ),
    -- s({trig = "([^%a])mm", wordTrig = false, regTrig = true},
    --     fmta(
    --         "<>$<>$",
    --         {
    --             f( function(_, snip) return snip.captures[1] end ),
    --             d(1, get_visual),
    --         }
    --     )
    -- ),

    -- Make ff expand to frac{}{} but not in words like “off”, “offer”, etc…
    -- Will not work correctly at line_beginning though
    -- s({trig = '([^%a])ff', regTrig = true, wordTrig = false},
    --     fmta(
    --         [[<>\frac{<>}{<>}]],
    --         {
    --             f( function(_, snip) return snip.captures[1] end ),
    --             i(1),
    --             i(2)
    --         }
    --     )
    -- ),

    -- Another take on the fraction snippet without using a regex trigger
    s({trig = "ff", dscr="Expands 'ff' into '\frac{}{}'", snippetType="autosnippet"},
        fmta(
        "\\frac{<>}{<>}",
        {
            i(1),
            i(2),
        }
        ),
        {condition = tex_utils.in_mathzone}  -- `condition` option passed in the snippet `opts` table 
    ),

    -- Make ee expand to e^{} (Euler’s number raised to a power) after spaces, delimiters, and so on, but not in words like “see”, “feel”, etc…
    s({trig = 'ee', dscr="Expands 'ee' into 'e^{}'", snippetType="autosnippet"},
        fmta(
            "<>e^{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                d(1, get_visual)
            }
        ),
        {condition = tex_utils.in_mathzone}
    ),

    -- A fun zero subscript snippet
    -- expands only after letter characters and closing delimiters, but not after blank spaces or numbers.
    s({trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType="autosnippet"},
        fmta(
            "<>_{<>}",
            {
                f( function(_, snip) return snip.captures[1] end ),
                t("0")
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

    s({trig="new", dscr="A generic new environmennt"},
        fmta(
            [[
                \begin{<>}
                    <>
                \end{<>}
            ]],
            {
                i(1),
                i(2),
                rep(1),
            }
        ),
        {condition = line_begin}
    ),

    -- s({trig="test", snippetType="autosnippet"},
    --     {t("The current line number is even and toi muon moc lon kim phuong")},
    --     {condition = is_even_line}
    -- ),

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

}

  