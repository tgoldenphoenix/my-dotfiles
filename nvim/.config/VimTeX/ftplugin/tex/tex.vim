" echo "anhao"

" setting indentation
" global indent is only 2, for now just try 4 and see how it goes...
setlocal expandtab
setlocal autoindent
setlocal tabstop=2
setlocal softtabstop=2
setlocal shiftwidth=2

" Turn off automatic indenting in enumerated environments
" let g:tex_indent_items=0

" ======= START FOLDING =======

" replaced from plugin/vimtex.vim and
" move to VimTex/ftplugin/tex/tex.vim
" since I only want to set this for tex filetype buffer

" zR open all folds
" zM close all open folds
" za toggles the fold at the cursor
" `zk` `zj` move up/down to the next fold

" default is 0 (false)
" do not use session when changing this setting because
" session save your settings
let g:vimtex_fold_enabled = 1

" or set vimtex_fold_enabled to 0 & set fold option manually
" set foldmethod=expr
" set foldexpr=vimtex#fold#level(v:lnum)
" set foldtext=""

" ======= END FOLDING =======