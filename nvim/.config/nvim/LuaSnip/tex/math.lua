-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
-- the format function for writing human-readable snippets
local fmt = require("luasnip.extras.fmt").fmt -- use {} as the default node placeholder
local fmta = require("luasnip.extras.fmt").fmta -- use <>
-- fmat is is more convenient for LaTeX, which itself uses curly braces to specify command and environment arguments

local rep = require("luasnip.extras").rep
local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Three progressively shorter ways to do the same thing---define a snippet
-- require("luasnip").snippet()
-- ls.snippet()
-- s()

--  START section: Functions to be passed to the condition key in opts table

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
local in_mathzone = function()
    -- The `in_mathzone` function requires the VimTeX plugin
    return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
-- Then pass the table `{condition = in_mathzone}` to any snippet you want to
-- expand only in math contexts such as inside $$.

--  END section: Functions to be passed to the condition key in opts table

-- This is the `get_visual` function I've been talking about.
-- You must place this function before the returned table
-- ----------------------------------------------------------------------------
-- Summary: When `LS_SELECT_RAW` is populated with a visual selection, the function
-- returns an insert node whose initial text is set to the visual selection.
-- When `LS_SELECT_RAW` is empty, the function simply returns an empty insert node.
local get_visual = function(args, parent)
    if (#parent.snippet.env.LS_SELECT_RAW > 0) then
      return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
    else  -- If LS_SELECT_RAW is empty, return a blank insert node
      return sn(nil, i(1))
    end
end
-- ----------------------------------------------------------------------------

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

    -- Another take on the fraction snippet without using a regex trigger
    s({trig = "ff", dscr="Expands 'ff' into '\frac{}{}'"},
        fmta(
        "\\frac{<>}{<>}",
        {
            i(1),
            i(2),
        }
        ),
        {condition = in_mathzone}  -- `condition` option passed in the snippet `opts` table 
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
    s({trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command."},
    fmta("\\textit{<>}",
    {
        d(1, get_visual),
    }
    )
    ),

    -- Using regex in trigger pattern
    s({trig = "([^%a])mm", wordTrig = false, regTrig = true},
    fmta(
        "<>$<>$",
        {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
        }
    )
    ),

    s({trig = '([^%a])ee', regTrig = true, wordTrig = false},
    fmta(
        "<>e^{<>}",
        {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual)
        }
    )
    ),

    s({trig = '([^%a])ff', regTrig = true, wordTrig = false},
    fmta(
        [[<>\frac{<>}{<>}]],
        {
        f( function(_, snip) return snip.captures[1] end ),
        i(1),
        i(2)
        }
    )
    ),

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

    s({trig="test", snippetType="autosnippet"},
        {t("The current line number is even and toi muon moc lon kim phuong")},
        {condition = is_even_line}
    ),

}

  