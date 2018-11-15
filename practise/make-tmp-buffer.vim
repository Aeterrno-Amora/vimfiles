let wnr = bufwinnr("__tmp_buffer__")
if wnr != -1
	exe wnr . "wincmd w"
else
	vsplit __tmp_buffer__
	normal! ggdG
	setlocal noswapfile
	setlocal buftype=nofile
	setlocal bufhidden=delete
	"setlocal filetype=
endif
