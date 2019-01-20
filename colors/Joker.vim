" Vim color file
" Maintainer:	Joker
" Last Change:	2018 Dec 14

" This customized color scheme uses a dark grey background.

" load the "evening" colorscheme
runtime colors/evening.vim

let colors_name = "Joker"

hi Normal guibg=#303234
hi Ignore guifg=#303234

" Groups for syntax highlighting
hi Constant guibg=NONE
hi Special guibg=NONE
hi Underlined guifg=White
hi cIOFunction guifg=LightBlue
hi link cCommentString cComment
hi link cComment2String cComment

" Groups used in the 'highlight' and 'guicursor' options default value.
hi Search gui=underline guibg=Blue guifg=NONE
hi CursorLine guibg=Black
hi CursorColumn guibg=Black
hi Visual guibg=#60676b
hi LineNr guibg=#3c4043
hi NonText guibg=#434649

" vim: sw=2
