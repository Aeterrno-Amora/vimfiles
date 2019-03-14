" Vim syntax file
" Language:	C
" Maintainer:	Joker
" Last Change:	2019 Mar 2

" add on for c syntax

syn match	cSoftTab	"    "
hi def link	cSoftTab	cSpaceError

syn keyword	cIOFunction	scanf printf fscanf fprintf sscanf sprintf gets puts fgets fputs getchar putchar getch
hi def link	cIOFunction	cFunction
hi def link	cFuhction	Function

syn keyword	cExtType	__int128
syn keyword	cUserType	unt ll ull LL uLL db ldb
hi def link	cExtType	cType
hi def link	cUserType	cType

"syn match	cOperatorChar	"\v\.|\+|\-|\*|\/|\%|\=|\!|\<|\>|\&|\||\~|\^|\?|\:|\,"
"syn match	cBracketChar	"\v\(|\)|\[|\]|\{|\}"
"hi def link	cBracketChar	cOperatorChar
"hi def link	cOperatorChar	cOperator

" vim: ts=8
