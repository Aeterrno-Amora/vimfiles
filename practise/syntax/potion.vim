" Author: Joker
" Last Change: 2018 Nov 14
" for practice

if exists("b:current_syntax")
  finish
endif

syn keyword	potionKeyword	loop times to while
syn keyword	potionKeyword	if elsif else
syn keyword	potionKeyword	class return

syn keyword	potionFunction	print join string

syn match	potionComment	"\v#.*$"

syn match	potionOperator	"\v\?|\="
syn match	potionOperator	"\v(\+|\-|\*|/)\=?"

syn region	potionString	start=/"/ skip=/\v\\./ end=/"/

hi link potionKeyWord	Keyword
hi link potionFunction	Function
hi link potionComment	Comment
hi link potionOperator	Operator
hi link potionString	String

let b:current_syntax = "potion"
" vim: ts=8
