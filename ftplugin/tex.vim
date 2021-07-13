let g:tex_flavor = 'latex'

"let g:vimtex_enabled = 0
let g:vimtex_delim_toggle_mod_list = [
  \ ['\bigl', '\bigr'],
  \ ['\Bigl', '\Bigr'],
  \ ['\biggl', '\biggr'],
  \ ['\Biggl', '\Biggr'],
  \ ['\left', '\right']]
"let g:vimtex_env_change_autofill = 1
let g:vimtex_fold_enabled = 1
let g:vimtex_fold_manual = 1
let g:vimtex_fold_types = {'envs': {'whitelist': ['hwProb']}}
let g:vimtex_indent_delims = {'include_modified_math':0}
let g:vimtex_toc_custom_matchers = [{'title':'Problem', 're':'\v^\s*\\begin\{hwProb\}'}]
let g:vimtex_view_general_viewer = 'SumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'

map! …… ^
map! —— _
map! （ (
map! ） )
map! 、 \
map! 《 <
map! 》 >
