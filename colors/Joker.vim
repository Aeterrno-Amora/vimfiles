" Vim color file
" Maintainer:	Joker
" Last Change:	2019 Mar 14

" This customized color scheme uses a dark grey background.

" load the "evening" colorscheme
runtime colors/evening.vim

let colors_name = "Joker"

hi Normal	guibg=#303234
hi Ignore	guifg=#303234

" Syntax highlighting groups
hi Constant	guibg=NONE
hi Special	guibg=NONE
hi Underlined	guifg=NONE
hi Error	guifg=NONE
hi cIOFunction	guifg=LightBlue

" Highlighting groups for various occasions
hi Search	gui=underline guibg=Blue guifg=NONE
hi CursorLine	guibg=Black
hi CursorColumn	guibg=Black
hi Visual	guibg=#60676b
hi LineNr	guibg=#3c4043
hi NonText	guibg=#434649
hi Folded	gui=underline guibg=grey35 guifg=#ffff99
hi FoldColumn	guibg=bg guifg=#ffff99
hi Conceal	guibg=bg guifg=Black

" vim: ts=8
