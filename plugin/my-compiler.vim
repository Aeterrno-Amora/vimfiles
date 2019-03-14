" Author: Joker
" Last Change: 2019 Mar 14

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
	call s:Init()
	call SetSwitch('<F3>', 'Standard', [' -std=gnu++14',' -std=c++98 -ansi -pendantic',' -std=c++11'])
	call SetSwitch('<F4>', 'Optimize', [' -O2','',' -Ofast -march=native',' -pg -O2'])
	call SetSwitch('<C-F4>', 'Santitize', ['',' -fsanitize=address -fsanitize=undefined'])
	call Compiler('!g++ %:S -o "%<.exe" -Wall -Wextra -Wconversion -Wl,--stack=104857600',['Santitize','Standard','Optimize'])
	nnoremap <buffer> <F6> :!"%<.exe"<CR>
	nnoremap <buffer> <F8> :!gdb %:r:S<CR>
endfunction

" c {{{1
autocmd FileType c call s:C()
function! s:C()
	call s:Init()
	call SetSwitch('<F3>', 'Standard', ['',' -std=c11'])
	call SetSwitch('<F4>', 'Optimize', [' -O2','',' -Ofast'])
	call Compiler('!gcc %:S -o "%<.exe" -Wall -Wextra -Wconversion -Wl,--stack=104857600',['Standard','Optimize'])
	nnoremap <buffer> <F6> :!"%<.exe"<CR>
	nnoremap <buffer> <F8> :!gdb %:r:S<CR>
endfunction

" python {{{1
autocmd FileType python nnoremap <buffer> <F6> :!python %:S<CR>

" vim, bat, sh, vb {{{1
autocmd FileType vim nnoremap <buffer> <F6> :source %:S<CR>
autocmd FileType dosbatch,sh,vb nnoremap <buffer> <F6> :!%:S<CR>
" }}}

" helper functions {{{

" b:cpSwitch {
" 	'<key>':	{name: 'Name', iter: i, list: ['opt1','opt2']},
" }
" b:cpComplete {
" 	'<key>':	"SetSwitch('<key>', ...)",
" 	'Name':		"SetSwitch('<key>', ...)",
" 	'Compiler':	"Compiler(...)"
" }

" Initialize. create empty Dictionaries
function! s:Init()
	if !exists("b:cpComplete")
		let b:cpSwitch = {}
		let b:cpComplete = {}
	endif
endfunction

" call SetSwitch('<key>', 'Name', ['opt',...])
function! SetSwitch(key, name, list)
	" create an entry '<key>', which switches through ['opt',...], reset iter to 0
	let b:cpSwitch[a:key] = {'name': a:name, 'list': a:list}
	" register completion
	let rec = 'SetSwitch(' . string(a:key) . ', ' . string(a:name) . ', ' . string(a:list) . ')'
	let b:cpComplete[a:name] = rec
	let b:cpComplete[a:key] = rec
	" nnoremap <buffer> <key> :call <SID>Inc('<key>',len)<CR>
	exe 'nnoremap <buffer>' a:key ':call <SID>Inc(' . string(a:key) . ',' . len(a:list) . ')<CR>'
endfunction

" iterate b:cpSwitch[key].iter through [0,len)
function! s:Inc(key, len)
	let data = b:cpSwitch[a:key]
	let data.iter = (get(data, 'iter') + 1) % a:len
	echo data.name '=' data.list[data.iter]
endfunction

" get current value of b:cpSwitch[key]
function! s:Get(key)
	let data = b:cpSwitch[a:key]
	return data.list[get(data, 'iter')]
endfunction

" set up compiler cmdline
" each String is used directly in mapping, List of 'Name' will get dynamic value
function! Compiler(...)
	let cmd = 'nnoremap <buffer> <F5> :up<CR>:exe '
	let cpl = 'Compiler('
	for arg in a:000
		let cpl .= string(arg) . ','
		if type(arg) == v:t_list
			for qry in arg
				" if key or b:cpSwitch[key].name matches Name, add Get('<key>') to cmd
				for [key, dict] in items(b:cpSwitch)
					if qry == key || qry == dict.name
						let cmd .= '<SID>Get(' . string(key) . ').'
						break
					endif
				endfor
			endfor
		else
			let cmd .= string(arg) . '.'
		endif
	endfor
	exe cmd[:-2] . '<CR>'
	let b:cpComplete['Compiler'] = cpl[:-2] . ')'
endfunction

command -nargs=1 -complete=customlist,s:MyComplete EditCall	call <args>
function! s:MyComplete(ArgLead, CmdLine, CursorPos)
	if has_key(b:cpComplete, a:ArgLead)
		return [b:cpComplete[a:ArgLead]]
	endif
	return filter(keys(b:cpComplete), "v:val =~? a:ArgLead")
endfunction
"}}}

augroup END
