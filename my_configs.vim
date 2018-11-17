" Colors
source ~/.vim_runtime/vimrcs/colors.vim

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

nnoremap \ /\v

"   make backspace actually backspace in normal mode
nnoremap <BS> i<Left><Del><Right><Esc>

" search with zeal
nnoremap gz :call system('zeal "<cword>"&')<CR><CR>

set encoding=UTF-8
