set number
set hidden

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

augroup filetype_md
   autocmd!
    " change the previous header
   autocmd FileType md onoremap ih :<c-u>execute "normal! ?^[-=]\\{2,}\\+$\r:nohlsearch\rkvg_"<cr>
    " set indent level to be 2 spaces in markdown
   autocmd FileType md setlocal shiftwidth=2
   autocmd FileType md setlocal tabstop=2
augroup END

augroup filetype_markdown
   autocmd!
    " change the previous header
   autocmd FileType markdown onoremap ih :<c-u>execute "normal! ?^[-=]\\{2,}$\r:nohlsearch\rkvg_"<cr>
    " set indent level to be 2 spaces in markdown
   autocmd FileType markdown setlocal shiftwidth=2
   autocmd FileType markdown setlocal tabstop=2
augroup END


" grep operator
set grepprg=/usr/bin/grep
" nnoremap <leader>gg :silent execute "grep! -R " . shellescape(expand("<cWORD>")) . " ."<cr>:copen<cr>
source ~/.vim_runtime/my_plugins/grep-operator.vim

set background=dark
" colorscheme sublimemonokai
colorscheme palenight
let g:lightline.colorscheme = 'palenight'
" colorscheme dracula
if (has("termguicolors"))
  set termguicolors
endif
