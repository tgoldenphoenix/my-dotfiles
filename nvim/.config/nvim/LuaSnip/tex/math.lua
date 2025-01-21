-- Abbreviations used in this article and the LuaSnip docs
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

-- Three progressively shorter ways to do the same thing---define a snippet
-- require("luasnip").snippet()
-- ls.snippet()
-- s()

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
    t("\\alpha"),
    }
    ),
    s({trig=";b", snippetType="autosnippet"},
    {
    t("\\beta Muon liem lon Kim Phuong"),
    }
    ),
    s({trig=";g", snippetType="autosnippet"},
    {
    t("\\gamma"),
    }
    ),

    -- Example of a multiline text node
    s({trig = "lines", dscr = "Demo: a text node with three lines."},
    {
    t({"Line 1", "Line 2", "Line3: Toi muon xuat tinh vao lon Kim Phuong"})
    }
    ),


    -- Combining text and insert nodes to create basic LaTeX commands
    s({trig="tt", dscr="Expands 'tt' into '\texttt{}'"},
    {
    t("\\texttt{"), -- remember: backslashes need to be escaped
    i(1),
    t("}"),
    }
    ),
    -- Yes, these jumbles of text nodes and insert nodes get messy fast, and yes,
    -- there is a much better, human-readable solution: ls.fmt, described shortly.
    s({trig="ff", dscr="Expands 'ff' into '\frac{}{}'"},
    {
    t("\\frac{"),
    i(1),  -- insert node 1
    t("}{"),
    i(2),  -- insert node 2
    t("}")
    }
    ),

}
  