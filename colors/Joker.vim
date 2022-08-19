" Vim color file
" Maintainer:	Joker
" Last Change:	2022 Aug 19

" This customized color scheme uses a dark grey background.

" load the "evening" colorscheme
runtime colors/evening.vim

let colors_name = "Joker"

hi Normal	ctermbg=Black guibg=#303234
hi Ignore	ctermfg=bg guifg=bg

" Syntax highlighting groups
hi Constant	ctermbg=NONE guibg=NONE
hi Special	ctermbg=NONE guibg=NONE
hi Underlined	ctermbg=NONE guifg=NONE
hi Error	ctermbg=NONE guifg=NONE
hi cIOFunction	ctermfg=LightBlue guifg=LightBlue

" Highlighting groups for various occasions
hi Search	term=standout ctermbg=DarkBlue ctermfg=NONE guibg=Blue guifg=NONE gui=underline
hi CursorLine	ctermbg=Black cterm=underline guibg=Black
hi CursorColumn	ctermbg=Black guibg=Black
hi Visual	ctermbg=DarkGray guibg=#60676b
hi LineNr	ctermbg=bg guibg=#3c4043
hi NonText	ctermbg=bg guibg=#434649
hi Folded	term=underline ctermbg=bg ctermfg=Yellow cterm=underline guibg=grey35 guifg=#ffff99 gui=underline
hi FoldColumn	ctermbg=bg ctermfg=Yellow guibg=bg guifg=#ffff99
hi Conceal	ctermbg=bg ctermfg=Black guibg=bg guifg=Black

" vim: ts=8
