"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Will Norvelle     — @SirAeroWN
"       Amir Salihefendic — @amix3k (former)
"
" Sections:
"    -> Plugins
"    -> General
"    -> VIM user interface
"    -> GUI related
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Visual mode related
"    -> Moving around, tabs and buffers
"    -> Status line
"    -> Editing mappings
"    -> vimgrep searching and cope displaying
"    -> Spell checking
"    -> Filetypes
"    -> Misc
"    -> Helper functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "\<space>"

" Fast actions
nmap <leader>w :w!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>x :x<cr>

" :W sudo saves the file 
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Do vim-plug things
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')
call plug#begin(s:vim_runtime.'/plugs')
" linter
Plug 'w0rp/ale'

" file and buffer navigation
Plug 'corntrace/bufexplorer'
Plug 'yegappan/mru'
Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'

" paste stuff
Plug 'maxbrunsfeld/vim-yankstack'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" commenting
Plug 'tpope/vim-commentary'

" other
Plug 'tpope/vim-repeat'

" dependencies
Plug 'vim-scripts/tlib'
Plug 'MarcWeber/vim-addon-mw-utils'

" autocomplete

" motions
Plug 'easymotion/vim-easymotion'

" repl

" language specific
Plug 'nvie/vim-flake8',  { 'for': 'python' }
Plug 'tpope/vim-markdown',  { 'for': 'markdown'   }

" colorschemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/AfterColors.vim'

" non colorscheme visual things
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'
Plug 'junegunn/goyo.vim'

call plug#end()


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
noremap <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
noremap <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']


""""""""""""""""""""""""""""""
" => FZF
""""""""""""""""""""""""""""""
nnoremap <leader>j :FZF<cr>
noremap <c-b> :Buffers<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_liststyle = 3
let g:netrw_banner = 0
noremap <leader>nn :Explore<cr>
noremap <leader>nv :Vexplore!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Goyo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:goyo_width=120
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2
nnoremap <silent> <leader>z :Goyo<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['jshint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck'],
\   'cs': ['Omnisharp']
\}

nmap <silent> <leader>a <Plug>(ale_next_wrap)

let g:ale_lint_delay = 2000
let g:ale_lint_on_enter = 0
nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=0
nnoremap <silent> <leader>d :GitGutterToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => commentary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType autohotkey setlocal commentstring=;\ %s


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j/k
set scrolloff=7

" Set 5 cols to the cursor - when moving horizontally using h/l
set sidescrolloff=5

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' 
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the Wild menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*/.DS_Store

"Always show current position
set ruler

" Height of the command bar
set cmdheight=2

" A buffer becomes hidden when it is abandoned
set hidden

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch 

" Don't redraw while executing macros (good performance config)
set lazyredraw 

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch 

" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500

" Add a bit extra margin to the left
set foldcolumn=1

" show line numbers
set number

" new horizontal spits show up at the bottom
set splitbelow

" new vertical splits show up on the right
set splitright

" 'merica spelling ~~sometimes~~
set spelllang=en_us

" usually what's wanted, ya know
set encoding=UTF-8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" no Vim, I'LL do the formatting, thank you
set formatoptions-=tc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set font according to system
if has("mac") || has("macunix")
    set gfn=Hack:h14,IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h15,Menlo:h15
elseif has("win16") || has("win32")
    set gfn=Hack:h10,IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
elseif has("gui_gtk2")
    set gfn=:Hack\ 14,IBM\ Plex\ Mono:h14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("linux")
    set gfn=:Hack\ 14,IBM\ Plex\ Mono:h14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
elseif has("unix")
    set gfn=Monospace\ 11
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM ==? 'gnome-terminal'
    set t_Co=256
endif

if (has('termguicolors'))
  set termguicolors
endif

set background=dark

" use gruvbox if we can, but fall back to desert if we have to
try
    let g:lightline.colorscheme = 'gruvbox'
    let g:gruvbox_italic=1
    colorscheme gruvbox
catch
endtry


" Set extra options when running in GUI mode
if has('gui_running')
    set guioptions-=r
    set guioptions-=R
    set guioptions-=l
    set guioptions-=L
    set guioptions-=T
    set guioptions-=e
    set guioptions-=m
    set t_Co=256
    set guitablabel=%M\ %t
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowritebackup
set noswapfile

" Turn persistent undo on, means that you can undo even when you close a buffer/VIM
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set autoindent "Auto indent
set wrap "Wrap lines


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" make deletions in insert mode undouable
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/

