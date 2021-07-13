nnoremap <F11> :echo synIDattr(synID(line('.'),col('.'),0),'name')<CR>
nnoremap <C-F11> :echo synIDattr(synIDtrans(synID(line('.'),col('.'),0)),'name')<CR>

let s:tex_conceal = 'abdmg'

" config {{{1
" by default, enable all region-based highlighting
let s:tex_fast= "bcmMprsSvV"
if exists("g:tex_fast")
 if type(g:tex_fast) != 1
  " g:tex_fast exists and is not a string, so
  " turn off all optional region-based highighting
  let s:tex_fast= ""
 else
  let s:tex_fast= g:tex_fast
 endif
endif

" let user determine which classes of concealment will be supported
"   a=accents/ligatures d=delimiters m=math symbols  g=Greek  s=superscripts/subscripts
if !exists("g:tex_conceal")
 let s:tex_conceal= 'abdmgsS'
else
 let s:tex_conceal= g:tex_conceal
endif
if !exists("g:tex_superscripts")
 let s:tex_superscripts= '[0-9a-zA-W.,:;+-<>/()=]'
else
 let s:tex_superscripts= g:tex_superscripts
endif
if !exists("g:tex_subscripts")
 let s:tex_subscripts= '[0-9aehijklmnoprstuvx,+-/().]'
else
 let s:tex_subscripts= g:tex_subscripts
endif

" Determine whether or not to use "*.sty" mode
" The user may override the normal determination by setting
"   g:tex_stylish to 1      (for    "*.sty" mode)
"    or to           0 else (normal "*.tex" mode)
" or on a buffer-by-buffer basis with b:tex_stylish
let s:extfname=expand("%:e")
if exists("g:tex_stylish")
 let b:tex_stylish= g:tex_stylish
elseif !exists("b:tex_stylish")
 if s:extfname == "sty" || s:extfname == "cls" || s:extfname == "clo" || s:extfname == "dtx" || s:extfname == "ltx"
  let b:tex_stylish= 1
 else
  let b:tex_stylish= 0
 endif
endif
"}}}1

