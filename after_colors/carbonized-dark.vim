"=== SET CARBONIZED COLOUR VARIABLES =====================================================

" GUI colours
let s:g0 = '2b2b2b'
let s:g1 = '3b3b37'
let s:g2 = '75756e'
let s:g3 = '8a8a81'
let s:g4 = '9e9e95'
let s:g5 = 'b5b5aa'
let s:g6 = 'f0f0e1'
let s:g7 = 'fffff0'
let s:g8 = 'bf5858'
let s:g9 = 'b56f45'
let s:gA = 'ab8e38'
let s:gB = '508a50'
let s:gC = '458a8a'
let s:gD = '557b9e'
let s:gE = '8b6a9e'
let s:gF = 'ab6a7a'

" terminal colours
let s:t0 = '00'
let s:t3 = '08'
let s:t5 = '07'
let s:t7 = '15'
let s:t8 = '01'
let s:tA = '03'
let s:tB = '02'
let s:tC = '06'
let s:tD = '04'
let s:tE = '05'
let s:t1 = '10'
let s:t2 = '11'
let s:t4 = '12'
let s:t6 = '13'
let s:t9 = '09'
let s:tF = '14'

" carbonized highlighting function
fun! <sid>h(x, gf, gb, cf, cb, a, s)
  if a:gf != '' | exe 'hi ' . a:x . ' guifg=#'  . a:gf                  | endif
  if a:gb != '' | exe 'hi ' . a:x . ' guibg=#'  . a:gb                  | endif
  if a:cf != '' | exe 'hi ' . a:x . ' ctermfg=' . a:cf                  | endif
  if a:cb != '' | exe 'hi ' . a:x . ' ctermbg=' . a:cb                  | endif
  if a:a  != '' | exe 'hi ' . a:x . ' gui='     . a:a . ' cterm=' . a:a | endif
  if a:s  != '' | exe 'hi ' . a:x . ' guisp=#'  . a:s                   | endif
endfun
cal <sid>h('FoldColumn'           , s:g4 , s:g0 , s:t4 , s:t0 , 'none'      , ''  )
