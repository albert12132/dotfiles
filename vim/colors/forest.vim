" Vim color file

" For gVim colors, add 'gui', 'guifg', 'guibg' options

hi clear

set t_Co=256

let colors_name = "forest"

" Normal should come first
hi Normal       ctermfg=10  ctermbg=none
hi Cursor       cterm=reverse
hi CursorLine   term=none   cterm=none  ctermbg=238
hi CursorColumn term=none   cterm=none  ctermbg=238

" Window
hi LineNr       cterm=none ctermfg=3
hi ColorColumn  ctermbg=240
hi VertSplit    cterm=bold  ctermbg=234   ctermfg=234

" Status Line
hi StatusLine   cterm=bold  ctermbg=2   ctermfg=7
hi StatusLineNC cterm=bold  ctermbg=234   ctermfg=7

" Folds
hi Folded       ctermbg=none    ctermfg=7
hi FoldColumn   ctermbg=none        ctermfg=7

" Search
hi IncSearch    cterm=reverse
hi Search       ctermfg=white ctermbg=darkgrey
hi MatchParen   ctermfg=white ctermbg=black

" Errors
hi ErrorMsg     ctermfg=White   ctermbg=red
hi Error        ctermfg=White   ctermbg=Red
hi WarningMsg   ctermfg=Red

" Misc
hi Directory    cterm=bold  ctermfg=35
hi ModeMsg      cterm=bold
hi MoreMsg      ctermfg=DarkGreen
hi NonText      ctermfg=3
hi SpecialKey   ctermfg=246
hi Question     ctermfg=DarkGreen
hi Title        cterm=bold,underline    ctermfg=35
hi Underlined   cterm=bold,underline    ctermfg=41

" Diff
hi DiffAdd      ctermfg=black   ctermbg=darkgreen
hi DiffDelete   ctermfg=black   ctermbg=darkred
hi DiffChange   ctermfg=black   ctermbg=darkblue
hi DiffText     ctermfg=black   ctermbg=darkblue

" Pmenu (omni completion)
hi Pmenu        ctermbg=120   ctermfg=234
hi PmenuSel     ctermbg=71     ctermfg=234 cterm=bold
hi PmenuThumb   ctermbg=71      ctermfg=71

"--------------------------------------------------------------------"
" GENERIC SYNTAX HIGHLIGHTING                                        "
"--------------------------------------------------------------------"

hi Comment      ctermbg=235   ctermfg=245

" Constants
hi Constant     cterm=NONE  ctermfg=3
"hi String       cterm=NONE  ctermfg=brown
"hi Number       cterm=NONE  ctermfg=brown
"hi Boolean      cterm=NONE  ctermfg=brown

" Keywords
hi Statement    cterm=bold  ctermfg=10
"hi Conditional  cterm=bold  ctermfg=Green
"hi Repeat       cterm=bold  ctermfg=Green
"hi Exception    cterm=bold  ctermfg=Green
"hi Label        cterm=bold  ctermfg=Green
"hi Operator     cterm=bold  ctermfg=Green
"hi Keyword      cterm=bold  ctermfg=Green

" Type
hi Type         cterm=NONE  ctermfg=green
"hi Structure    cterm=NONE  ctermfg=brown
hi Typedef      cterm=NONE  ctermfg=brown

" Identifiers
hi Identifier   cterm=NONE  ctermfg=254
"hi Function     cterm=NONE  ctermfg=grey

" Special
hi Special          cterm=NONE  ctermfg=34
"hi SpecialComment   cterm=NONE  ctermfg=DarkGreen

hi Todo     ctermbg=3   ctermfg=black

" Pre-processor
hi PreProc  cterm=NONE  ctermfg=254
"hi Include  cterm=NONE  ctermfg=Grey
"hi Define   cterm=NONE  ctermfg=Grey

"--------------------------------------------------------------------"
" SPECIFIC SYNTAX                                                    "
"--------------------------------------------------------------------"

" Python
hi pythonFunction cterm=bold ctermfg=254
hi pythonExceptions ctermfg=254

" HTML
hi htmlTagName ctermfg=42 cterm=bold
hi htmlItalic ctermfg=254 ctermbg=none
hi htmlBold cterm=bold ctermfg=254
hi htmlBoldItalic cterm=bold ctermfg=254

" Markdown
hi markdownCodeBlock ctermfg=254
hi markdownCode ctermfg=41
hi markdownListMarker ctermfg=254
hi markdownOrderedListMarker ctermfg=254

