" My EAGLE scr syntax file.{{{
" See example of a good syntax file:
" /usr/share/vim/vim82/syntax/c.vim
" See online example:
" https://vim.fandom.com/wiki/Creating_your_own_syntax_files#Install_the_syntax_file
"}}}

" Vim syntax file
" Language:	EAGLE script
" Maintainer:	Mike Gazes <sustainablelab@gmail.com>
" Last Change:	2022 Feb 10
" TODO: In EAGLE command: "ADD lt1175" <-- make the "1175" NOT highlight as an eaglescrNumber

" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

" EAGLE commands I use
syn keyword	eaglescrCommand	EDIT GRID GROUP LAYER CHANGE PREFIX DESCRIPTION VALUE ADD PACKAGE TECHNOLOGY LINE CIRCLE TEXT SMD CONNECT DELETE ATTRIBUTE
" EAGLE command options I use for the commands I use
syn keyword eaglescrOptions	ON OFF SIZE RATIO ALL
syn keyword eaglescrLabel	width mm in mil
" EAGLE strings
syn region eaglescrString	start=+'+ end=+'+ contains=eaglescrNotAt
" syn region eaglescrString	start=+"+ end=+"+
syn match eaglescrMouse "C>"
syn match eaglescrNotAt "[!@]"
" Stuff in parentheses
syn region eaglescrParens	start="(" end=")" contains=eaglescrMouse
" Numbers
syn match eaglescrNumber "\d\+"

" EAGLE comments
syn region eaglescrComment	start="#" end="$" contains=eaglescrTodo,eaglescrLessSpecial,eaglescrString,eaglescrMyFiles
" Special words that show up in comments, like TODO
syn keyword eaglescrTodo	contained TODO USAGE
" Less special words that show up in comments
syn keyword eaglescrLessSpecial	contained Author EAGLE

" Match file names ending in -pkg.scr and -dev.scr
" \< is beginning of word
" \i is the first allowed identifier character after the word starts
" \+ requires one or more matches of \i
syn match eaglescrMyFiles      "\<\i\+-pkg\.scr"
syn match eaglescrMyFiles      "\<\i\+-dev\.scr"

" Define the default highlighting.
" Only used when an item doesn't have highlighting yet
hi def link eaglescrCommand		Statement
hi def link eaglescrOptions		Constant
hi def link eaglescrLabel		PreProc
hi def link eaglescrString		String
hi def link eaglescrComment		Comment
hi def link eaglescrParens		Constant
hi def link eaglescrNumber		Constant
hi def link eaglescrTodo		Todo
hi def link eaglescrLessSpecial		SpellBad
hi def link eaglescrMouse		SpecialChar
hi def link eaglescrNotAt		SpecialChar
hi def link eaglescrMyFiles		texStatement

let b:current_syntax = "eaglescr"

" vim: ts=8