" Conceal mode support (supports set cole=2)
if &enc == 'utf-8'
  " Math Symbols {{{1
  " (many of these symbols were contributed by Björn Winckler)
  if s:tex_conceal =~# 'm'
    "{{{
    let s:texMathList=[
	  \ ['|'		, '‖'],
	 "\ ['aleph'		, 'ℵ'],
	 "\ ['amalg'		, '∐'],
	  \ ['angle'		, '∠'],
	  \ ['approx'		, '≈'],
	 "\ ['ast'		, '∗'],
	 "\ ['asymp'		, '≍'],
	 "\ ['backslash'	, '∖'],
	  \ ['bigcap'		, '∩'],
	  \ ['bigcirc'		, '○'],
	  \ ['bigcup'		, '∪'],
	  \ ['bigodot'		, '⊙'],
	  \ ['bigoplus'		, '⊕'],
	 "\ ['bigotimes'	, '⊗'],
	 "\ ['bigsqcup'		, '⊔'],
	  \ ['bigtriangledown'	, '∇'],
	  \ ['bigtriangleup'	, '∆'],
	 "\ ['bigvee'		, '⋁'],
	 "\ ['bigwedge'		, '⋀'],
	  \ ['bot'		, '⊥'],
	 "\ ['bowtie'	        , '⋈'],
	  \ ['bullet'	        , '•'],
	  \ ['cap'		, '∩'],
	  \ ['cdot'		, '·'],
	 "\ ['cdots'		, '⋯'],
	 "\ ['circ'		, '∘'],
	  \ ['clubsuit'		, '♣'],
	 "\ ['cong'		, '≅'],
	 "\ ['coprod'		, '∐'],
	  \ ['copyright'	, '©'],
	  \ ['cup'		, '∪'],
	  \ ['dagger'	        , '†'],
	 "\ ['dashv'		, '⊣'],
	  \ ['ddagger'		, '‡'],
	 "\ ['ddots'	        , '⋱'],
	 "\ ['diamond'		, '⋄'],
	 "\ ['diamondsuit'	, '♢'],
	  \ ['div'		, '÷'],
	 "\ ['doteq'		, '≐'],
	  \ ['dots'		, '…'],
	  \ ['downarrow'	, '↓'],
	 "\ ['Downarrow'	, '⇓'],
	  \ ['ell'		, 'ℓ'],
	 "\ ['emptyset'		, '∅'],
	  \ ['equiv'		, '≡'],
	 "\ ['exists'		, '∃'],
	  \ ['flat'		, '♭'],
	  \ ['forall'		, '∀'],
	 "\ ['frown'		, '⁔'],
	  \ ['ge'		, '≥'],
	  \ ['geq'		, '≥'],
	  \ ['gets'		, '←'],
	 "\ ['gg'		, '⟫'],
	 "\ ['hbar'		, 'ℏ'],
	 "\ ['heartsuit'	, '♡'],
	 "\ ['hookleftarrow'	, '↩'],
	 "\ ['hookrightarrow'	, '↪'],
	  \ ['iff'		, '⇔'],
	 "\ ['Im'		, 'ℑ'],
	  \ ['imath'		, 'ɩ'],
	  \ ['in'		, '∈'],
	  \ ['infty'		, '∞'],
	  \ ['int'		, '∫'],
	  \ ['jmath'		, '𝚥'],
	  \ ['land'		, '∧'],
	 "\ ['lceil'		, '⌈'],
	  \ ['ldots'		, '…'],
	  \ ['le'		, '≤'],
	  \ ['left('		, '('],
	  \ ['left\['		, '['],
	  \ ['left\\{'		, '{'],
	  \ ['leftarrow'	, '←'],
	 "\ ['Leftarrow'	, '⇐'],
	 "\ ['leftharpoondown'	, '↽'],
	 "\ ['leftharpoonup'	, '↼'],
	  \ ['leftrightarrow'	, '↔'],
	  \ ['Leftrightarrow'	, '⇔'],
	  \ ['le'		, '≤'],
	  \ ['leq'		, '≤'],
	 "\ ['lfloor'		, '⌊'],
	 "\ ['ll'		, '≪'],
	  \ ['lmoustache'	, '╭'],
	  \ ['lor'		, '∨'],
	 "\ ['mapsto'		, '↦'],
	  \ ['mid'		, '∣'],
	  \ ['models'		, '╞'],
	 "\ ['mp'		, '∓'],
	  \ ['nabla'		, '∇'],
	 "\ ['natural'		, '♮'],
	  \ ['ne'		, '≠'],
	  \ ['nearrow'		, '↗'],
	  \ ['neg'		, '¬'],
	  \ ['lnot'		, '¬'],
	  \ ['ne'		, '≠'],
	  \ ['neq'		, '≠'],
	 "\ ['ni'		, '∋'],
	 "\ ['notin'		, '∉'],
	  \ ['nwarrow'		, '↖'],
	  \ ['odot'		, '⊙'],
	  \ ['oint'		, '∮'],
	 "\ ['ominus'		, '⊖'],
	  \ ['oplus'		, '⊕'],
	 "\ ['oslash'		, '⊘'],
	 "\ ['otimes'		, '⊗'],
	 "\ ['owns'		, '∋'],
	 "\ ['P'	        , '¶'],
	  \ ['parallel'		, '║'],
	  \ ['partial'		, '∂'],
	  \ ['perp'		, '⊥'],
	  \ ['pm'		, '±'],
	 "\ ['prec'		, '≺'],
	 "\ ['preceq'		, '⪯'],
	  \ ['prime'		, '′'],
	  \ ['prod'		, '∏'],
	  \ ['propto'		, '∝'],
	 "\ ['rceil'		, '⌉'],
	 "\ ['Re'		, 'ℜ'],
	  \ ['quad'		, ' '],
	  \ ['qquad'		, ' '],
	 "\ ['rfloor'		, '⌋'],
	  \ ['right)'		, ')'],
	  \ ['right]'		, ']'],
	  \ ['right\\}'		, '}'],
	  \ ['rightarrow'	, '→'],
	  \ ['Rightarrow'	, '⇒'],
	 "\ ['rightleftharpoons', '⇌'],
	  \ ['rmoustache'	, '╮'],
	  \ ['S'	        , '§'],
	  \ ['searrow'		, '↘'],
	 "\ ['setminus'		, '∖'],
	  \ ['sharp'		, '♯'],
	 "\ ['sim'		, '∼'],
	 "\ ['simeq'		, '⋍'],
	 "\ ['smile'		, '‿'],
	  \ ['spadesuit'	, '♠'],
	 "\ ['sqcap'		, '⊓'],
	 "\ ['sqcup'		, '⊔'],
	 "\ ['sqsubset'		, '⊏'],
	 "\ ['sqsubseteq'	, '⊑'],
	 "\ ['sqsupset'		, '⊐'],
	 "\ ['sqsupseteq'	, '⊒'],
	  \ ['star'		, '✫'],
	 "\ ['subset'		, '⊂'],
	 "\ ['subseteq'		, '⊆'],
	 "\ ['succ'		, '≻'],
	 "\ ['succeq'		, '⪰'],
	  \ ['sum'		, '∑'],
	 "\ ['supset'		, '⊃'],
	 "\ ['supseteq'		, '⊇'],
	  \ ['surd'		, '√'],
	  \ ['swarrow'		, '↙'],
	  \ ['times'		, '×'],
	  \ ['to'		, '→'],
	 "\ ['top'		, '⊤'],
	  \ ['triangle'		, '∆'],
	 "\ ['triangleleft'	, '⊲'],
	 "\ ['triangleright'	, '⊳'],
	  \ ['uparrow'		, '↑'],
	 "\ ['Uparrow'		, '⇑'],
	  \ ['updownarrow'	, '↕'],
	 "\ ['Updownarrow'	, '⇕'],
	 "\ ['vdash'		, '⊢'],
	 "\ ['vdots'		, '⋮'],
	  \ ['vee'		, '∨'],
	  \ ['wedge'		, '∧'],
	 "\ ['wp'		, '℘'],
	 "\ ['wr'		, '≀'],
	 \ ]
    if &ambw == "double" || exists("g:tex_usedblwidth")
      let s:texMathList= s:texMathList + [
	    \ ['right\\rangle'	, '〉'],
	    \ ['left\\langle'	, '〈']]
    else
      let s:texMathList= s:texMathList + [
	    \ ['right\\rangle'	, '>'],
	    \ ['left\\langle'	, '<']]
    endif	"}}}
    for texmath in s:texMathList
      if texmath[0] =~# '\a$'
	exe 'syn match texMathSymbol ''\\'.texmath[0].'\a\@!'' contained conceal cchar='.texmath[1]
      else
	exe 'syn match texMathSymbol ''\\'.texmath[0]."' contained conceal cchar=".texmath[1]
      endif
    endfor

    if &ambw == "double"
      syn match texMathSymbol '\\gg\a\@!'			contained conceal cchar=≫
      syn match texMathSymbol '\\ll\a\@!'			contained conceal cchar=≪
    else
      syn match texMathSymbol '\\gg\a\@!'			contained conceal cchar=⟫
      syn match texMathSymbol '\\ll\a\@!'			contained conceal cchar=⟪
    endif

    "{{{
    let s:mathAccentTable = [
	  \ ['A','Ȧ','Â'],
	  \ ['a','ȧ','â'],
	  \ ['B','Ḃ',' '],
	  \ ['b','ḃ',' '],
	  \ ['C','Ċ','Ĉ'],
	  \ ['c','ċ','ĉ'],
	  \ ['D','Ḋ',' '],
	  \ ['d','ḋ',' '],
	  \ ['E','Ė','Ê'],
	  \ ['e','ė','ê'],
	  \ ['F','Ḟ',' '],
	  \ ['f','ḟ',' '],
	  \ ['G','Ġ','Ĝ'],
	  \ ['g','ġ','ĝ'],
	  \ ['H','Ḣ',' '],
	  \ ['h','ḣ',' '],
	  \ ['I','İ','Î'],
	  \ ['i',' ','î'],
	  \ ['M','Ṁ',' '],
	  \ ['m','ṁ',' '],
	  \ ['N','Ṅ',' '],
	  \ ['n','ṅ',' '],
	  \ ['O','Ȯ','Ô'],
	  \ ['o','ȯ','ô'],
	  \ ['P','Ṗ',' '],
	  \ ['p','ṗ',' '],
	  \ ['R','Ṙ',' '],
	  \ ['r','ṙ',' '],
	  \ ['S','Ṡ','Ŝ'],
	  \ ['s','ṡ','ŝ'],
	  \ ['T','Ṫ',' '],
	  \ ['t','ṫ',' '],
	  \ ['U',' ','Û'],
	  \ ['u',' ','û'],
	  \ ['W','Ẇ','Ŵ'],
	  \ ['w','ẇ','ŵ'],
	  \ ['X','Ẋ',' '],
	  \ ['x','ẋ',' '],
	  \ ['Y','Ẏ','Ŷ'],
	  \ ['y','ẏ','ŷ'],
	  \ ['Z','Ż',' '],
	  \ ['z','ż',' '],
	  \ ]	"}}}
    for entry in s:mathAccentTable
      let chr = entry[0]
      let i = 0
      for accent in ['dot', 'hat']
	let i = i + 1
	let cchar = entry[i]
	if strlen(cchar) == 0 || cchar == ' ' || cchar == '?'
	  continue
	endif
	if accent =~# '\a'
	  exe "syn match texMathSymbol '".'\\'.accent.'\(\s*{'.chr.'}\|\s\+'.chr.'\)'."' contained conceal cchar=".cchar
	else
	  exe "syn match texMathSymbol '".'\\'.accent.'\s*\({'.chr.'}\|'.chr.'\)'."' contained conceal cchar=".cchar
	endif
      endfor
    endfor
  endif

  " Greek {{{1
  if s:tex_conceal =~# 'g'
    "{{{
    let s:GreekList = {
	  \ 'α': ['alpha','al'],
	  \ 'β': ['beta','bt'],
	  \ 'γ': ['gamma','gm'],
	  \ 'δ': ['delta','dt'],
	  \ 'ϵ': ['epsilon','ep'],
	  \ 'ε': ['varepsilon','eps'],
	  \ 'ζ': ['zeta','zt'],
	  \ 'η': ['eta'],
	  \ 'θ': ['theta','th'],
	  \ 'ϑ': ['vartheta','vth'],
	  \ 'ι': ['iota'],
	  \ 'κ': ['kappa'],
	  \ 'λ': ['lambda','la'],
	  \ 'μ': ['mu'],
	  \ 'ν': ['nu'],
	  \ 'ξ': ['xi'],
	  \ 'π': ['pi'],
	  \ 'ϖ': ['varpi'],
	  \ 'ρ': ['rho'],
	  \ 'ϱ': ['varrho'],
	  \ 'σ': ['sigma','sg'],
	  \ 'ς': ['varsigma'],
	  \ 'τ': ['tau'],
	  \ 'υ': ['upsilon','ups'],
	  \ 'φ': ['phi'],
	  \ 'ϕ': ['varphi','ph'],
	  \ 'χ': ['chi'],
	  \ 'ψ': ['psi'],
	  \ 'ω': ['omega','omg'],
	  \ 'Γ': ['Gamma','Gm'],
	  \ 'Δ': ['Delta','Dt'],
	  \ 'Θ': ['Theta','Th'],
	  \ 'Λ': ['Lambda','La'],
	  \ 'Ξ': ['Xi'],
	  \ 'Π': ['Pi'],
	  \ 'Σ': ['Sigma','Sg'],
	  \ 'Υ': ['Upsilon','Ups'],
	  \ 'Φ': ['Phi'],
	  \ 'Χ': ['Chi'],
	  \ 'Ψ': ['Psi'],
	  \ 'Ω': ['Omega','Omg'],
	  \ }	"}}}
    for [cchar, names] in items(s:GreekList)
      for name in names
	exe 'syn match texGreek ''\\'.name.'\a\@!'' contained conceal cchar='.cchar
      endfor
    endfor
  endif

  " Superscripts/Subscripts {{{1
  if s:tex_conceal =~# 's'
    if s:tex_fast =~# 's'
      syn region texSuperscript	matchgroup=Delimiter start='\^{'	skip="\\\\\|\\[{}]" end='}'	contained contains=texSpecialChar,texSuperscripts,texStatement,texSubscript,texSuperscript,texMathMatcher,texGreek,texMathSymbol
      syn region texSubscript	matchgroup=Delimiter start='_{'		skip="\\\\\|\\[{}]" end='}'	contained contains=texSpecialChar,texSubscripts,texStatement,texSubscript,texSuperscript,texMathMatcher,texGreek,texMathSymbol
    endif
    " s:SuperSub:
    fun! s:SuperSub(group,leader,pat,cchar)
      if a:pat =~# '^\\' || (a:leader == '\^' && a:pat =~# s:tex_superscripts) || (a:leader == '_' && a:pat =~# s:tex_subscripts)
	"     call Decho("SuperSub: group<".a:group."> leader<".a:leader."> pat<".a:pat."> cchar<".a:cchar.">")
	exe 'syn match '.a:group." '".a:leader.a:pat."' contained conceal cchar=".a:cchar
	"exe 'syn match '.a:group."s '".a:pat        ."' contained conceal cchar=".a:cchar.' nextgroup='.a:group.'s'
      endif
    endfun
    call s:SuperSub('texSuperscript','\^','0','⁰') "{{{
    call s:SuperSub('texSuperscript','\^','1','¹')
    call s:SuperSub('texSuperscript','\^','2','²')
    call s:SuperSub('texSuperscript','\^','3','³')
    call s:SuperSub('texSuperscript','\^','4','⁴')
    call s:SuperSub('texSuperscript','\^','5','⁵')
    call s:SuperSub('texSuperscript','\^','6','⁶')
    call s:SuperSub('texSuperscript','\^','7','⁷')
    call s:SuperSub('texSuperscript','\^','8','⁸')
    call s:SuperSub('texSuperscript','\^','9','⁹')
    call s:SuperSub('texSuperscript','\^','a','ᵃ')
    call s:SuperSub('texSuperscript','\^','b','ᵇ')
    call s:SuperSub('texSuperscript','\^','c','ᶜ')
    call s:SuperSub('texSuperscript','\^','d','ᵈ')
    call s:SuperSub('texSuperscript','\^','e','ᵉ')
    call s:SuperSub('texSuperscript','\^','f','ᶠ')
    call s:SuperSub('texSuperscript','\^','g','ᵍ')
    call s:SuperSub('texSuperscript','\^','h','ʰ')
    call s:SuperSub('texSuperscript','\^','i','ⁱ')
    call s:SuperSub('texSuperscript','\^','j','ʲ')
    call s:SuperSub('texSuperscript','\^','k','ᵏ')
    call s:SuperSub('texSuperscript','\^','l','ˡ')
    call s:SuperSub('texSuperscript','\^','m','ᵐ')
    call s:SuperSub('texSuperscript','\^','n','ⁿ')
    call s:SuperSub('texSuperscript','\^','o','ᵒ')
    call s:SuperSub('texSuperscript','\^','p','ᵖ')
    call s:SuperSub('texSuperscript','\^','r','ʳ')
    call s:SuperSub('texSuperscript','\^','s','ˢ')
    call s:SuperSub('texSuperscript','\^','t','ᵗ')
    call s:SuperSub('texSuperscript','\^','u','ᵘ')
    call s:SuperSub('texSuperscript','\^','v','ᵛ')
    call s:SuperSub('texSuperscript','\^','w','ʷ')
    call s:SuperSub('texSuperscript','\^','x','ˣ')
    call s:SuperSub('texSuperscript','\^','y','ʸ')
    call s:SuperSub('texSuperscript','\^','z','ᶻ')
    call s:SuperSub('texSuperscript','\^','A','ᴬ')
    call s:SuperSub('texSuperscript','\^','B','ᴮ')
    call s:SuperSub('texSuperscript','\^','D','ᴰ')
    call s:SuperSub('texSuperscript','\^','E','ᴱ')
    call s:SuperSub('texSuperscript','\^','G','ᴳ')
    call s:SuperSub('texSuperscript','\^','H','ᴴ')
    call s:SuperSub('texSuperscript','\^','I','ᴵ')
    call s:SuperSub('texSuperscript','\^','J','ᴶ')
    call s:SuperSub('texSuperscript','\^','K','ᴷ')
    call s:SuperSub('texSuperscript','\^','L','ᴸ')
    call s:SuperSub('texSuperscript','\^','M','ᴹ')
    call s:SuperSub('texSuperscript','\^','N','ᴺ')
    call s:SuperSub('texSuperscript','\^','O','ᴼ')
    call s:SuperSub('texSuperscript','\^','P','ᴾ')
    call s:SuperSub('texSuperscript','\^','R','ᴿ')
    call s:SuperSub('texSuperscript','\^','T','ᵀ')
    call s:SuperSub('texSuperscript','\^','U','ᵁ')
    call s:SuperSub('texSuperscript','\^','W','ᵂ')
    call s:SuperSub('texSuperscript','\^',',','︐')
    call s:SuperSub('texSuperscript','\^',':','︓')
    call s:SuperSub('texSuperscript','\^',';','︔')
    call s:SuperSub('texSuperscript','\^','+','⁺')
    call s:SuperSub('texSuperscript','\^','-','⁻')
    call s:SuperSub('texSuperscript','\^','<','˂')
    call s:SuperSub('texSuperscript','\^','>','˃')
    call s:SuperSub('texSuperscript','\^','/','ˊ')
    call s:SuperSub('texSuperscript','\^','(','⁽')
    call s:SuperSub('texSuperscript','\^',')','⁾')
    call s:SuperSub('texSuperscript','\^','\.','˙')
    call s:SuperSub('texSuperscript','\^','=','˭')
    call s:SuperSub('texSubscript','_','0','₀')
    call s:SuperSub('texSubscript','_','1','₁')
    call s:SuperSub('texSubscript','_','2','₂')
    call s:SuperSub('texSubscript','_','3','₃')
    call s:SuperSub('texSubscript','_','4','₄')
    call s:SuperSub('texSubscript','_','5','₅')
    call s:SuperSub('texSubscript','_','6','₆')
    call s:SuperSub('texSubscript','_','7','₇')
    call s:SuperSub('texSubscript','_','8','₈')
    call s:SuperSub('texSubscript','_','9','₉')
    call s:SuperSub('texSubscript','_','a','ₐ')
    call s:SuperSub('texSubscript','_','e','ₑ')
