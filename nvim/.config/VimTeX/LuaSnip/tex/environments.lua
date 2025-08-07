local helpers = require('neotex.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Return snippet tables
return{
    -- GENERIC ENVIRONMENT
    -- Auto-snippets do not need description though
    -- other trig is "env"
    s({trig="new", snippetType="autosnippet"},
      fmta(
        [[
        \begin{<>}
            <>
        \end{<>}
      ]],
        {
          i(1),
          d(2, get_visual),
          rep(1),
        }
      ),
      {condition = line_begin}
    ),

    -- EQUATION
    -- Using $$ $$ is deprecated and is not recommended!
    -- trig "eq"
    s({trig="nn", snippetType="autosnippet"},
      fmta(
        [[
        \begin{equation*}
            <>
        \end{equation*}
      ]],
        {
          i(1),
        }
      ),
      { condition = line_begin }
    ),

    -- ALIGN
    s({trig="all", snippetType="autosnippet"},
      fmta(
        [[
        \begin{align*}
            <>
        \end{align*}
      ]],
        {
          i(1),
        }
      ),
      {condition = line_begin}
    ),

    -- ITEMIZE
    -- bulleted (unordered) lists
    s({trig="itt", snippetType="autosnippet"},
      fmta(
        [[
        \begin{itemize}

            \item <>

        \end{itemize}
      ]],
        {
          i(0), -- not i(1), do you know why?
        }
      ),
      {condition = line_begin}
    ),

    -- ENUMERATE
    s({trig="enn", snippetType="autosnippet"},
      fmta(
        [[
        \begin{enumerate}

            \item <>

        \end{enumerate}
      ]],
        {
          i(0),
        }
      )
    ),

    -- INLINE MATH
    -- Make mm expand to $ $ (inline math), but not in words like “comment”, “command”, etc…
    s({trig = "([^%l])mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "<>$<>$",
        {
          f( function(_, snip) return snip.captures[1] end ),
          d(1, get_visual),
        }
      )
    ),
    -- INLINE MATH ON NEW LINE
    s({trig = "^mm", regTrig = true, wordTrig = false, snippetType="autosnippet"},
      fmta(
        "$<>$",
        {
          i(1),
        }
      )
    ),

    -- FIGURE
    -- s({trig = "fig"},
    --   fmta(
    --     [[
    --     \begin{figure}[htb!]
    --       \centering
    --       \includegraphics[width=<>\linewidth]{<>}
    --       \caption{<>}
    --       \label{fig:<>}
    --     \end{figure}
    --     ]],
    --     {
    --       i(1),
    --       i(2),
    --       i(3),
    --       i(4),
    --     }
    --   ),
    --   { condition = line_begin }
    -- ),
    s({trig = "fig"},
      fmta(
        [[
        \begin{figure}[htb!]
          \centering
          \includegraphics[width=0.7\linewidth]{<>}
          \caption{<>}
        \end{figure}
        ]],
        {
          i(1),
          i(2),
        }
      ),
      { condition = line_begin }
    ),
}