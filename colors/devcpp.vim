" Vim color file
" Maintainer:	Joker
" Last Change:	2019 Mar 14

" This customized color scheme uses a dark grey background.

let c_no_cformat = 1
let c_no_curly_error = 1
" Turn off detect of ansi constants and typedefs
let c_no_ansi = 1

" load the "evening" colorscheme
runtime colors/evening.vim

let colors_name = "Dev-Cpp"

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
hi Normal	guibg=#293134 guifg=#e0e2e4
" Reserved Word
hi clear Type
hi link Type	Statement
hi Statement	gui=NONE guifg=#678cb1
" cNumber:	Number, Hexadecimal
" cFloat:	Float
" cOctal:	Octal
" cNumbersCom:	[for comments]
hi link cOctalZero	cOctal
hi Number	guifg=#ffce22
hi cNumber	guifg=#ffce22
" Character
hi Character	guifg=#ff8409
" String
hi cString	guifg=#ec7600
" Preprocessor
hi clear cIncluded
hi link cIncluded	cInclude
hi PreProc	guifg=#a082bd
" Comment
hi Comment	guifg=#9f9f9f
" Symbol
hi cBracket	guifg=#e8e2b7
" Error
hi Error	guibg=#d51212 guifg=White
" Selected text
hi Visual	guibg=#404e51 guifg=White
" Gutter
hi LineNr	guibg=#2f383c guifg=#6a8088
hi clear CursorLineNr
hi link	CursorLineNr	LineNr
" Folding lines
hi Folded	gui=underline guifg=NONE guibg=bg
hi FoldColumn	guifg=#c00000 guibg=bg

" Groups used in the 'highlight' and 'guicursor' options default value.
hi Search gui=underline guibg=Blue guifg=NONE
hi CursorLine guibg=Black
hi CursorColumn guibg=Black
hi NonText guibg=#2f383c
hi EndOfBuffer guifg=#2f383c guibg=#2f383c
hi Ignore guifg=bg

" vim: sw=2 ts=8
