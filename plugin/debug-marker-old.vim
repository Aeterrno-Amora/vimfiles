" Author: Joker
" Last Change: 2019 Mar 14

" useful to see syntax group under cursor
nnoremap <F11> :echo synIDattr(synID(line('.'),col('.'),0),'name')<CR>
nnoremap <C-F11> :echo synIDattr(synIDtrans(synID(line('.'),col('.'),0)),'name')<CR>

augroup DebugHelper
    autocmd!
    autocmd Syntax c,cpp call s:SetDEBUG()
augroup END

function! s:SetDEBUG()
	iabbrev jjj /*DEBUG*/
	nnoremap <leader>jjj A	/*DEBUG*/<ESC>

	syn keyword	myDebug		DEBUG
	syn region  cCommentL	start="//" skip="\\$" end="$" keepend contains=@cCommentGroup,cComment2String,cCharacter,cNumbersCom,cSpaceError,@Spell,myDebug
	syn region	cComment	matchgroup=cCommentStart start="/\*" end="\*/" contains=@cCommentGroup,cCommentStartError,cCommentString,cCharacter,cNumbersCom,cSpaceError,@Spell,myDebug fold extend
	hi link myDebug cComment
	let s:idDEBUG = hlID('myDebug')
	let s:idComment = synIDtrans(hlID('Comment'))

	nnoremap <leader>nd /DEBUG<CR>
	nnoremap <F12> :call <SID>SwitchDEBUG()<CR>
endfunction

function! s:SearchDEBUG()
	if synIDtrans(s:idDEBUG) == s:idComment
		hi link myDebug Error
	endif
	norm '/DEBUG'
endfunction

function! s:SwitchDEBUG()
	if synIDtrans(s:idDEBUG) == s:idComment
		hi link myDebug Error
	else
		hi link myDebug cComment
	endif
endfunction
