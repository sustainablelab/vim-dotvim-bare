" Vim keymap file for annotating NERDTree directory structure, engineering
" symbols like plus/minus and degree, and who knows what else!
" Maintainer: Mike Gazes <sustainablelab@gmail.com>
" Created: 2018-02-24
" Last Changed: 2018-02-4

" ---Installation---
	" Place this file in a 'keymap' folder in the runtimepath.
	" For example, if ~/.vim is in the runtimepath:
	" $ mkdir ~/.vim/keymap/
	" $ cp /tmp/symbols.vim ~/.vim/keymap/symbols.vim
" ---Add Symbols---
	" Separate shortcut and symbol with a tab:
	" :set noexpandtab	-	<Tab> inserts a tab
	" :set expandtab	-	<Tab> inserts spaces
    " Update the current session to use the latest version of this file:
    " :set keymap=symbols
	" Example:
	"dae	i_<C-b>u25b8
	" I mapped <C-v> to <C-b>.
	" Off-the-shelf Vim would use i_<C-v>u25b8
" ---Usage---
	" i			-	enter insertmode
	"				status line shows: --- INSERT ---
	" Ctrl-^	-	status line shows: --- INSERT (sym) ---
	" deg		-	places '°' instead of 'deg'
" ---< Alternative Digraph >---
	" An alternative to entering `INSERT (sym)` mode is to use digraphs:
	" Ctrl-k		status line shows: --- INSERT --- and at the right: ^K
	" Try a digraph:
	" m* is μ
	" n* is ν
	" a* is α
	" To find out the digraph for a symbol that is already on the screen:
	" - Place cursor on the symbol
	" - :as (short for :ascii)
	" - Off-the-shelf Vim also has shortcut ga, but this is remapped by the
	"   EasyAlgin plugin
" ---Add Symbols To This File---


" Use this short name in the status line.
let b:keymap_name = "sym"

loadkeymap
deg	°
a1	ā
a2	á
a3	ǎ
a4	à
e1	ē
e2	é
e3	ě
e4	è
i1	ī
i2	í
i3	ǐ
i4	ì
o1	ō
o2	ó
o3	ǒ
o4	ò
u1	ū
u2	ú
u3	ǔ
u4	ù
" αβγδεζηθικλμνξοπρςστυφχψω
alpha	α
ALPHA	Α
beta	β
BETA	Β
gamma	γ
GAMMA	Γ
delta	δ
DELTA	Δ
epsilon	ε
EPSILON	Ε
phi	ϕ
PHI	Φ
CHI	Χ
chi	χ
rho	ρ
RHO	Ρ
zeta	ζ
ZETA	Ζ
eta	η
ETA	Η
theta	θ
THETA	Θ
mu	µ
nu	ν
pi	π
ohm	Ω
lambda	λ
aumlaut	ä
eumlaut	ë
iumlaut	ï
oumlaut	ö
uumlaut	ü
pm	±
leq	≤
geq	≥
neq	≠
iseq	≟
eqq	≡
approx	≈
tim	∗
dia	⌀
half	½
squared	²
third	³
lar	← "[l]eft [ar]row
aru	↑ "[ar]row [u]p
arr	→ "[ar]row [r]ight
ard	↓ "[ar]row [d]own
arl	← "[ar]row [l]eft
baru	▲ "[b]ig [ar]row [u]p
barr	▶ "[b]ig [ar]row [r]ight
bard	▼ "[b]ig [ar]row [d]own
barl	◀ "[b]ig [ar]row [l]eft
dae	▸ "[d]irectory [a]rrow [e]xpandable
dac	▾ "[d]irectory [a]rrow [c]ollapsible
bdr	┌ "[b]ox [d]own [r]ight
bdl	┐ "[b]ox [d]own [l]eft
bur └ "[b]ox [u]p   [r]ight
bul	┘ "[b]ox [u]p   [l]eft
bh	─ "[b]ox [h]orizontal [h]
bv	│ "[b]ox [v]ertical   [v]
brd	┬ "[br]anch [d]own
bru	┴ "[br]anch [u]p
brr	├ "[br]anch [r]ight
brl	┤ "[br]anch [l]eft
brc	┼ "[br]anch [c]ross
Dlv	┆ "[D]ashed [l]ight [v]ertical
Dlh	┄ "[D]ashed [l]ight [h]orizontal
Dhv	┇ "[D]ashed [h]eavy [v]ertical
Dhh	┅ "[D]ashed [h]eavy [h]orizontal
dlv	┊ "[d]ot    [l]ight [v]ertical
dlh	┈ "[d]ot    [l]ight [h]orizontal
dhv	┋ "[d]ot    [h]eavy [v]ertical
dhh	┉ "[d]ot    [h]eavy [h]orizontal
ddr	┏ "[d]ot [d]own [r]ight
ddl	┓ "[d]ot [d]own [l]eft
dur ┗ "[d]ot [u]p   [r]ight
dul	┛ "[d]ot [u]p   [l]eft
dot	●
"	─━│┃┄┅┆┇┈┉┊┋┌┍┎┏┐┑┒┓└┕┖┗┘┙┚┛┛├┝┞┟┠┡┢┣┤┥┦┦┗┘┙┚┛├┝┞
"2500123456789abcdef
"	┐┑┒┓└┕┖┗┘┙┚┛├┝┞┟
"2510123456789abcdef
"	┠┡┢┣┤┥┦┧┨┩┪┫┬┭┮┯
"2520123456789abcdef
"	┰┱┲┳┴┵┶┷┸┹┺┻┼┽┾┿
"2530123456789abcdef
"	←↑→↓↔↕↖↗↘↙↚↛↜↝↞↟↠↡↢
"2190123456789abcdef
"	↠↡↢
"21a012
