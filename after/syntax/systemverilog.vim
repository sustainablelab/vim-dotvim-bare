" Instructions{{{
" Put cursor on word in .sv file.
" ;hi - find out which syntax file (verilog v systemVerilog) and what group
" Open those files in: /usr/share/vim/vim82/syntax/
" Use examples below to define new syntax highlighting groups.
"   Remember to use ! to override existing grouping.
"   Save this file.
"   Hit :e in the .sv file to see the changes reflected.
"}}}

" Syntax highlighting{{{
" Operator{{{
" ORIGINAL
" hi def link verilogOperator        Special
" OVERRIDE
hi! def link verilogOperator        SpecialChar
"}}}
" Label{{{
" verilogLabel: begin end
" ORIGINAL -- red
" hi! def link verilogLabel           Label
" OVERRIDE -- bold blue
hi! def link verilogLabel           replPrompt
"}}}
" Statement{{{
" verilogStatement: module endmodule initial input output always ...
" systemverilogStatement ONLY EFFECTS: logic bit byte
" ORIGINAL
hi! def link verilogStatement       Statement
" OVERRIDE
" hi! def link verilogStatement       Constant
" ORIGINAL
hi! def link systemverilogStatement       Statement
" OVERRIDE
" hi! def link systemverilogStatement       Constant
"}}}
"}}}

" Folding -- requires :set fdm=syntax{{{
" TODO: figure out how to fold blocks (like module/endmodule)
" Comments{{{
syn region  verilogComment start="/\*" end="\*/" contains=verilogTodo,@Spell fold
" }}}
" }}}
