set number
set hidden
set splitbelow
set splitright

set spelllang=en_us

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

nnoremap H Hzz
nnoremap L Lzz

"   make backspace actually backspace in normal mode
nnoremap <BS> i<Left><Del><Right><Esc>
inoremap <C-BS> <C-w>
set backspace=indent,eol,start

"   quicker quit
nnoremap <leader>q :q<cr>
nnoremap <leader>x :x<cr>

"   filetype autogroups
augroup filetype_sh
   autocmd!
    " treat files without an extension as shell **sorta works?
   autocmd BufNewFile,BufRead * if &syntax == '' | set syntax=sh | endif
    " set indent level to be 2 spaces in shell scripts
   autocmd FileType sh setlocal shiftwidth=2
   autocmd FileType sh setlocal tabstop=2
augroup END

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
   autocmd FileType md,markdown,txt colorscheme palenight
augroup END

augroup filetype_py
    autocmd!
    let python_highlight_all=1
    syntax on
    "python with virtualenv support
    python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
augroup END


" Colors
set background=dark
if (has("termguicolors"))
  set termguicolors
endif

" colorscheme sublimemonokai

" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

" colorscheme palenight
" let g:lightline.colorscheme = 'palenight'

" colorscheme dracula

" let g:gruvbox_italic=1
" colorscheme gruvbox

" let g:lightline.colorscheme = 'onedark'
" let g:onedark_terminal_italics = 1
" colorscheme onedark
" 
" let g:nord_italic = 1
" let g:nord_underline = 1
" let g:nord_italic_comments = 1
" colorscheme nord

" colorscheme peaksea

" let g:carbonized_dark_FoldCol = 'off'
let g:carbonized_dark_LineNr = 'off'
let g:lightline.colorscheme = 'carbonized_dark'
colorscheme carbonized-dark
