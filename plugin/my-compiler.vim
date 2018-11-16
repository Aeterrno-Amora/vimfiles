" Author: Joker
" Last Change: 2018 Nov 16

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
autocmd FileType cpp call s:Cpp()
function! s:Cpp()
	call s:Switch('<F3>', 'Standard', [' -std=gnu++14',' -std=c++98',' -std=c++11'])
	call s:Switch('<F4>', 'Optimize', [' -O2','',' -Ofast -march'])
	call s:Compiler('!g++ %:S -o "%<.exe" -Wall -Wextra -Wconversion -Wl,--stack=104857600',['Standard','Optimize'])
	nnoremap <buffer> <F6> :!"%<.exe"<CR>
	nnoremap <buffer> <F8> :!gdb %:r:S<CR>
endfunction
" }}}
" c {{{
autocmd FileType c call s:C()
function! s:C()
	call s:Switch('<F4>', 'Optimize', [' -O2','',' -Ofast'])
	call s:Compiler('!gcc %:S -o "%<.exe" -Wall -Wextra -Wconversion -Wl,--stack=104857600',['Optimize'])
	nnoremap <buffer> <F6> :!"%<.exe"<CR>
	nnoremap <buffer> <F8> :!gdb %:r:S<CR>
endfunction
" }}}
" vim, bat, sh, vb {{{
autocmd FileType vim nnoremap <buffer> <F6> :source %<CR>
autocmd FileType dosbatch,sh,vb nnoremap <buffer> <F6> :!%:S<CR>
" }}}

" helper functions {{{
" call s:Switch('keys', 'Opt', [...])
" make a switch list s:Opts, use b:Opt as iterator, map keys to toggle
function! s:Switch(key, name, list)
	" let s:Opts = a:list
	exe 'let s:' . a:name . 's = a:list'
	" nnoremap <buffer> keys :call <SID>Inc("Opt",len)<CR>
	exe 'nnoremap <buffer>' a:key ':call <SID>Inc("' . a:name . '",' . len(a:list) . ')<CR>'
endfunction

" call s:Inc('Opt', len)
" iterate b:Opt through s:Opts
function! s:Inc(name, len)
	" let x = (b:Opt + 1) % a:len, with default b:Opt = 0
	let x = (getbufvar("", a:name) + 1) % a:len
	" b:Opt = x
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

" set up compiler cmdline
" each String is used directly in mapping, List of OptName will get dynamic value
function! s:Compiler(...)
	let cmd = 'nnoremap <buffer> <F5> :up<CR>:exe '
	for arg in a:000
		if type(arg) == v:t_string
			let cmd .= string(arg) . '.'
		else	" <SID>Get("Opt")<CR>
			for name in arg
				let cmd .= '<SID>Get("' . name . '").'
			endfor
		endif
	endfor
	exe cmd[:-2] . '<CR>'
endfunction
"}}}

augroup END