"   call s:SuperSub('texSubscript','_','h','ₕ')
    call s:SuperSub('texSubscript','_','i','ᵢ')
    call s:SuperSub('texSubscript','_','j','ⱼ')
"   call s:SuperSub('texSubscript','_','k','ₖ')
"   call s:SuperSub('texSubscript','_','l','ₗ')
"   call s:SuperSub('texSubscript','_','m','ₘ')
"   call s:SuperSub('texSubscript','_','n','ₙ')
    call s:SuperSub('texSubscript','_','o','ₒ')
"   call s:SuperSub('texSubscript','_','p','ₚ')
    call s:SuperSub('texSubscript','_','r','ᵣ')
"   call s:SuperSub('texSubscript','_','s','ₛ')
"   call s:SuperSub('texSubscript','_','t','ₜ')
    call s:SuperSub('texSubscript','_','u','ᵤ')
    call s:SuperSub('texSubscript','_','v','ᵥ')
    call s:SuperSub('texSubscript','_','x','ₓ')
    call s:SuperSub('texSubscript','_',',','︐')
    call s:SuperSub('texSubscript','_','+','₊')
    call s:SuperSub('texSubscript','_','-','₋')
    call s:SuperSub('texSubscript','_','/','ˏ')
    call s:SuperSub('texSubscript','_','(','₍')
    call s:SuperSub('texSubscript','_',')','₎')
