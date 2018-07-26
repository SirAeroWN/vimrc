nnoremap <leader>gg :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <leader>gg :<c-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
       execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen

    let @@ = saved_unnamed_register
endfunction


nnoremap <leader>y :set operatorfunc=<SID>RemoveLeading<cr>g@
vnoremap <leader>y :<c-u>call <SID>RemoveLeading(visualmode())<cr>

function! s:RemoveLeading(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
       execute "normal! `<v`>y"
    elseif a:type ==# 'V'
        execute "normal! `<V`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    let l:lst = []
    let l:seen = 0
    for l:v in split(@@, ", ")
        if l:seen == 0
            if l:v != 0
                let l:seen = 1
                call add(l:lst, l:v)
            endif
        else
            call add(l:lst, l:v)
        endif
    endfor

    echo l:lst

    let l:str = join(l:lst, ", ")

    let @@ = l:str
    if a:type ==# 'v'
       execute "normal! `<v`>p"
    elseif a:type ==# 'V'
        execute "normal! `<V`>p"
    elseif a:type ==# 'char'
        execute "normal! `[v`]p"
    else
        return
    endif

    let @@ = saved_unnamed_register
endfunction
