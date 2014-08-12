" This line should not be removed as it ensures that various options
" are properly set to work with the Vim-related packages available in
" Debian.
runtime! debian.vim

" Make Vim non-Vi compatible
set nocompatible

" Vundle plugin manager
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'basepi/vim-conque'
Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'henrik/vim-indexed-search'
Plugin 'sjl/gundo.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/taglist.vim'
call vundle#end() 

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
set virtualedit=block " rectangular highlight in visual block mode

" Dimensions
set lines=50          " Number of rows
set columns=80        " Number of columns
set textwidth=71      " Virtual line width
set colorcolumn=72,81 " Vertical ruler at 71 characters

" Information
set showcmd           " Show (partial) command in status line.
set showmode          " Show the current mode
set laststatus=2      " always show status line

" Statusline
set statusline=%.27F
set statusline+=%{FugitiveStatus()}
" set statusline+=%{StatuslineCurrentHighlight()}
set statusline+=%=
set statusline+=%m
set statusline+=\ %Y
set statusline+=\ %3l/%L[%3p%%]

" Navigation
set nu                " Set line numbering
set scrolloff=5       " keep at least 5 lines above/below
set mouse=a           " Enable mouse usage (all modes)
set mousehide         " Hide the mouse when typing
set cursorline        " Highlights the cursor line

" Searching
set ignorecase        " Do case insensitive matching
set smartcase         " Do smart case matching
set incsearch         " Incremental search
set hlsearch          " highlight searches
set showmatch         " Show matching brackets.

" Tabs (spacing)
set expandtab         " Use spaces instead of tabs
set tabstop=4         " How many spaces a tab measures
set shiftwidth=4      " Sets >> and << width
set autoindent
set list              " Show hidden characters: tabs, trails
set listchars=trail:·,tab:››

" Folding
set foldenable        " Enables folds
" set foldcolumn=1      " Shows folds in a column
set foldmethod=indent " Folds on indentation
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Backups
set nobackup          " Remove backup files
set noswapfile        " Remove swap files

" Change the <leader> key to ,
let mapleader=","

" External Pasting and Copying options
set pastetoggle=<C-x> " Toggles pasting mode for external paste
nnoremap <leader>n  :set nu!<CR>:set foldenable!<CR><C-x>

"--------------------------------------------------------------------"
" "Filetypes"                                                        "
"--------------------------------------------------------------------"

au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.tex set filetype=tex


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
nnoremap H          g^
nnoremap L          g$
nnoremap ^          g0
nnoremap 0          g^
nnoremap {          <C-u>
nnoremap }          <C-d>
nnoremap cc         :set cursorcolumn!<CR>

" Remembers last place before jump
nnoremap ''         <C-O>
nnoremap '          `

" Centers screen around cursor
nnoremap <space>    zz
nnoremap n          nzz
nnoremap N          Nzz

" Tabs (navigation)
nnoremap tt         :tabm 
nnoremap tl         gt
nnoremap th         gT
nnoremap td         :tabclose<CR>

" Indent/Unident quicker
nnoremap <          <<
nnoremap >          >>

" Yanking
nnoremap Y          v$y
nnoremap gy         "+yy


"--------------------------------------------------------------------"
" "Insert Mode Bindings"                                             "
"--------------------------------------------------------------------"


" Easier window switching keys
inoremap <C-j>  <esc><C-w>j
inoremap <C-k>  <esc><C-w>k
inoremap <C-l>  <esc><C-w>l
inoremap <C-h>  <esc><C-w>h


"--------------------------------------------------------------------"
" "Visual Mode Bindings"                                             "
"--------------------------------------------------------------------"

vnoremap < <gv
vnoremap > >gv
vnoremap gy "+y

"--------------------------------------------------------------------"
" "Command Mode Bindings"                                            "
"--------------------------------------------------------------------"

" Aliasing accidental shifts
cnoreabbrev W      w
cnoreabbrev Q      q
cnoreabbrev Qa     qa
cnoreabbrev X      x
cnoreabbrev sh     sh
cnoreabbrev Sh     sh
cnoreabbrev sH     sh
cnoreabbrev SH     sh

" Fugitive
nnoremap <leader>gs     :Gstatus<CR>
nnoremap <leader>gc     :Gcommit -m "
function! FugitiveStatus()
    let branch = fugitive#head()
    if !empty(branch)
        let branch = " [" . branch . "] "
    endif
    return branch
endfunction

"--------------------------------------------------------------------"
" "Unite"                                                            "
"--------------------------------------------------------------------"

let g:unite_winwidth = 30
let g:unite_winheight = 10
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])

" nnoremap <silent><leader>r  :Unite -start-insert file_rec/async:!<CR>
nnoremap <silent><leader>m  :Unite -start-insert file_mru<CR>
nnoremap <silent><leader>b  :Unite buffer<CR>
nnoremap <silent><leader>f  :Unite grep:.<CR>
nnoremap <silent><leader>y  :Unite history/yank<CR>

" Custom mappings for unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    nnoremap <silent><buffer><expr> s unite#do_action('right')
    nnoremap <silent><buffer><expr> i unite#do_action('below')
endfunction!

"--------------------------------------------------------------------"
" "Ctrl-P"                                                           "
"--------------------------------------------------------------------"

nnoremap <silent><leader>p :CtrlP<CR>
let g:ctrlp_working_path_mode = 'ra'

"--------------------------------------------------------------------"
" "NERDTree"                                                         "
"--------------------------------------------------------------------"

nnoremap <tab> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1     " Show bookmarks by default
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif


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

nnoremap <leader>s     :ConqueTermSplit 
let g:ConqueTerm_SendVisKey = '<F2>'  " Copies selected test into shell
let g:ConqueTerm_SendFileKey = '<F3>' " Copies file into shell
let g:ConqueTerm_PromptRegex = '^>>>'

"--------------------------------------------------------------------"
" "GUndo"                                                            "
"--------------------------------------------------------------------"

nnoremap <leader>u :GundoToggle<CR>

"--------------------------------------------------------------------"
" "Taglist"                                                          "
"--------------------------------------------------------------------"

nnoremap <leader>o :TlistToggle<CR>
let Tlist_Exit_OnlyWindow = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Sort_Type = "name"

"--------------------------------------------------------------------"
" "Syntax Highlighting utility"                                      "
"--------------------------------------------------------------------"
function! StatuslineCurrentHighlight()
    let name = synIDattr(synID(line('.'),col('.'),1),'name')
    if name == ''
        return ''
    else
        return '[' . name . ']'
    endif
endfunction
