" Author: Joker
" Last Change: 2018 Nov 27

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

" cpp {{{1
autocmd FileType cpp call s:Cpp()
function! s:Cpp()
	call SetSwitch('<F3>', 'Standard', [' -std=gnu++14',' -std=c++98',' -std=c++11'])
	call SetSwitch('<F4>', 'Optimize', [' -O2','',' -Ofast -march=native',' -pg -O2'])
	call Compiler('!g++ %:S -o "%<.exe" -Wall -Wextra -Wconversion -Wl,--stack=104857600',['Standard','Optimize'])
	nnoremap <buffer> <F6> :!"%<.exe"<CR>
	nnoremap <buffer> <F8> :!gdb %:r:S<CR>
endfunction

" c {{{1
autocmd FileType c call s:C()
function! s:C()
	call SetSwitch('<F3>', 'Standard', ['',' -std=c11'])
	call SetSwitch('<F4>', 'Optimize', [' -O2','',' -Ofast'])
	call Compiler('!gcc %:S -o "%<.exe" -Wall -Wextra -Wconversion -Wl,--stack=104857600',['Standard','Optimize'])
	nnoremap <buffer> <F6> :!"%<.exe"<CR>
	nnoremap <buffer> <F8> :!gdb %:r:S<CR>
endfunction

" vim, bat, sh, vb {{{1
autocmd FileType vim nnoremap <buffer> <F6> :source %<CR>
autocmd FileType dosbatch,sh,vb nnoremap <buffer> <F6> :!%:S<CR>
" }}}

" helper functions {{{
" call SetSwitch('keys', 'Opt', [...])
" make a switch list s:Opt, use b:Opt as iterator, map keys to toggle
" assign s:Opt if 3rd arg is given
function! SetSwitch(key, name, ...)
	if a:0 " let s:Opt = a:1
		exe 'let s:' . a:name . ' = a:1'
	endif
	" nnoremap <buffer> keys :call <SID>Inc("Opt",len)<CR>
	exe 'nnoremap <buffer>' a:key ':call <SID>Inc("' . a:name . '",' . eval('len(s:' . a:name . ')') . ')<CR>'
endfunction

" return a reference of list for external editing. call SetSwitch() later if lenth is changed.
function! GetSwitch(name)
	" return s:Opt
	exe 'return s:' . a:name
endfunction

" by modifying list, you operate on s:Opt
function! EditSwitch(key, name, exp)
	" let list = s:Opt
	exe 'let list = s:' . a:name
	" do something on list
	exe a:exp
	" update mapping
	call SetSwitch(a:key, a:name, list)
endfunction

function! AddSwitch(key, name, str)
	" call add(s:Opt, a:str)
	exe 'add(s:' . a:name . ', a:str)'
	" update mapping
	call SetSwitch(a:key, a:name)
endfunction

" call s:Inc('Opt', len)
" iterate b:Opt through s:Opt
function! s:Inc(name, len)
	" let x = (b:Opt + 1) % a:len, with default b:Opt = 0
	let x = (getbufvar("", a:name) + 1) % a:len
	" b:Opt = x
	call setbufvar("", a:name, x)
	" echom a:name "=" s:Opt[x]
	exe 'echom a:name "=" s:' . a:name . '[x]'
endfunction

" call s:Get('Opt')
" return s:Opt[ b:Opt ]
function! s:Get(name)
	" return s:Opts[getbufvar("", a:name)]
	exe 'return s:' . a:name . '[getbufvar("", a:name)]'
endfunction

" set up compiler cmdline
" each String is used directly in mapping, List of OptName will get dynamic value
function! Compiler(...)
	let cmd = 'nnoremap <buffer> <F5> :up<CR>:exe '
	for arg in a:000
		if type(arg) == v:t_list
			for name in arg
				let cmd .= '<SID>Get("' . name . '").'
			endfor
		else
			let cmd .= string(arg) . '.'
		endif
	endfor
	exe cmd[:-2] . '<CR>'
endfunction
"}}}

augroup END
