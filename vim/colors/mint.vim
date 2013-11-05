" Vim color file
" Author: Albert Wu

" For gVim colors, add 'gui', 'guifg', 'guibg' options

hi clear

set t_Co=256

let colors_name = "mint"

"--------------------------------------------------------------------"
" GENERAL SETTINGS                                                   "
"--------------------------------------------------------------------"

" Normal should come first
hi Normal       ctermfg=10  ctermbg=none
hi Cursor       cterm=reverse
hi CursorLine   term=none   cterm=none  ctermbg=238
hi CursorColumn term=none   cterm=none  ctermbg=238

" Window
hi LineNr       cterm=none  ctermfg=246 ctermbg=none
hi ColorColumn  ctermbg=240
hi VertSplit    cterm=bold  ctermfg=234 ctermbg=234

" Tabs
hi TabLineSel   cterm=bold  ctermfg=16 ctermbg=71
hi TabLine      cterm=none  ctermfg=250 ctermbg=234
hi TabLineFill  cterm=none  ctermbg=234

" Status Line
hi StatusLine   cterm=bold  ctermbg=71  ctermfg=16
hi StatusLineNC cterm=none  ctermfg=250 ctermbg=234

" Visual
hi Visual       term=none   cterm=none  ctermbg=238
hi VisualNOS    cterm=underline,bold

" Folds
hi Folded       ctermfg=255 ctermbg=none
hi FoldColumn   ctermfg=254 ctermbg=none

" Search
hi IncSearch    cterm=reverse
hi Search       ctermfg=white   ctermbg=darkgrey
hi MatchParen   cterm=bold      ctermfg=254 ctermbg=235

" Errors
hi ErrorMsg     cterm=bold      ctermfg=15  ctermbg=160
hi Error        ctermfg=White   ctermbg=Red
hi WarningMsg   ctermfg=Red

" Misc
hi Directory    cterm=bold  ctermfg=35
hi ModeMsg      cterm=bold
hi MoreMsg      ctermfg=DarkGreen
hi NonText      ctermfg=246
hi SpecialKey   ctermfg=246
hi Question     ctermfg=DarkGreen
hi Title        cterm=bold,underline    ctermfg=35
hi Underlined   cterm=bold,underline    ctermfg=41

" Diff
hi DiffAdd      ctermfg=black   ctermbg=77
hi DiffDelete   ctermfg=black   ctermbg=160
hi DiffChange   ctermfg=black   ctermbg=32
hi DiffText     ctermfg=black   ctermbg=232

" Pmenu (omni completion)
hi Pmenu        ctermbg=120   ctermfg=234
hi PmenuSel     ctermbg=71     ctermfg=234 cterm=bold
hi PmenuThumb   ctermbg=71      ctermfg=71

"--------------------------------------------------------------------"
" GENERIC SYNTAX HIGHLIGHTING                                        "
"--------------------------------------------------------------------"

hi Comment      ctermbg=235   ctermfg=245

" Constants
hi Constant     ctermfg=120
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
hi Special          cterm=NONE  ctermfg=41
"hi SpecialComment   cterm=NONE  ctermfg=DarkGreen

hi Todo     ctermbg=83   ctermfg=black

" Pre-processor
hi PreProc  cterm=NONE  ctermfg=254
"hi Include  cterm=NONE  ctermfg=Grey
"hi Define   cterm=NONE  ctermfg=Grey

" Whitespace
" hi ExtraWhiteSpace  ctermbg=white
" :match ExtraWhiteSpace /\s\+$/

"--------------------------------------------------------------------"
" SPECIFIC SYNTAX                                                    "
"--------------------------------------------------------------------"

" Python
hi pythonFunction cterm=bold ctermfg=254
hi pythonDecorator ctermfg=41
hi pythonExceptions ctermfg=41

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

