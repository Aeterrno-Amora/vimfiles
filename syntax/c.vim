" Vim syntax file
" Language:	C
" Maintainer:	Joker
" Last Change:	2018 Nov 14

" add on for c.vim

syn match	cSpaceError	"    "

"syn match	cBracketChar	"\v\(|\)|\[|\]|\{|\}"
syn match	cOperatorChar	"\v\.|\+|\-|\*|\/|\%|\=|\!|\<|\>|\&|\||\~|\^|\?|\:|\,"
"hi def link	cBracketChar	cOperatorChar
"hi def link	cOperatorChar	cOperator

"hi def link cBracketChar	cOperatorChar
syn keyword	cIOFunction	scanf printf fscanf fprintf sscanf sprintf gets puts getchar putchar getch
hi def link	cIOFunction	Function

" vim: ts=8
