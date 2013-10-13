" This line should not be removed as it ensures that various options
" are properly set to work with the Vim-related packages available in
" Debian.
runtime! debian.vim

" Make Vim non-Vi compatible
set nocompatible

" Pathogen plugin manager
execute pathogen#infect()

"--------------------------------------------------------------------"
" "Syntax and Colors"                                                "
"--------------------------------------------------------------------"

" Indentation rules
filetype plugin indent on

" Syntax highlighting
syntax on

" If using a dark background within the editing area and syntax
" highlighting turn on this option as well
set background=dark

" Color Scheme
colorscheme mint


"--------------------------------------------------------------------"
" "Settings"                                                         "
"--------------------------------------------------------------------"

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif



" Misc
set autoread          " auto-reads a file that was changed on disk
set autowrite         " auto-save before commands like :next and :make
set hidden            " Hide buffers when they are abandoned
set noerrorbells      " No beeping

" Dimensions
set lines=50          " Number of rows
set columns=80        " Number of columns
set textwidth=70      " Virtual line width
set colorcolumn=71,81 " Vertical ruler at 71 characters

" Information
set showcmd           " Show (partial) command in status line.
set showmode          " Show the current mode
set laststatus=2      " always show status line
set statusline=%.40F%=%m\ %Y\ Line:\ %3l/%L[%3p%%]

" Navigation
set nu                " Set line numbering
set scrolloff=5       " keep at least 5 lines above/below
set mouse=i           " Enable mouse usage (all modes)
set mousehide         " Hide the mouse when typing
set cursorline        " Highlights the cursor line

" Searching
set ignorecase        " Do case insensitive matching
set smartcase         " Do smart case matching
set incsearch         " Incremental search
set hlsearch          " highlight searches
set showmatch         " Show matching brackets.

" Tabs
set expandtab         " Use spaces instead of tabs
set tabstop=4         " How many spaces a tab measures
set shiftwidth=4      " Sets >> and << width
set autoindent
set list              " Show hidden characters: tabs, trails
set listchars=trail:·,tab:››

" Folding
set foldenable        " Enables folds
set foldcolumn=1      " Shows folds in a column
set foldmethod=indent " Folds on indentation
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Backups
set nobackup          " Remove backup files
set noswapfile        " Remove swap files

" Change the <leader> key to ,
let mapleader=","



"--------------------------------------------------------------------"
" "Normal Mode bindings"                                             "
"--------------------------------------------------------------------"

" Enter command mode easier
nnoremap ; :

" Refreshes screen
nnoremap <Enter>    :nohl<CR><C-l>

" Mapping keys for multiple windows (navigation and resizing)
nnoremap __         :split 
nnoremap <Bar><Bar> :vsplit 
nnoremap <C-k>      <C-W>k
nnoremap <C-j>      <C-W>j
nnoremap <C-h>      <C-W>h
nnoremap <C-l>      <C-W>l
nnoremap +          <C-W>+
nnoremap =          <C-W>=
nnoremap -          <C-W>-

" Change cursor to move along rows, not lines. (useful for long lines)
nnoremap j          gj
nnoremap k          gk
nnoremap 0          g^
nnoremap $          g$
nnoremap ^          g0

nnoremap {          <C-u>
nnoremap }          <C-d>

" Remembers last place before jump
nnoremap ''         `'
nnoremap '          `
nnoremap g          m'g
nnoremap G          m'G

" Centers screen around cursor
nnoremap <space>    zz
nnoremap n          m'nzz
nnoremap N          m'Nzz


"--------------------------------------------------------------------"
" "Insert Mode Bindings"                                             "
"--------------------------------------------------------------------"

" Omni Completion
inoremap <leader><Tab>          <C-x><C-o>

" Easier window switching keys
inoremap <C-j>  <esc><C-w>j
inoremap <C-k>  <esc><C-w>k
inoremap <C-l>  <esc><C-w>l
inoremap <C-h>  <esc><C-w>h

"--------------------------------------------------------------------"
" "Miscellaneous"                                                    "
"--------------------------------------------------------------------"

au BufRead,BufNewFile *.md set filetype=markdown

"--------------------------------------------------------------------"
" "Command Mode Bindings"                                            "
"--------------------------------------------------------------------"

" Aliasing accidental shifts
cnoreabbrev W      w
cnoreabbrev Q      q
cnoreabbrev X      x
cnoreabbrev sh     sh
cnoreabbrev Sh     sh
cnoreabbrev sH     sh
cnoreabbrev SH     sh

" Fugitive
cnoreabbrev Gpush  Git push
cnoreabbrev Gpull  Git pull

"--------------------------------------------------------------------"
" "Unite"                                                            "
"--------------------------------------------------------------------"

let g:unite_winwidth = 30
let g:unite_winheight = 10
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

nnoremap <leader>r          :Unite -start-insert file_rec/async:!<CR>

nnoremap <leader>m          :Unite file_mru<CR>
nnoremap <leader>b          :Unite buffer<CR>
nnoremap <leader>g          :Unite grep:.<CR>
nnoremap <leader>y          :Unite history/yank<CR>

" Unite-outline
nnoremap <leader>o :<C-u>Unite -start-insert outline<CR>

"--------------------------------------------------------------------"
" "Conque"                                                           "
"--------------------------------------------------------------------"

" Conque startup configs
function! MyConqueTerm(term)
    " Default size of 10 rows
    resize 10
    " Remove whitespace indicators
    setlocal nolist
    " Remove colorcolumn
    setlocal colorcolumn=
endfunction
call conque_term#register_function('after_startup', 'MyConqueTerm')

nnoremap <leader>sh     :ConqueTermSplit 
let g:ConqueTerm_SendVisKey = '<F2>'  " Copies selected test into shell
let g:ConqueTerm_SendFileKey = '<F3>' " Copies file into shell
let g:ConqueTerm_PromptRegex = '^>>>'


"--------------------------------------------------------------------"
" "NERDTree"                                                         "
"--------------------------------------------------------------------"

nmap <tab> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1     " Show bookmarks by default
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"--------------------------------------------------------------------"
" "Indent-Guidelines"                                                "
"--------------------------------------------------------------------"

let g:indent_guides_start_level = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
nmap <leader>i      :IndentGuidesToggle<cr>
