" Author:	Joker
" Last Change:	2020 Jan 28

set encoding=utf-8

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Options {{{1
" display {{{2

" indent, fold
set number relativenumber ruler
set autoindent cindent
set shiftwidth=4 tabstop=4
set showmatch matchtime=1
set foldmethod=marker

" fonts, syntax
set guifont=consolas:h14
let c_gnu = 1
"let c_space_errors = 1	"高亮行末空格
colorscheme Joker
set cursorline "行高亮	cursorcolumn列高亮

" encoding
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,default,latin1
"set langmenu=zh_CN.utf-8	"解决enc=untf-8导致的菜单乱码
"language message zh_CN.utf-8
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim

" other options {{{2
autocmd GUIEnter * simalt ~x "启动后最大化
"set shortmess=atI "启动时不显示援助索马里儿童的提示
cd D:\Tsinghua
set mouse=a
set autochdir "设当前文件目录为工作路径
set nobackup
set history=200
set undodir=~\vimfiles\undo "un~文件会被统一写入此目录，不会四处分散
set vb t_vb= "去掉命令错误时发出的一个响声
" }}}1

" Mappings {{{1
let mapleader = " "
set maxmapdepth=256

" daily abbreviations {{{2
inoremap <C-BS> <ESC>diwa
" for typing c++ code
inoremap #i #include <
inoremap #d #define
" for c++ debug
nnoremap <C-P> ofprintf(stderr,"\n");<ESC>4hi
" defult templates
nmap <leader>std i#icstdio><CR><CR><CR><CR>int main() {<CR>return 0;<CR>}<ESC>3G
nmap <leader>exm <leader>std5Gofreopen(".in","r",stdin);<CR>freopen(".out","w",stdout);<ESC>6G9li
nmap <leader>ckr <leader>std2Gi#ictime><CR>#icstdlib><CR>#iwindows.h><ESC>7Gosrand( time(NULL) );<CR>for (int t = 1; t <= 100; t++) {<CR>FILE *f = fopen(NAME ".in","w");<CR>int n = rand()%;<CR>fprintf(f,"%d\n",n);<CR>;<BS><CR>fclose(f);<CR>system(NAME ".exe < " NAME ".in > " NAME ".out");<CR>system(NAME "_bf.exe < " NAME ".in > " NAME ".ans");<CR>if ( system("fc " NAME ".out " NAME ".ans > " NAME ".log") ) {<CR>printf("Wrong Answer in Test %d\n",t);<CR>break;<CR>}<CR>else printf("Test %d Accepted.\n",t);<CR>}<ESC>5Gi#dNAME "
nmap <leader>mod <leader>stdggotypedef long long ll;<CR>const ll MOD = ;<ESC>i
" cmd abbreviations
cabbrev vds vertical diffsplit
command -nargs=1 -bar E w %:t:s?\.?<args>.?|e #

" pairwise insert & remove {{{2
" insert from visual mode
vnoremap <leader>( <ESC>`>i)<ESC>`<i(<ESC>
vnoremap <leader>[ <ESC>`>i]<ESC>`<i[<ESC>
vnoremap <leader>{ <ESC>'>o}<ESC>'<O{<ESC>=%
vnoremap <leader>" <ESC>`>i"<ESC>`<i"<ESC>
vnoremap <leader>' <ESC>`>i'<ESC>`<i'<ESC>
vnoremap <leader>$ <ESC>`>i$<ESC>`<i$<ESC>
vnoremap <leader>/ <ESC>'>j0i*/<ESC>'<0i/*<ESC>
" remove surrounding pair
nnoremap <leader>d( va(<ESC>`>X`<x
nnoremap <leader>d[ va[<ESC>`>X`<x
nnoremap <leader>d{ va{<ESC>'>dd`<h2x
nnoremap <leader>d" va"<ESC>`>X`<x
nnoremap <leader>d' va'<ESC>`>X`<x
nnoremap <leader>d$ ?\$<CR>xNx:noh<CR>
nnoremap <leader>d/ ?/\*<CR>%h2xn2x:noh<CR>
" make / remove one-line comment
nnoremap <leader>/ I//<ESC>
nnoremap <leader>dI ^2x
nnoremap <leader>dA $h2x

" pair auto complete {{{2
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
"inoremap < <><ESC>i
"inoremap { {}<Esc>O
inoremap <expr> ) ClosePair(')')
inoremap <expr> ] ClosePair(']')
inoremap <expr> ' QuoteDelim("'")
inoremap " <C-R>=QuoteDelim('"')<CR>
"inoremap <expr> " QuoteDelim('"')
" WEIRD: why doesn't <expr> work properly for map <leader>ckr but <C-R> works
"inoremap > <c-r>=ClosePair('>')<CR>
"inoremap } <c-r>=CloseBracket()<CR>

" helper functions {{{3
function ClosePair(char)
 if getline('.')[col('.') - 1] == a:char
 return "\<Right>"
 else
 return a:char
 endif
endf

function CloseBracket()
 if match(getline(line('.') + 1), '\s*}') < 0
 return "\<CR>}"
 else
 return "\<Esc>j0f}a"
 endif
endf

function QuoteDelim(char)
 let line = getline('.')
 let col = col('.')
 if line[col - 2] == "\\"
 return a:char
 elseif line[col - 1] == a:char
 return "\<Right>"
 else
 return a:char.a:char."\<LEFT>"
 endif
endf

" }}}1

" File Specific {{{2
augroup myFileCmd
	autocmd!
	autocmd FileType html,vim,md,tex,coq* setlocal shiftwidth=2
	" html: complete <>
	autocmd FileType html inoremap <buffer> < <lt>><LEFT>| inoremap <buffer> > <c-r>=ClosePair('>')<CR>
	" vimscript: folding, don't complete ""
	autocmd FileType vim setlocal foldlevel=0 | inoremap <buffer> " "
	" articles: don't complete ''
	autocmd FileType text,md,tex,coq* inoremap <buffer> ' '
augroup END
" }}}2

" vim: foldcolumn=3 foldlevel=1
