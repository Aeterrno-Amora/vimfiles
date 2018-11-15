" Author: Joker
" Last Change: 2018 Nov 14
" for practicing

setlocal foldmethod=expr
setlocal foldexpr=GetPotionFold(v:lnum)

function! GetPotionFold(lnum)
	if getline(a:lnum) =~ '\v^\s*$'
		return '-1'
	endif
	let this = s:IndentLevel(a:lnum)
	let next = s:IndentLevel(s:NextNonBlankLine(a:lnum))
	if (next <= this)
		return this
	else
		return '>' . next
	endif
endfunction

function! s:IndentLevel(lnum)
	return indent(a:lnum) / &shiftwidth
endfunction

function! s:NextNonBlankLine(lnum)
	let n = line('$')
	let x = a:lnum + 1
	while x <= n
		if getline(x) =~ '\v\S'
			return x
		endif
		let x += 1
	endwhile
endfunction
