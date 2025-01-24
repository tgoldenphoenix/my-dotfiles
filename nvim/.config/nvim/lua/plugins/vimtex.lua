-- set all global VimTeX options (those that start with g:)
-- These are configuration that should be set before VimTeX loads.
vim.cmd[[
" Don't open QuickFix for warning messages if no errors are present
let g:vimtex_quickfix_open_on_warning = 0

" Filter out some compilation warning messages from QuickFix display
let g:vimtex_quickfix_ignore_filters = [
    \ 'Underfull \\hbox',
    \ 'Overfull \\hbox',
    \ 'LaTeX Warning: .\+ float specifier changed to',
    \ 'LaTeX hooks Warning',
    \ 'Package siunitx Warning: Detected the "physics" package:',
    \ 'Package hyperref Warning: Token not allowed in a PDF string',
    \]
]]

return {
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = "zathura"
    end
  }