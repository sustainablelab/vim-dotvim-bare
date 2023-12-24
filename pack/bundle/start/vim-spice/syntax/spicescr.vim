" My SPICE scr syntax file.{{{
" See example of a good syntax file:
" /usr/share/vim/vim82/syntax/c.vim
" /usr/local/share/vim/vim90/syntax/c.vim
" See online example:
" https://vim.fandom.com/wiki/Creating_your_own_syntax_files#Install_the_syntax_file
"}}}

" Vim syntax file
" Language:	SPICE
" Maintainer:	Mike Gazes <sustainablelab@gmail.com>
" Last Change:	2022 Oct 25
" TODO: deal with nested parentheses

" Quit when a (custom) syntax file was already loaded
" Cobol uses .lib. Forget Cobol.
if exists("b:current_syntax") && (&filetype != "cobol")
    finish
endif

" SPICE directives I use
syn keyword	spicescrCommand	 title include subckt ends tran end dc pwl uic
syn keyword	spicescrNgspice	 control endc while le let set plot alter run write ngbehavior color0 color1 color2 color3 color4 color5 color6 color7 color8 color9
" SPICE GND node (0)
syn keyword     spicescrGND GND
" Stuff in parentheses
syn region spicescrParens	start="(" end=")"
" RGB colors
syn region spicescrRGBString	start="\"" end="\"" contains=spicescrRGB
syn match spicescrRGB "#"
" SPICE comments
syn region spicescrComment	start="^*" end="$" contains=spicescrTodo,spicescrLessSpecial,spicescrString,spicescrMyFiles
syn region spicescrComment	start="#" end="$" contains=spicescrTodo,spicescrLessSpecial,spicescrString,spicescrMyFiles
" Special words that show up in comments, like TODO
syn keyword spicescrTodo	contained TODO USAGE
" Less special words that show up in comments
syn keyword spicescrLessSpecial	contained Author SPICE

" Numbers
syn match spicescrNumber "\d\+"
syn match spicescrEquals "="
" syn match spicescrOp "!^[*+-/]"
syn match spicescrSuffix "\d\+[kKmMuUnN]"
syn match spicescrSuffix "\d\+meg"
syn match spicescrSuffix "\d\+Meg"
syn match spicescrSuffix "\d\+MEG"

" Match file names ending in .cir and .lib
" \< is beginning of word
" \i is the first allowed identifier character after the word starts
" \+ requires one or more matches of \i
" syn match spicescrMyFiles      "\"\<\i\+\.cir\""
" syn match spicescrMyFiles      "\"\<\i\+\.lib\""
syn match spicescrMyFiles      "\".*\.cir\""
syn match spicescrMyFiles      "\".*\.lib\""
syn match spicescrMyFiles      "\".*\.LIB\""

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link spicescrNumber			Constant
hi def link spicescrEquals			Constant
hi def link spicescrOp				Constant
hi def link spicescrGND				WarningMsg
hi def link spicescrCommand			Statement
hi def link spicescrComment			Comment
hi def link spicescrSuffix			Constant
hi def link spicescrParens			Constant
hi def link spicescrMyFiles			Title
hi def link spicescrNgspice			texStatement
hi def link spicescrRGB				Constant
hi def link spicescrRGBString			String
hi def link spicescrTodo			Todo
hi def link spicescrLessSpecial			SpellBad
hi def link spicescrString			String

let b:current_syntax = "spicescr"

" vim: ts=8
