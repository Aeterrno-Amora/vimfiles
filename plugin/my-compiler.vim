" Author: Joker
" Last Change: 2018 Nov 13

nnoremap <F5> :up<CR>
nnoremap <F6> <nop>
nnoremap <F8> <nop>
nmap <F7> <F5><F6>
imap <F5> <ESC><F5>
imap <F6> <ESC><F6>
imap <F7> <ESC><F7>
imap <F8> <ESC><F8>

augroup myCompilers
autocmd!

" cpp {{{
autocmd FileType cpp call s:CPPset()
function! s:CPPset()
	call s:Make('<F3>', 'cppStandard', '["-std=gnu++14","-std=c++98","-std=c++11"]')
	call s:Make('<F4>', 'cppOptimize', '["-O2","","-Ofast -march"]')
	"nnoremap <buffer> <F5> :up<CR>:exe '!g++ %:S -o "%<.exe" -Wall -Wextra -Wconversion -Wl,--stack=104857600' <SID>Get("cppStandard") <SID>Get("cppOptimize")<CR>
	nnoremap <buffer> <F5> :up<CR>:call <SID>CPPcmp()<CR>
	nnoremap <buffer> <F6> :!"%<.exe"<CR>
	nnoremap <buffer> <F8> :!gdb %:r:S<CR>
endfunction
function! s:CPPcmp()
	exe '!g++ %:S -o "%<.exe" -Wall -Wextra -Wconversion -Wl,--stack=104857600' s:Get('cppStandard') s:Get('cppOptimize')
endfunction
" }}}
" c {{{
autocmd FileType c call s:Cset()
function! s:Cset()
	call s:Make('<F4>', 'cOptimize', '["-O2","","-Ofast"]')
	nnoremap <buffer> <F5> :up<CR>:call <SID>Ccmp()<CR>
	nnoremap <buffer> <F6> :!"%<.exe"<CR>
	nnoremap <buffer> <F8> :!gdb %:r:S<CR>
endfunction
function! s:Ccmp()
	exe '!gcc %:S -o "%<.exe" -Wall -Wextra -Wconversion -Wl,--stack=104857600' s:Get('cOptimize')
endfunction
" }}}
" vim {{{
autocmd FileType vim nnoremap <buffer> <F6> :source %<CR>
" }}}
" bat, sh, vb {{{
autocmd FileType dosbatch,sh,vb nnoremap <buffer> <F6> :!%:S<CR>
" }}}

" helper functions {{{
" call s:Make('<Fn>', 'Opt', '[...]')
" make a switch list s:Opts, use b:Opt as iterator, hit <Fn> to toggle
function! s:Make(key, name, list)
	" let s:Opts = [...]
	exe 'let s:' . a:name . 's =' a:list
	" nnoremap <buffer> <Fn> :call <SID>Inc('Opt')<CR>
	exe 'nnoremap <buffer>' a:key ':call <SID>Inc("' . a:name . '")<CR>'
endfunction

" call s:Inc('Opt')
" iterate b:Opt through s:Opts
function! s:Inc(name)
	" let x = (b:Opt + 1) % len(s:Opts), but with default b:Opt = 0
	" let x = (getbufvar("", a:name) + 1) % len(s:Opts)
	exe 'let x = (getbufvar("", a:name) + 1) % len(s:' . a:name . 's)'
	" b:Opt = x || exe 'let b:' . a:name '= x'
	call setbufvar("", a:name, x)
	" echom a:name "=" s:Opts[x]
	exe 'echom a:name "=" s:' . a:name . 's[x]'
endfunction

" call s:Get('Opt')
" return s:Opts[ b:Opt ]
function! s:Get(name)
	" return s:Opts[getbufvar("", a:name)]
	exe 'return s:' . a:name . 's[getbufvar("", a:name)]'
endfunction
"}}}

augroup END
