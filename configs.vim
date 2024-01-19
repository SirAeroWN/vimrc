"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: 
"       Will Norvelle     — @SirAeroWN
"       Amir Salihefendic — @amix3k (former)
"
" Sections:
"    -> General
"    -> Tags
"    -> VIM user interface
"    -> GUI related
"    -> Colors and Fonts
"    -> Files, backups, and undo
"    -> Text, tab, and indent related
"    -> Visual mode related
"    -> Moving around, tabs, and buffers
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

" competion options
set completeopt=menu,menuone,noinsert,noselect,longest

set nofixendofline

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

if has('nvim') && has('win32')
    let g:python3_host_prog = 'C:\Users\wnorvelle\AppData\Local\Programs\Python\Python37\python.exe'
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./tags;


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
"set number
" show relative line numbers with the absolute number at the cursor line
set number relativenumber

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
if !has("nvim")
    if has("mac") || has("macunix")
        set guifont=Hack:h14,IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h15,Menlo:h15
    elseif has("win16") || has("win32")
        set guifont=Hack:h10,IBM\ Plex\ Mono:h14,Source\ Code\ Pro:h12,Bitstream\ Vera\ Sans\ Mono:h11
    elseif has("gui_gtk2")
        set guifont=Hack\ 14,IBM\ Plex\ Mono:h14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
    elseif has("linux")
        set guifont=:Hack\ 14,IBM\ Plex\ Mono:h14,Source\ Code\ Pro\ 12,Bitstream\ Vera\ Sans\ Mono\ 11
    elseif has("unix")
        set guifont=Monospace\ 11
    endif
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable 

" Enable 256 colors palette in Gnome Terminal
if $COLORTERM ==? 'gnome-terminal'
    " set t_Co=256
endif

if (has('termguicolors'))
  set termguicolors
endif

" set t_Co=256
let &t_AB="\e[48;5;%dm"
let &t_AF="\e[38;5;%dm"

set background=dark


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

" This MUST come after all the other cursor and color settings
let &t_SI.="\e[5 q"  "t_SI = Start INSERT mode
let &t_SR.="\e[4 q"  "t_SR = Start REPLACE mode
let &t_EI.="\e[1 q"  "t_EI = End Insert mode - usually starts NORMAL mode
let &t_te.="\e[0 q"  " Reset the cursor to whatever the console was using


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
" => Text, tab, and indent related
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

set nojoinspaces


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" => Filetypes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => cake section
""""""""""""""""""""""""""""""
augroup cake_files
    autocmd!
    autocmd BufNewFile,BufRead *.cake setlocal filetype=cs
augroup END

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


""""""""""""""""""""""""""""""
" => Git Commit section
""""""""""""""""""""""""""""""
augroup git_commit_message
    autocmd!
    autocmd FileType gitcommit setlocal spell
    autocmd FileType gitcommit setlocal complete+=kspell
    autocmd BufReadPost * if &filetype == 'gitcommit' | :execute ":normal! ggA" | endif
augroup END


""""""""""""""""""""""""""""""
" => Ember.js section
""""""""""""""""""""""""""""""
augroup ember
    autocmd!
    autocmd BufReadPost *.hbs setlocal iskeyword+=-
augroup END


""""""""""""""""""""""""""""""
" => CSS section
""""""""""""""""""""""""""""""
augroup css
    autocmd!
    autocmd filetype css,scss setlocal iskeyword+=-
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => User functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command Debug call Pause_test_debug()
function! Pause_test_debug()
    let saved_pos = getpos('.') "[bufnum,line,col,off]
    let line = saved_pos[1]
    let col = saved_pos[2]
    let off = saved_pos[3]

    normal! oreturn pauseTest();// unique string plz kill

    if search("import { pauseTest } from '@ember/test-helpers';// unique string plz kill", 'nw') == 0
        normal! 1GOimport { pauseTest } from '@ember/test-helpers';// unique string plz kill
    endif

    call cursor(line+1, col, off)
endfunction

command Clean call Clean_debug()
function! Clean_debug()
    let saved_pos = getpos('.') "[bufnum,line,col,off]
    let line = saved_pos[1]
    let col = saved_pos[2]
    let off = saved_pos[3]

    global#// unique string plz kill#d
    
    call cursor(line-1, col, off)
endfunction

command Test call Hermes_run("test")

command Build call Hermes_run("build")

function! Hermes_run(switch)
    if has("win16") || has("win32")
        let path = "C:\Users\wnorvelle\Code\vim_hermes_client\client.py"
    else
        let path = "/mnt/c/Users/wnorvelle/Code/vim_hermes_client/client.py"
    endif
    execute "silent !python3.8 " . path . " --" . a:switch . " " . expand('%:p')
endfunction


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
