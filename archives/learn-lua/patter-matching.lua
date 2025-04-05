print(string.match("\\chapter{chap 01}", '^\\\\chapter%b{}$') )
-- nil
print(string.match("\\chapter{chap 02 trigonometry}", '^\\chapter%b{}$') )
--\chapter{chap 02 trigonometry}

-- ==============================

local line_content = "\\section{Background}"

local command = line_content:match("\\\\chapter%b{}") or line_content:match("^\\section%b{}$")

if command then
  print("Matched LaTeX command:", command)
  -- Matched LaTeX command:	\section{Background}
end