" opens a split with the current buffer's path
map <leader>s :vsplit <c-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers 
try
  set switchbuf=useopen,usetab,newtab
  set showtabline=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line in the event that lightline doesn't work/not installed
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l\ \ Column:\ %c


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character or beginning of line
noremap <silent> 0 :call FirstCharOrFirstCol()<cr>

" insert mode maps
inoremap jj <Esc>
inoremap jk <Esc>
inoremap hj <Esc>

" normal mode remaps
"   the Xzz makes the view center on the cursor after the X movement
nnoremap j jzz
nnoremap k kzz

nnoremap n nzz
nnoremap N Nzz

" H and L move to the beginning and end of the current line, respectively
nnoremap H :call FirstCharOrFirstCol()<cr>
nnoremap L $

" very magic searching
nnoremap \ /\v

" for easily triggering a macro in the q register
" also because fuck unremapped Q
nnoremap Q @q

" toggle paste mode
nnoremap <leader><leader>p :set paste!<cr>

if has('mac') || has('macunix')
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos('.')
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has('autocmd')
    autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
augroup filetype_py
    autocmd!

    let python_highlight_all = 1
    au FileType python syn keyword pythonDecorator True None False self

    au FileType python set cindent
    au FileType python set cinkeys-=0#
    au FileType python set indentkeys-=0#
augroup END


""""""""""""""""""""""""""""""
" => Text files section
"""""""""""""""""""""""""""""""
augroup text_files
   autocmd!
    " change the previous header
   autocmd FileType md,markdown,txt onoremap ih :<c-u>execute "normal! ?^[-=]\\{2,}\\+$\r:nohlsearch\rkvg_"<cr>
    " set indent level to be 2 spaces in markdown
   autocmd FileType md,markdown,txt setlocal shiftwidth=2
   autocmd FileType md,markdown,txt setlocal tabstop=2
    " do spelling for markdown
   autocmd FileType md,markdown,txt setlocal spell
   autocmd BufNewFile,BufRead *.md,*.markdown,*.txt setlocal spell
    " autocomplete english
   autocmd FileType md,markdown,txt setlocal complete+=kspell
augroup END


""""""""""""""""""""""""""""""
" => Shell section
"""""""""""""""""""""""""""""""
augroup filetype_sh
   autocmd!
    " treat files without an extension as shell **sorta works?
   autocmd BufNewFile,BufRead * if &syntax == '' | set syntax=sh | endif
    " set indent level to be 2 spaces in shell scripts
   autocmd FileType sh setlocal shiftwidth=2
   autocmd FileType sh setlocal tabstop=2
augroup END


""""""""""""""""""""""""""""""
" => netrw section
""""""""""""""""""""""""""""""
augroup netrw_mapping
    autocmd!
    autocmd FileType netrw call NetrwMapping()
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    endif
    return ''
endfunction

func! GetScriptNumber(script_name)
    " Return the <SNR> of a script.
    "
    " Args:
    "   script_name : (str) The name of a sourced script.
    "
    " Return:
    "   (int) The <SNR> of the script; if the script isn't found, -1.

    redir => scriptnames
    silent! scriptnames
    redir END

    for script in split(l:scriptnames, '\n')
        if l:script =~ a:script_name
            return str2nr(split(l:script, ':')[0])
        endif
    endfor

    return -1
endfunc

function! NetrwMapping()
    noremap <buffer> o :<C-U>call eval(printf("netrw#LocalBrowseCheck(<SNR>%d_NetrwBrowseChgDir(1,<SNR>%d_NetrwGetWord()))", GetScriptNumber('netrw.vim'), GetScriptNumber('netrw.vim')))<CR>
    noremap <buffer> q :Rexplore<CR>
endfunction

" going to the first character is usually what is wanted, unless that's where you already are
function! FirstCharOrFirstCol()
    let current_col = virtcol('.')
    normal! ^
    let first_char = virtcol('.')
    if current_col <= first_char
        normal! 0
    endif
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr('%')
    let l:alternateBufNum = bufnr('#')

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr('%') == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute('bdelete! '.l:currentBufNum)
    endif
endfunction

function! CmdLine(str)
    call feedkeys(':' . a:str)
endfunction 

function! VisualSelection(direction, extra_filter) range
    let l:saved_reg = @'
    execute 'normal! vgvy'

    let l:pattern = escape(@", "\\/.*'$^~[]")
    let l:pattern = substitute(l:pattern, '\n$', '', '')

    if a:direction ==# 'gv'
        call CmdLine("Ack '" . l:pattern . "' " )
    elseif a:direction ==# 'replace'
        call CmdLine('%s' . '/'. l:pattern . '/')
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction
