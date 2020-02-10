" Author: Joker
" Last Change: 2019 Mar 18

" useful to see syntax group under cursor
"nnoremap <F11> :echo synIDattr(synID(line('.'),col('.'),0),'name')<CR>
"nnoremap <C-F11> :echo synIDattr(synIDtrans(synID(line('.'),col('.'),0)),'name')<CR>

augroup DebugHelper
    autocmd!
    autocmd Syntax c,cpp call s:SetDEBUG()
augroup END

function! s:SetDEBUG()
	syntax match myDebug "\V/*$*/" conceal
	hi myDebug guifg=grey30
	setlocal conceallevel=2 concealcursor=n
	inoremap <buffer> ` /*$*/
	nnoremap <buffer> <leader>g A	/*$*/<ESC>5h
	nnoremap <buffer> <F9> :se cole=0<CR>/\V\/*$*\/<CR>
	nnoremap <buffer> <S-F9> :se cole=2<CR>
endfunction
