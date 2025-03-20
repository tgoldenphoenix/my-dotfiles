" LateX-specfic configuration related to the VimTeX plugin

nmap <leader>i <plug>(vimtex-info)

nmap <leader>tv <CMD>VimtexTocToggle<CR>

" Compilation

" Use `<localleader>c` to trigger continuous compilation...
nmap <localleader>c <Plug>(vimtex-compile)

" Start single shot compilation (different work flow)
" noremap <leader>c <Cmd>update<CR><Cmd>VimtexCompileSS<CR>
" noremap <leader>r <Cmd>update<CR><Cmd>VimtexCompileSS<CR>

" View `pdf` for current project, perform forward search if available.
nmap <leader>v <plug>(vimtex-view)
" nmap <localleader>v <plug>(vimtex-view)

" Example: make `<leader>wc` call the command `VimtexCountWords`;
noremap <leader>wc <Cmd>VimtexCountWords<CR>

" DEFINE MAPPINGS
" ---------------------------------------------
" Delete surrounding environments
nmap dse <plug>(vimtex-env-delete)

" Delete surrounding commands
nmap dsc <plug>(vimtex-cmd-delete)

" Delete surrounding math
nmap dsm <plug>(vimtex-env-delete-math)

" Delete surrounding delimiters
nmap dsd <plug>(vimtex-delim-delete)

" =======================================

" Change surrounding environments
nmap cse <plug>(vimtex-env-change)

" Change surrounding commands
nmap csc <plug>(vimtex-cmd-change)

" Change surrounding math
nmap csm <plug>(vimtex-env-change-math)

" Change surrounding delimiters
nmap csd <plug>(vimtex-delim-change-math)

" =======================================

" ====== Toggle-style mappings

" Toggle surrounding fractions
nmap tsf <plug>(vimtex-cmd-toggle-frac)

" Toggle starred commands and environments
nmap tsc <plug>(vimtex-cmd-toggle-star)
nmap tse <plug>(vimtex-env-toggle-star)

" Toggle surrounding delimiters
nmap tsd <plug>(vimtex-delim-toggle-modifier)
nmap tsD <plug>(vimtex-delim-toggle-modifier-reverse)

" Toggle between inline and display math
nmap tsm <plug>(vimtex-env-toggle-math)

imap ]] <plug>(vimtex-delim-close)

" ======= Text objects in operator-pending mode

" LaTeX commands
omap ac <plug>(vimtex-ac)
xmap ac <plug>(vimtex-ac)
omap ic <plug>(vimtex-ic)
xmap ic <plug>(vimtex-ic)

"  	Paired delimiters
omap ad <plug>(vimtex-ad)
xmap ad <plug>(vimtex-ad)
omap id <plug>(vimtex-id)
xmap id <plug>(vimtex-id)

" LaTeX environments
omap ae <plug>(vimtex-ae)
xmap ae <plug>(vimtex-ae)
omap ie <plug>(vimtex-ie)
xmap ie <plug>(vimtex-ie)

" Inline math
omap am <plug>(vimtex-a$)
xmap am <plug>(vimtex-a$)
omap im <plug>(vimtex-i$)
xmap im <plug>(vimtex-i$)

" Sections
omap aP <plug>(vimtex-aP)
xmap aP <plug>(vimtex-aP)
omap iP <plug>(vimtex-iP)
xmap iP <plug>(vimtex-iP)

" Items in itemize and enumerate environments
omap ai <plug>(vimtex-am)
xmap ai <plug>(vimtex-am)
omap ii <plug>(vimtex-im)
xmap ii <plug>(vimtex-im)

" ============== Motion mappings
" All of the following motions accept a count
" and work in nvo modes: normal, perator-pending, and visual modes

" Navigate matching content
map %  <plug>(vimtex-%)

" Navigate sections
map ]] <plug>(vimtex-]])
map ][ <plug>(vimtex-][)
map [] <plug>(vimtex-[])
map [[ <plug>(vimtex-[[)

" Navigate environments
map ]m <plug>(vimtex-]m)
map ]M <plug>(vimtex-]M)
map [m <plug>(vimtex-[m)
map [M <plug>(vimtex-[M)

" Navigate math zones
map ]n <plug>(vimtex-]n)
map ]N <plug>(vimtex-]N)
map [n <plug>(vimtex-[n)
map [N <plug>(vimtex-[N)

" Navigate Beamer frames
map ]r <plug>(vimtex-]r)
map ]R <plug>(vimtex-]R)
map [r <plug>(vimtex-[r)
map [R <plug>(vimtex-[R)

map ]/ <plug>(vimtex-]/
map ]* <plug>(vimtex-]star
map [/ <plug>(vimtex-[/
map [* <plug>(vimtex-[star
