" Vim syntax file
" Language:	C
" Maintainer:	Joker
" Last Change:	2018 Nov 15

" add on for c syntax

syn match	cSpaceError	"    "

"hi def link cBracketChar	cOperatorChar
syn keyword	cIOFunction	scanf printf fscanf fprintf sscanf sprintf gets puts getchar putchar getch
hi def link	cIOFunction	Function

"syn match	cOperatorChar	"\v\.|\+|\-|\*|\/|\%|\=|\!|\<|\>|\&|\||\~|\^|\?|\:|\,"
"syn match	cBracketChar	"\v\(|\)|\[|\]|\{|\}"
"hi def link	cBracketChar	cOperatorChar
"hi def link	cOperatorChar	cOperator

" vim: ts=8
