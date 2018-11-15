" Author: Joker
" Last Change: 2018 Nov 13
" for practice

nnoremap <leader>g :set operatorfunc=<SID>GrepOperator<CR>g@
vnoremap <leader>g :<C-U>call <SID>GrepOperator(visualmode())<CR>

function! s:GrepOperator(type)
	let sel_save = &selection
	let &selection = "inclusive"
	let reg_save = @@

	if a:type ==# 'v'
		normal! gvy
	elseif a:type ==# 'char'
		normal! `[v`]y
	else
		return
	endif
	silent exe 'grep! "' . @@ . '" a.py'
	copen 3

	let &selection = sel_save
	let @@ = reg_save
endfunction
