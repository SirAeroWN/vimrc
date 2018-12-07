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
" => JavaScript section
"""""""""""""""""""""""""""""""
augroup filetype_js
    autocmd!
    au FileType javascript call JavaScriptFold()
    au FileType javascript setl fen
    au FileType javascript setl nocindent

    au FileType javascript imap <c-t> $log();<esc>hi
    au FileType javascript imap <c-a> alert();<esc>hi

    au FileType javascript inoremap <buffer> $r return 
    au FileType javascript inoremap <buffer> $f // --- PH<esc>FP2xi

    function! JavaScriptFold() 
        setl foldmethod=syntax
        setl foldlevelstart=1
        syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

        function! FoldText()
            return substitute(getline(v:foldstart), '{.*', '{...}', '')
        endfunction
        setl foldtext=FoldText()
    endfunction
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
   " autocmd FileType md,markdown,txt colorscheme palenight
   " autocmd FileType md,markdown,txt set g:lightline.colorscheme='palenight'
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
" => Prolog section
""""""""""""""""""""""""""""""
augroup filetype_prolog
    autocmd!

    au BufNewFile,BufRead *.pro setlocal syntax=prolog
    au BufNewFile,BufRead *.pro setlocal filetype=prolog
augroup END
