" Author:	Joker
" Last Change:	2018 Nov 13

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Options {{{
" view & disp runlay {{{
" windows & conte runnts & indent {{{
set number ruler
set showmatch matchtime=1
set autoindent cindent
set shiftwidth=4 tabstop=4
" }}}
" colors & fonts {{{
set guifont=consolas:h15
let c_gnu = 1
"let c_space_errors = 1	"高亮行末空格
colorscheme Joker
set cursorline "行高亮	cursorcolumn列高亮
"hi Cursorline cterm=NONE ctermbg=black ctermfg=NONE guibg=black guifg=white
" }}}
" fold {{{
augroup myFold
	autocmd!
	" use fold for vimscript
	autocmd FileType vim setlocal foldmethod=marker foldlevel=0
augroup END
" }}}
" }}}

" startup {{{
autocmd GUIEnter * simalt ~x "启动后最大化
"set shortmess=atI "启动时不显示援助索马里儿童的提示
cd E:\Informatics
set autochdir "设当前编辑的文件目录为工作路径
"cd:改变工作路径 lcd:改变当前窗口工作路径 pwd:查看工作路径
" }}}

" other options {{{
set nobackup
set history=200
set undodir=$VIM/undo "un~文件会被统一写入此目录，不会四处分散
set vb t_vb= "去掉命令错误时发出的一个响声
" }}}
" }}}

" Mappings {{{
let mapleader = " "
set maxmapdepth=256

" daily abbreviations {{{
" for typing c++ code
inoremap #i #include <
inoremap #d #define 
" for c++ debug
nnoremap <C-P> ofprintf(stderr,"\n");<ESC>4hi
" defult codes
nmap <leader>std i#icstdio><CR><CR><CR><CR>int main() {<CR>return 0;<CR>}<ESC>3G
nmap <leader>exm <leader>std5Gofreopen(".in","r",stdin);<CR>freopen(".out","w",stdout);<ESC>6G9li
nmap <leader>ckr <leader>std2Gi#ictime><CR>#icstdlib><CR>#iwindows.h><ESC>7Gosrand( time(NULL) );<CR>for (int t = 1; t <= 100; t++) {<CR>FILE *f = fopen(NAME ".in","w");<CR>int n = rand()%;<CR>fprintf(f,"%d\n",n);<CR>;<BS><CR>fclose(f);<CR>system(NAME ".exe < " NAME ".in > " NAME ".out");<CR>system(NAME "_bf.exe < " NAME ".in > " NAME ".ans");<CR>if ( system("fc " NAME ".out " NAME ".ans > " NAME ".log") ) {<CR>printf("Wrong Answer in Test %d\n",t);<CR>break;<CR>}<CR>else printf("Test %d Accepted.\n",t);<CR>}<ESC>5Gi#dNAME "
" cmd abbreviations
cabbrev vds vertical diffsplit
" }}}

" pair auto complete {{{
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

" pairwise insert & remove
" insert from visual mode
vnoremap <leader>( <ESC>`>i)<ESC>`<i(<ESC>
vnoremap <leader>[ <ESC>`>i]<ESC>`<i[<ESC>
vnoremap <leader>{ <ESC>'>o}<ESC>'<O{<ESC>=%
vnoremap <leader>" <ESC>`>i"<ESC>`<i"<ESC>
vnoremap <leader>' <ESC>`>i'<ESC>`<i'<ESC>
vnoremap <leader>/ <ESC>'>j0i*/<ESC>'<0i/*<ESC>
" remove surrounding pair
nnoremap <leader>d( va(<ESC>`>X`<x
nnoremap <leader>d[ va[<ESC>`>X`<x
nnoremap <leader>d{ va{<ESC>'>dd`<h2x
nnoremap <leader>d" va"<ESC>`>X`<x
nnoremap <leader>d' va'<ESC>`>X`<x
nnoremap <leader>d/ ^mz%02x'z2x
" make / remove one-line comment
nnoremap <leader>/ I//<ESC>
nnoremap <leader>dI ^2x
nnoremap <leader>dA $l2x

" FileType autocmd {{{
augroup myPairComplete
	autocmd!
	" complete <> for html
	autocmd FileType html inoremap <buffer> < <lt>><LEFT>| inoremap <buffer> > <c-r>=ClosePair('>')<CR>
augroup END
" }}}

" helper functions {{{
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
" }}}
" }}}
" }}}

" vim: foldcolumn=3 foldlevel=1
