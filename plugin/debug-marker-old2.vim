" Author: Joker
" Last Change: 2019 Mar 15

" useful to see syntax group under cursor
nnoremap <F11> :echo synIDattr(synID(line('.'),col('.'),0),'name')<CR>
nnoremap <C-F11> :echo synIDattr(synIDtrans(synID(line('.'),col('.'),0)),'name')<CR>

augroup DebugHelper
    autocmd!
    autocmd Syntax c,cpp call s:SetDEBUG()
augroup END

function! s:SetDEBUG()
	if exists('s:done')
		return
	endif

	if matchadd('Conceal', '\V/*$*/', 10, 8) <= 0
		echom 'Set DEBUG fail'
		return
	endif
	let s:done = 1

	setl conceallevel=2 concealcursor=n
	inoremap ` /*$*/
	nnoremap <leader>g A	/*$*/<ESC>5h
	nnoremap <F9> :call matchdelete(8)<CR>/\/\*\$\*\/<CR>
	nnoremap <S-F9> :call matchadd('Conceal','\V/*$*/',16,8)<CR>
endfunction
