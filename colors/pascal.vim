" Vim color file
" Maintainer:	Joker
" Last Change:	2019 Mar 14

" This customized color scheme uses a blue background.

let c_no_cformat = 1
let c_no_curly_error = 1
" Turn off detect of ansi constants and typedefs
let c_no_ansi = 1

" load the "blue" colorscheme
runtime colors/blue.vim

let colors_name = "Pascal"

" Groups for syntax highlighting
" Remove guibg=Black (in Version <= 7.4)
hi Constant	guibg=NONE
hi Special	guibg=NONE
" Remove highlight not used in Dev-C++
hi clear cConstant
hi clear cSpecial
hi clear cUserLabel
hi link cSpecial	cString
hi link cUserLabel	Normal
hi link cCppOut	NONE
" Identifier & Space
"hi Normal	guibg=Blue
" Reserved Word
hi clear Type
hi link Type	Statement
hi Statement	gui=NONE
" cNumber:	Number, Hexadecimal
" cFloat:	Float
" cOctal:	Octal
" cNumbersCom:	[for comments]
hi link cOctalZero	cOctal
hi Number	guifg=DarkCyan
hi cNumber	guifg=DarkCyan
" Character
hi Character	guifg=Cyan
" String
hi cString	guifg=Cyan
" Preprocessor
hi clear cIncluded
hi link cIncluded	cInclude
hi PreProc	guifg=Red
" Comment
"hi Comment	guifg=#9f9f9f
" Symbol
"hi cBracket	guifg=#e8e2b7
" Error
"hi Error	guibg=#d51212 guifg=White
" Selected text
"hi Visual	guibg=#404e51 guifg=White
" Gutter
"hi LineNr	guibg=#2f383c guifg=#6a8088
" Folding lines
"hi Folded	guibg=bg
"hi FoldColoumn	guifg=#c00000
"hi cIOFunction guifg=LightBlue
hi Function guifg=White

" Groups used in the 'highlight' and 'guicursor' options default value.
hi Search gui=underline guibg=Blue guifg=NONE
hi Cursor guibg=fg guifg=bg
hi CursorLine guibg=Black
hi CursorColumn guibg=Black
"hi NonText guibg=#2f383c
hi Ignore guifg=bg

se nocursorline
se guifont=fixedsys:h12

" vim: sw=2 ts=8
