" Author:	Joker
" Last Change:	2019 Nov 24

nnoremap <buffer> <F5> :up<CR>:!coqc -Q . LF %:S<CR>
nnoremap <buffer> <F7> <nop>

"nmap <buffer> <F6> <leader>cl
"nmap <buffer> <C-Down> <leader>cj
"nmap <buffer> <C-Up> <leader>ck
"nmap <buffer> `` <leader>cG
"nmap <buffer> <C-C> <leader>ca
"nmap <buffer> <C-M> :let b:wd = expand('<cword>')<CR>
"imap <buffer> <C-M> <ESC>:exe 'CoqMakeMatch' b:wd<CR>

hi coqVernacular term=underline ctermfg=9 gui=underline guifg=#ff80ff
hi link coqProofDelim PreProc
hi link coqProofDot coqProofDelim
hi link coqVernacPunctuation coqProofDelim
