" Add syntax highlighting for Obsidian wiki-style links: [[ ]]{{{
syn region wikiLinkText matchgroup=wikiLinkTextDelimiter start="\[\[" end="\]\]"
hi! def link wikiLinkText                  markdownLinkText
"}}}

" Turn off italic highlighting so that `_` does not turn my Vim text bold. {{{
" See https://www.markdownguide.org/basic-syntax for what _ means.
" The portable way to do this is to simply backslash escape the `_` like this:{{{
"
"   \_
"
" So the file name _0_LEFT-OFF.md becomes:
"
"   \_0\_LEFT-OFF.md
"}}}
" Note: this section of my .vimrc was messing with markdown appearance:{{{
"
" ---
" augroup vimrc
"     au!
"     ...
"     au BufEnter *
" ---
"
" In that section, I had to comment out lines that set highlighting for SpellBad
" and SpellLocal.
"}}}
" ORIGINAL
" hi! def link markdownItalic                htmlItalic
" hi def link markdownItalicDelimiter       markdownItalic
" OVERRIDE
" hi! def link markdownItalic                Normal
" hi! def link markdownItalicDelimiter       Normal
"}}}
