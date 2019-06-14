scriptencoding utf-8
""""""""""""""""""""""""""""""
" => Load pathogen paths
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h').'/..'
call plug#begin(s:vim_runtime.'/plugs')
" plugins
" linter
Plug 'w0rp/ale'

" file and buffer navi
Plug 'corntrace/bufexplorer'
Plug 'yegappan/mru'
Plug 'junegunn/fzf',  { 'dir': '~/.fzf' }
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
if has("win16") || has("win32")
    Plug 'OmniSharp/omnisharp-vim'
endif

" motions
Plug 'easymotion/vim-easymotion'

" repl

" language specific
Plug 'nvie/vim-flake8'
Plug 'tpope/vim-markdown'

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
" => Omnisharp plugin
""""""""""""""""""""""""""""""
if has("win16") || has("win32")
    let g:OmniSharp_server_path = 'D:\casa\Vim\omnisharp.http-win-x64\OmniSharp.exe'
    let g:OmniSharp_selector_ui = 'fzf'
    set completeopt=longest,menuone
    augroup omnisharp_commands
        autocmd!
        autocmd CursorHold *.cs call OmniSharp#TypeLookupWithoutDocumentation()
        autocmd FileType cs nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
    augroup END
    " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
    nnoremap <Leader>a :OmniSharpGetCodeActions<CR>
    xnoremap <Leader>a :call OmniSharp#GetCodeActions('visual')<CR>

    " Rename with dialog
    nnoremap <Leader>nm :OmniSharpRename<CR>
endif


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']


""""""""""""""""""""""""""""""
" => FZF
""""""""""""""""""""""""""""""
map <leader>j :FZF<cr>
map <c-b> :Buffers<cr>


""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => netrw
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:netrw_liststyle = 3
let g:netrw_banner = 0
map <leader>nn :Explore<cr>
map <leader>nv :Vexplore!<cr>


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