"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Do vim-plug things
""""""""""""""""""""""""""""""
let s:vim_runtime = expand('<sfile>:p:h')
call plug#begin(s:vim_runtime.'/plugs')
" linter
Plug 'dense-analysis/ale'

" file and buffer navigation
Plug 'jlanzarotta/bufexplorer'
Plug 'yegappan/mru'
Plug 'junegunn/fzf',  { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-vinegar'

" paste stuff

" neovim specific
if has("nvim")
  Plug 'markonm/traces.vim'
endif

" git
Plug 'itchyny/vim-gitbranch'

" commenting
Plug 'tpope/vim-commentary'

" other
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'chrisbra/NrrwRgn'

" autocomplete
if has("nvim")
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/neco-syntax'
  Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
  Plug 'deoplete-plugins/deoplete-jedi'
else
  Plug 'https://gitlab.com/yramagicman/auto-omnicomplete.git'
endif

" motions
Plug 'easymotion/vim-easymotion'
Plug '~/lib/jumpy.vim'

" repl

" language specific
Plug 'nvie/vim-flake8',  { 'for': 'python' }
Plug 'tpope/vim-markdown',  { 'for': 'markdown' }
Plug 'sheerun/vim-polyglot'

" colorschemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'severij/vadelma'
Plug 'vim-scripts/AfterColors.vim'

" non colorscheme visual things
Plug 'itchyny/lightline.vim'
Plug 'mhinz/vim-startify'

" dependencies
Plug 'vim-scripts/tlib'
Plug 'MarcWeber/vim-addon-mw-utils'

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
nnoremap <leader>f :MRU<CR>


""""""""""""""""""""""""""""""
" => FZF
""""""""""""""""""""""""""""""
nnoremap <leader>j :FZF<cr>
nnoremap <leader>/ :Rg<cr>
nnoremap <leader>L :Lines<cr>
nnoremap <leader>H :Helptags!<cr>
nnoremap <leader>B :Buffers<cr>
nmap <leader><tab> <plug>(fzf-maps-n)
imap <c-x><c-k> <plug>(fzf-complete-word)
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-q': 'vsplit' }


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
      \             ['gitbranch', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFileName',
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

function! LightlineFileName()
  let full_filename = @%
  if len(full_filename) <= 70
    return full_filename
  else
    let l = len(full_filename)
    let i = 0
    let split_name = split(full_filename, '/')
    while (l > 70 && i < len(split_name))
      let l = l - len(split_name[i])
      let i = i + 1
    endwhile
    return join(split_name[i:], '/')
  endif
  return '[No Name]'
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['flake8'],
\   'go': ['go', 'golint', 'errcheck'],
\   'html.handlebars': ['/home/wnorvelle/.nvm/versions/node/v10.16.3/bin/ember-template-lint']
\}

let g:ale_lint_delay = 100
let g:ale_lint_on_enter = 1
nmap <silent> <C-p> <Plug>(ale_previous_wrap)
nmap <silent> <C-n> <Plug>(ale_next_wrap)
nmap <silent> <leader>a <Plug>(ale_next_wrap)


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => commentary
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType autohotkey setlocal commentstring=;\ %s
autocmd FileType html.handlebars setlocal commentstring={{!--\ %s\ --}}


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
  if (has('termguicolors'))
    set termguicolors
  endif
    let g:lightline.colorscheme = 'gruvbox'
    let g:gruvbox_contrast_dark = 'hard'
    let g:gruvbox_italic=1
    let g:gruvbox_improved_strings = 1
    colorscheme gruvbox
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vadelma
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" try
"   if (has('termguicolors'))
"     set termguicolors
"   endif
"     let g:lightline.colorscheme = 'vadelma'
"     colorscheme vadelma
" catch
" endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('win32') || has('win16')
  let g:startify_bookmarks = [{'v': 'C:\casa\.vim_runtime\vimrc.vim'},
                            \ {'s': 'C:\Users\wnorvelle\Documents\scratch.md'},
                            \ {'m': 'C:\FALCOR\software\Websites\Web\customer-ember'}
                            \ ]
else
  let g:startify_bookmarks = [{'v': '/mnt/c/casa/.vim_runtime/vimrc.vim'},
                            \ {'s': '/mnt/c/Users/wnorvelle/Documents/scratch.md'},
                            \ {'m': '/mnt/c/FALCOR/software/Websites/Web/customer-ember'}
                            \ ]
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Polyglot
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" polyglot
let g:polyglot_disabled = ['markdown', 'python-indent']

" polyglot's sub packages
let g:javascript_plugin_jsdoc = 1
let g:python_highlight_all = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => auto-omnicomplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !has("nvim")
  let g:AutoOmniComplete_complete_map = "\<c-n>"
  let g:AutoOmniComplete_tab = 0
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")
  let g:deoplete#enable_at_startup = 1
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => traces.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("nvim")
  let g:traces_substitute_preview = 0 
  let g:traces_num_range_preview = 1
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => matchit.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
runtime! macros/matchit.vim


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => LanguageClient
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['/home/wnorvelle/.nvm/versions/node/v10.16.3/bin/javascript-typescript-stdio'],
    \ 'css': ['/home/wnorvelle/.nvm/versions/node/v10.16.3/bin/css-languageserver', 'stdio'],
    \ 'scss': ['/home/wnorvelle/.nvm/versions/node/v10.16.3/bin/css-languageserver', 'stdio']
    \ }
nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap gd :call LanguageClient#textDocument_definition()<CR>