" Vim plugin for inserting tag under cursor
" Maintainer: vogrez
" License: This file is placed in the public domain.
let s:save_cpo = &cpo
set cpo&vim
if exists("g:loaded_typecorr")
        finish
endif
let g:loaded_typecorr = 1


if !hasmapto('<Plug>TypecorrAdd')
        map <unique> <Leader>a  <Plug>TagUnderInsert
endif


noremap <unique> <script> <Plug>TagUnderInsert  <SID>TagInsert

noremenu <script> Plugin.Insert\ Tag      <SID>TagInsert

noremap <SID>TagInsert  :call <SID>TagInsert(expand("<cword>"))<CR>

function s:TagInsert(from)
        let list = taglist(a:from)
        let item = get(list, 0, {})
        if has_key(item, "signature")
                echo item["signature"]
        endif
endfunction

let &cpo = s:save_cpo