"   call s:SuperSub('texSubscript','_','\.','‸')
    call s:SuperSub('texSubscript','_','r','ᵣ')
    call s:SuperSub('texSubscript','_','v','ᵥ')
    call s:SuperSub('texSubscript','_','x','ₓ')
    call s:SuperSub('texSubscript','_','\\beta\a\@!' ,'ᵦ')
    call s:SuperSub('texSubscript','_','\\bt\a\@!' ,'ᵦ')
    call s:SuperSub('texSubscript','_','\\delta\a\@!','ᵨ')
    call s:SuperSub('texSubscript','_','\\dt\a\@!','ᵨ')
    call s:SuperSub('texSubscript','_','\\psi\a\@!'  ,'ᵩ')
    call s:SuperSub('texSubscript','_','\\gamma\a\@!','ᵧ')
    call s:SuperSub('texSubscript','_','\\gm\a\@!','ᵧ')
    call s:SuperSub('texSubscript','_','\\chi\a\@!'  ,'ᵪ') "}}}

    delfun s:SuperSub
  endif

  " Accented characters and Ligatures: {{{1
  if s:tex_conceal =~# 'a'
    if b:tex_stylish
      syn match texAccent		"\\[bcdvuH][^a-zA-Z@]"me=e-1
      syn match texLigature	"\\\([ijolL]\|ae\|oe\|ss\|AA\|AE\|OE\)[^a-zA-Z@]"me=e-1
      syn match texLigature	'--'
      syn match texLigature	'---'
    else
      fun! s:Accents(chr,...)
	let i = 1
	for accent in ["`","\\'","^",'"','\~','\.','=',"c","H","k","r","u","v"]
	  if i > a:0
	    break
	  endif
	  if strlen(a:{i}) == 0 || a:{i} == ' ' || a:{i} == '?'
	    let i = i + 1
	    continue
	  endif
	  if accent =~# '\a'
	    exe "syn match texAccent '".'\\'.accent.'\(\s*{'.a:chr.'}\|\s\+'.a:chr.'\)'."' conceal cchar=".a:{i}
	  else
	    exe "syn match texAccent '".'\\'.accent.'\s*\({'.a:chr.'}\|'.a:chr.'\)'."' conceal cchar=".a:{i}
	  endif
	  let i = i + 1
	endfor
      endfun
      "                  \`  \'  \^  \"  \~  \.  \=  \c  \H  \k  \r  \u  \v	{{{
      call s:Accents('a','à','á','â','ä','ã','ȧ','ā',' ',' ','ą','å','ă','ǎ')
      call s:Accents('A','À','Á','Â','Ä','Ã','Ȧ','Ā',' ',' ','Ą','Å','Ă','Ǎ')
      call s:Accents('c',' ','ć','ĉ',' ',' ','ċ',' ','ç',' ',' ',' ',' ','č')
      call s:Accents('C',' ','Ć','Ĉ',' ',' ','Ċ',' ','Ç',' ',' ',' ',' ','Č')
      call s:Accents('d',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','ď')
      call s:Accents('D',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','Ď')
      call s:Accents('e','è','é','ê','ë','ẽ','ė','ē','ȩ',' ','ę',' ','ĕ','ě')
      call s:Accents('E','È','É','Ê','Ë','Ẽ','Ė','Ē','Ȩ',' ','Ę',' ','Ĕ','Ě')
      call s:Accents('g',' ','ǵ','ĝ',' ',' ','ġ',' ','ģ',' ',' ',' ','ğ','ǧ')
      call s:Accents('G',' ','Ǵ','Ĝ',' ',' ','Ġ',' ','Ģ',' ',' ',' ','Ğ','Ǧ')
      call s:Accents('h',' ',' ','ĥ',' ',' ',' ',' ',' ',' ',' ',' ',' ','ȟ')
      call s:Accents('H',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','Ȟ')
      call s:Accents('i','ì','í','î','ï','ĩ','į','ī',' ',' ','į',' ','ĭ','ǐ')
      call s:Accents('I','Ì','Í','Î','Ï','Ĩ','İ','Ī',' ',' ','Į',' ','Ĭ','Ǐ')
      call s:Accents('J',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ','ǰ')
      call s:Accents('k',' ',' ',' ',' ',' ',' ',' ','ķ',' ',' ',' ',' ','ǩ')
      call s:Accents('K',' ',' ',' ',' ',' ',' ',' ','Ķ',' ',' ',' ',' ','Ǩ')
      call s:Accents('l',' ','ĺ','ľ',' ',' ',' ',' ','ļ',' ',' ',' ',' ','ľ')
      call s:Accents('L',' ','Ĺ','Ľ',' ',' ',' ',' ','Ļ',' ',' ',' ',' ','Ľ')
      call s:Accents('n',' ','ń',' ',' ','ñ',' ',' ','ņ',' ',' ',' ',' ','ň')
      call s:Accents('N',' ','Ń',' ',' ','Ñ',' ',' ','Ņ',' ',' ',' ',' ','Ň')
      call s:Accents('o','ò','ó','ô','ö','õ','ȯ','ō',' ','ő','ǫ',' ','ŏ','ǒ')
      call s:Accents('O','Ò','Ó','Ô','Ö','Õ','Ȯ','Ō',' ','Ő','Ǫ',' ','Ŏ','Ǒ')
      call s:Accents('r',' ','ŕ',' ',' ',' ',' ',' ','ŗ',' ',' ',' ',' ','ř')
      call s:Accents('R',' ','Ŕ',' ',' ',' ',' ',' ','Ŗ',' ',' ',' ',' ','Ř')
      call s:Accents('s',' ','ś','ŝ',' ',' ',' ',' ','ş',' ','ȿ',' ',' ','š')
      call s:Accents('S',' ','Ś','Ŝ',' ',' ',' ',' ','Ş',' ',' ',' ',' ','Š')
      call s:Accents('t',' ',' ',' ',' ',' ',' ',' ','ţ',' ',' ',' ',' ','ť')
      call s:Accents('T',' ',' ',' ',' ',' ',' ',' ','Ţ',' ',' ',' ',' ','Ť')
      call s:Accents('u','ù','ú','û','ü','ũ',' ','ū',' ','ű','ų','ů','ŭ','ǔ')
      call s:Accents('U','Ù','Ú','Û','Ü','Ũ',' ','Ū',' ','Ű','Ų','Ů','Ŭ','Ǔ')
      call s:Accents('w',' ',' ','ŵ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ')
      call s:Accents('W',' ',' ','Ŵ',' ',' ',' ',' ',' ',' ',' ',' ',' ',' ')
      call s:Accents('y','ỳ','ý','ŷ','ÿ','ỹ',' ',' ',' ',' ',' ',' ',' ',' ')
      call s:Accents('Y','Ỳ','Ý','Ŷ','Ÿ','Ỹ',' ',' ',' ',' ',' ',' ',' ',' ')
      call s:Accents('z',' ','ź',' ',' ',' ','ż',' ',' ',' ',' ',' ',' ','ž')
      call s:Accents('Z',' ','Ź',' ',' ',' ','Ż',' ',' ',' ',' ',' ',' ','Ž')
      call s:Accents('\\i','ì','í','î','ï','ĩ','į',' ',' ',' ',' ',' ','ĭ',' ')
      "                    \`  \'  \^  \"  \~  \.  \=  \c  \H  \k  \r  \u  \v	}}}
      delfun s:Accents
      syn match texAccent		'\\aa\a\@!'	conceal cchar=å
      syn match texAccent		'\\AA\a\@!'	conceal cchar=Å
      syn match texAccent		'\\o\a\@!'		conceal cchar=ø
      syn match texAccent		'\\O\a\@!'		conceal cchar=Ø
      syn match texLigature	'\\AE\a\@!'	conceal cchar=Æ
      syn match texLigature	'\\ae\a\@!'	conceal cchar=æ
      syn match texLigature	'\\oe\a\@!'	conceal cchar=œ
      syn match texLigature	'\\OE\a\@!'	conceal cchar=Œ
      syn match texLigature	'\\ss\a\@!'	conceal cchar=ß
      syn match texLigature	'--'		conceal cchar=–
      syn match texLigature	'---'		conceal cchar=—
    endif
  endif

  " }}}1
endif

setlocal conceallevel=1
hi clear Conceal
syn clear texSuperscripts
syn clear texSubscripts

" vim: ts=8
