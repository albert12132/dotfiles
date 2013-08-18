" Vim color file

" For gVim colors, add 'gui', 'guifg', 'guibg' options

hi clear

set t_Co=8

let colors_name = "forest"

" gVim colors
" Normal should come first
hi Normal       guifg=#eeeeee    guibg=#262626
hi Cursor       guifg=bg         guibg=fg
" hi lCursor     guifg=NONE     guibg=Cyan

" Window
hi LineNr       ctermfg=brown
hi Folded       ctermbg=darkgrey    ctermfg=green
hi FoldColumn   ctermbg=none        ctermfg=white
hi VertSplit    cterm=reverse
hi ColorColumn  ctermbg=white       ctermfg=black
hi CursorLine   term=none cterm=none

" Search
hi IncSearch    cterm=reverse
hi Search       ctermfg=white ctermbg=darkgrey
hi MatchParen   ctermfg=white ctermbg=black

" Status Line
hi StatusLine   cterm=NONE  ctermbg=green   ctermfg=black
hi StatusLineNC cterm=bold  ctermbg=green   ctermfg=black

" Errors
hi ErrorMsg     ctermfg=White   ctermbg=red
hi Error        ctermfg=White   ctermbg=Red
hi WarningMsg   ctermfg=Red

" Visual
hi Visual       ctermbg=NONE            cterm=reverse
hi VisualNOS    cterm=underline,bold

hi Directory    ctermfg=DarkBlue
hi ModeMsg      cterm=bold
hi MoreMsg      ctermfg=DarkGreen
hi NonText      ctermfg=brown
hi Question     ctermfg=DarkGreen

" Diff
hi DiffAdd      ctermfg=black   ctermbg=darkgreen
hi DiffDelete   ctermfg=black   ctermbg=darkred
hi DiffChange   ctermfg=black   ctermbg=darkblue
hi DiffText     ctermfg=black   ctermbg=darkblue

" HTML
hi Title        cterm=bold,underline    ctermfg=4
hi Underlined   cterm=bold,underline    ctermfg=4

"""""""""""""""""""""""
" SYNTAX HIGHLIGHTING "
"""""""""""""""""""""""

hi Comment      ctermbg=black   ctermfg=darkgrey

" Constants
hi Constant     cterm=NONE  ctermfg=brown
"hi String       cterm=NONE  ctermfg=brown
"hi Number       cterm=NONE  ctermfg=brown
"hi Boolean      cterm=NONE  ctermfg=brown

" Keywords
hi Statement    cterm=bold  ctermfg=Green
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
hi Identifier   cterm=NONE  ctermfg=grey
"hi Function     cterm=NONE  ctermfg=grey

" Special
hi Special          cterm=NONE  ctermfg=DarkGreen
"hi SpecialComment   cterm=NONE  ctermfg=DarkGreen

hi Todo     ctermbg=brown   ctermfg=black

" Pre-processor
hi PreProc  cterm=NONE  ctermfg=Grey
"hi Include  cterm=NONE  ctermfg=Grey
"hi Define   cterm=NONE  ctermfg=Grey

" Whitespace
hi ExtraWhiteSpace  ctermbg=white
:match ExtraWhiteSpace /\s\+$/


"""""""""""""""""""
" MARKDOWN SYNTAX "
"""""""""""""""""""

hi markdownCodeBlock ctermfg=grey
hi markdownListMarker ctermfg=white
hi markdownOrderedListMarker ctermfg=white
