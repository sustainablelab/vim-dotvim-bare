" Custom Vim settings.
" Date: 2018-01-03
" Reduced: 2023-12-22

set modeline        " Override security on Ubuntu
set modelines=5     " Override security on Ubuntu
set nocompatible " Do not bother being compatible with Vi.
set shell=bash " Use bash instead of sh for :term
set noequalalways " Do not make windows the same size after a split or a close
set sessionoptions-=options " Do not save mappings with :mks blah.vim
set sessionoptions+=localoptions " Do save wrap / nowrap
set title   " Show filename in GUI window title bar
set ruler " Show cursors position (row,col).
set scrolloff=0 " Normal zt/zb behavior. Cursor allowed to go to top/bottom of screen.
set cmdheight=3 " Set number of screenlines used for the command-line ( use >= 2)
set previewheight=6 " Height of preview window (default is 12).
set showcmd " Show current command in lower right corner.
set showmode " Show which mode you are in (e.g., displays -- INSERT --)
set splitright " Vertical splits open on the right. No affect on NERDTree :)
" Do not search other loaded buffers or unloaded buffers for completions.{{{
set complete=.,w,t,i " default is ".,w,b,u,t,i", eliminate options b and u
" }}}
" Persistent undo files {{{
set undofile
" Make undo history persistent across file open/close.
" This is super-important without a version control system to idiot-proof.
"}}}
" Turn on spell-check {{{
set spelllang=en_us
set spell
" see :h spell for shortcuts{{{
" ]s go to next bad word, [s go to previous bad word
" ]S [S only go to bad words, skipping over things like good words that are
" not capitalized even though Vim thinks they are the start of a sentence.
" zg add word to dictionary
" zG add word to dictionary for the the local buffer only
" z= with the cursor on a bad word shows alternative spellings
"}}}
" Turn off spell checking:{{{
" setlocal nospell
" Autocommands (like BufEnter) set colorscheme.
" This turns off highlighting.
" Avoid this by adding a `hi SpellBad` command to the autocommand
"}}}
" Highlighting of misspelled words {{{
highlight SpellBad cterm=underline,bold ctermfg=6
highlight SpellLocal cterm=underline,bold ctermfg=5 ctermbg=232
" See how misspelled words are highlighted
" :hi SpellBad
"}}}
"}}}
" Allow the use of unicode codepoints (digraphs) {{{
set encoding=utf-8
"}}}
" Enable syntax highlighting {{{
syntax enable
"}}}
" Turn on doxygen syntax highlighting {{{
let g:load_doxygen_syntax=1
"}}}
" Turn on plugin `echodoc`{{{
let g:echodoc#enable_at_startup=1
" Displays function signatures from completions in the command line.
"}}}
" Textwidth (column number for hard wrapping){{{
set textwidth=80 " Text hardwraps here.{{{
" See :h gq}}}
set formatoptions=croqtj "{{{
" :set formatoptions
" See :h fo-table.
" : default: formatoptions=croql
" l - Long lines are not broken in insert mode: When a line was
"     longer than 'textwidth' when the insert command started,
"     Vim does not automatically format it.
" t - Auto-wrap text using textwidth
" j - Where it makes sense, remove a comment leader when joining
"     lines.
"}}}
"}}}
" Make cursor grey in normal mode and white in insert mode{{{
" See :h modifyOtherKeys
" See :h terminal-options
" Default values:
" let &t_TI = "\<Esc>[>4;2m"
" let &t_TE = "\<Esc>[>4;m"
" See :h termcap-cursor-color
let &t_SI = "\<Esc>]12;white\x7"
let &t_SR = "\<Esc>]12;white\x7"
let &t_EI = "\<Esc>]12;grey\x7"
" let &t_EI = "\<Esc>]12;black\x7"
" let &t_EI = "\<Esc>]12;purple\x7"
" let &t_EI = "\<Esc>]12;red\x7"
" let &t_EI = "\<Esc>]12;blue\x7"
"}}}
set colorcolumn=+1 " Put a vertical line 1 column after the textwidth.
" Highlight cursor line and column {{{
" Highlight which line the cursor is on{{{
" set nocursorline - to differentiate whitespace on this line
set cursorline
"}}}
" highlight which column the cursor is in{{{
set cursorcolumn
" :h cursorcolumn - see :h highlight-groups - :h hl-ColorColumn
" :hi ColorColumn
" ColorColumn   xxx term=reverse ctermbg=233 guibg=#1c1b1a
" :hi CursorColumn
" CursorColumn   xxx term=reverse ctermbg=234 guibg=#242321
" :hi QuickFixLine   xxx links to Search
" :hi Search   xxx term=reverse cterm=bold ctermfg=16 ctermbg=221 gui=bold
"
" Change colors:
" Add colors for QuickFixLine to badwolf.vim:
"   call s:HL('QuickFixLine', 'dress', 'darkgravel', 'none')
" Set color of CursorColumn:
"   call s:HL('CursorColumn', '', 'darkgravel')
"
"}}}
"}}}
" Status line (file path at bottom of window){{{
" Status line on/off{{{
set laststatus=2 " I like status lines. I kept hitting <C-g>.
" 2: always
" 1: only if there are at least two windows (default)
" 0: never
"}}}
" Status line content{{{
set statusline=
" Leaving this empty uses the Vim default.
" TODO: taylor the statusline content
"}}}
"}}}
" Limit to 300 columns checked for syntax highlighting {{{
set synmaxcol=300
" Default is column 3000.
" I have an autocmd to reduce this even more for c and cpp files.
" TODO: use s:g_synmaxcol to restore synmaxcol after leaving c and cpp buffers.
let s:g_synmaxcol = 300
" Reducing synmaxcol fixes slow scroll in my .vimrc.
" See files:{{{
"command		file ~
":syntax enable	$VIMRUNTIME/syntax/syntax.vim
":syntax on		$VIMRUNTIME/syntax/syntax.vim
":syntax manual	$VIMRUNTIME/syntax/manual.vim
":syntax off		$VIMRUNTIME/syntax/nosyntax.vim
" See :h syntax-loading}}}
" For slow typing in large markdown files, the issue is folding:{{{
" Markdown files load with fold-expr.
" Use mapping ;zm to switch to fold-manual. Fold calculation stops.
" You have to hammer ;zm every time you come back to the buffer.
" Hammer ;ze to go back to fold calculation (fold-expr).}}}
"}}}
set magic
set hlsearch " Hightlight search matches
set incsearch " Highlight search expressions as you type.
" Match with smartcase{{{
set ignorecase smartcase
" Matches any case if all lowercase is used in the regex,
" but matches exact case if any uppercase is used.
" Alternatively, on a case-by-case basis, precede the search with:
" set ignorecase
" set noignorecase
" But if doing that, just use \c and \C in the search, for example:
" /\cBackblaze  -   finds 'backblaze' or 'Backblaze'
" /\CBackblaze  -   only finds 'Backblaze'
"}}}


" Set the search path used by :find and gf and autocomplete {{{
" set path=.,/usr/include,,
set path=.
set path+=**
" ** recurses in pwd for {{{
" Example:
" `:find Makef{tab-complete-for-wildmenu}`
" Example:
" `:find *spi-out.{tab-complete-for-wildmenu}`
" `*` is wild
" but `.` is just `.`, not regex magic
" }}}
" Default path: path=.,/usr/include,,** {{{
let default_path=&path
" I need to set the default path directly so that sourcing my vimrc does not
" add paths every time.
" Restore the default path with:
" let &path=default_path
" }}}
" How to add paths:{{{
" Add paths so Vim can find files with :find
" The path must be a folder. If you give Vim a path to a file, it will not
" be able to find it!
" The path can end with nothing '', or '/' or '/.' They are all equivalent.
" End the path with ** to allow recursive dives.
" Syntax:
" let path_alias='your_POSIX_path_here\ with_backslash_to\ escape \spaces'
" let &path = &path . ',' . path_alias
" }}}
" Multiple results for :find {{{
" gf and :find open the first match.
" Use [count]gf or [count];wf to open a specific match.
" Example: gf on stdbool.h opens the clang version, 2gf opens the gcc
" version, and 3gf opens the g++ version.
"}}}
"}}}
" I don't need to put this on path because I make IMGUI a Git
" submodule in my project.
let &path = &path . ',' . '/usr/include/'

" Use `tags` for `ft-c-omni` (auto-complete and tag-jumping using `tags` file)
set tags=./tags,tags,

set wildmenu " display tab-able menu of files
" Keymap for symbols{{{
set keymap=symbols " ~/.vim/keymap/symbols.vim
set iminsert=0  " same as i_<C-^> to toggle off keymapping
" I made a keymap for symbols I used often.
" This was easier than memorizing hex unicode codepoints and typing
" ~<C-b>uxxxx.~
" <C-v>uxxxx.
" 'set keymap' has the side effect that the keymap is effective the next
" time you enter insert mode, so 'set iminsert=0' fixes that.
"}}}
" Folds{{{
" Do not override fold text:
let g:markdown_fold_override_foldtext = 0
" Enable text folding for markdown:
let g:markdown_folding = 1
" Limit fold nesting (default is foldnestmax=20) -- no, that was not the problem
" set foldnestmax=20
" REF: Vim fold markers
" set foldmethod=manual{{{
" zf and zd create and destroy invisible fold markers
" Manual is the default.}}}
" set foldmethod=marker{{{
" zf and zd create and destroy fold markers "{{{ }}}"
" When a file uses markers (like this .vimrc), append this line at
" the end of the file:
" "vim:set fdm=marker:"
" }}}
" set foldmethod=indent{{{
" Fold at indents}}}
" set foldmethod=syntax{{{
" Fold at syntax highlights.
" Use this for C files. It is *not* the reason for slow text entry.
" Best fix for fast text entry is to not have so many tabs and buffers going.
" This does not work for Markdown files.
" }}}
" set foldmethod=expr{{{
" This is used by the `vim-markdown-folding` plugin.
" The plugin sets foldmethod for `markdown` files to `expr`.
" Install in " .vim/pack/foo/start/vim-markdown-folding/ftplugin/markdown/folding.vim{{{
" Note this is a `filetype` plugin, so the `.vim` file goes in a
" folder name `ftplugin/markdown`, not `plugin`.
" Adding a `markdown` folder is how the plugin tells Vim it is for
" the `markdown` filetype.
" See :h add-filetype-plugin.
" The plugin is *not installed correctly* if running
" ":set foldmethod?" on a markdown file returns anything other
" than "expr".
" Markdown folding:{{{
" use the `vim-markdown-folding` plugin
" Folds at headings using heading hiearchy (#, ##, ###, etc.).
" Fold options are flat or nested
" default is flat, use flat
" :FoldToggle to change flat/nested
"}}}
"}}} }}}
"}}}
" Indentation level is 4 spaces, use spaces instead of tabs.{{{
set expandtab tabstop=4 shiftwidth=4 softtabstop=4
" For Frank's code and for all Markdown:
" - shiftwidth=2
" - softtabstop=2
"}}}
filetype plugin indent on " filetype detection on, plugin on, indent on
" What are these complete options?{{{
" set complete=.,w,b,u,t,i
"   " default:
"   - current buffer
"   - buffers in other windows
"   - other loaded buffers
"   - unloaded buffers
"   - tags
"   - included files
" set completefunc=
"}}}
" Omni completion options{{{
set completeopt=menuone,preview"
" set completeopt=longest,menu
" default is completeopt=menu,preview{{{
" menu - only show menu when there is more than one match
" menuone - show menu even if there is only one match
" longest - insert longest common text of matches
" preview - show in the preview window some extra info about current
"           selection highlighted in the menu
"           - ex: for omni completion of a Python variable, the preview
"           window shows help on the data type
"           - close the preview window with <C-w>z
" ;opt
    " toggle whether omni complete opens the preview window
"}}}}}}
set autoindent " Copy indent from current line when starting a new line.
" EasyAlign mappings{{{
" remap `ga` from `:ascii` to `EasyAlign`{{{
" This is not a big loss. `ga` is also :as or :ascii which
" *[g]ets the [a]scii representation*
" `:as` is as easy to type as `ga`
"}}}
" `ga` mapping is from <https://github.com/junegunn/vim-easy-align>:{{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
"}}}
" Example: gaip*| - aligns all text [i]n [p]aragraph to every `|`{{{
" vipga*|
" visually selects all text inside a paragraph and aligns *every* |
" Of course you do not need to select the text first:
" gaip*|
" does the same thing without first making a visual selection.
"}}}
"}}}
" Kitty faces - preface command line messages with kitty faces{{{
let s:happy_kitty     = ">\^.\^<"
let s:sad_kitty       = "<\*.\*>"
let s:trippy_kitty    = ">@.@<"
let s:waiting_kitty   = "-O.O-"
let s:seeing_kitty    = "-O.O-"
let s:blind_kitty     = "-@.@-"
let s:default_kitty   = " v.v "
let s:invisible_kitty = "     "
"}}}
" Set the comment column for C/C++
" I like to put C++ style comments on right-hand side.
" This variable sets where those comments start.
" let s:commentcol = 65
" let s:commentcol = 61
" let s:c_commentcol = 57
let s:c_commentcol = 37
let s:python_commentcol = 57
" This variable sets the width of a C/C++ window
" Use s:c_winwidth with :vertical resize
" :vertical resize 92
" But remember to add 3 or 4 to include width taken up by line numbers
" Line numbers eat up 3 or 4 columns,
" e.g., if s:c_winwidth is 92, actual text columns go from 1 to 88.
" :vertical resize (92+4)
" This way, text width (:set tw 92) wraps based on available text columns.
let s:c_winwidth = 86 " 88 " 92
let s:python_winwidth = 92 " 78

" -- INSERT -- abbreviations{{{
" ppp<Tab>{{{
iabbrev ppp #!/usr/bin/env python<CR># -*- coding: utf-8 -*-<ESC>0k
"}}}
"}}}
" Map the leader to semicolon{{{
let mapleader = ";"
" use <leader> when defining shortcuts below.
" Popular choices I did not choose{{{
" , is the popular leader...
" Damian Conway swaps ; with :
" nnoremap ; :
" nnoremap : ;
"}}}
"}}}
" `;,` - repeat char search{{{
nnoremap <leader>, ;
" `;` default is repeat f,t,F,T character search
" but `;` is my leader
" `;,` is the logical map for old `;` functionality
" because `,` is like `;` but moves in the opposite direction
"}}}
" ;os - check OS{{{
nnoremap <leader>os :call ReportOs()<CR>
function! ReportOs()
    if CheckOs() == 'linux'
        echomsg s:happy_kitty "This is Linux."
    endif
    if CheckOs() == 'windows'
        echomsg s:sad_kitty "This is Windows."
    endif
endfunction
function! CheckOs()
    " Return string 'linux' or 'windows'.{{{
    " Report OS in messages.
    " How it works:
    "   my Linux uses X11, my Windows doesn't.
    "   Checks `has("X11")`. If feature is enabled, it's Linux.}}}
    if has("X11")
        return 'linux'
    else
        return 'windows'
    endif
endfunction"}}}
"}}}
" ;vw - "vimgrep" .py files for the word under the cursor{{{
nnoremap <leader>vw yiw:vimgrep /\<<C-r>"\>/j %<CR>:copen<CR>
" nnoremap <leader>vw yiw:vimgrep /\<<C-r>"\>/j *.py
" yiw - yank in word
" :vimgrep - start the vimgrep command
" <C-r>" - paste from the default register
" /j - flag: do not jump to the first match, leave the cursor where it was
" /pattern/ - enclose pattern in anything, convention is "/" for using flags
" *.py - all Python files in this directory (**/*.py is the recursive dive)
" \<word\> - only match whole words (see :help \< and :help \>)
"          - e.g., "_word" and "word_" do not match
" }}}
" ;ff - :FoldToggle (change flat/nested for markdown)
nnoremap <leader>ff :FoldToggle<CR>
" ;ss - :WrapscanToggle (:set nowrapscan / :set wrapscan) {{{
nnoremap <leader>ss :call WrapscanToggle()<CR>
function! WrapscanToggle()
    if &wrapscan == 1
        execute("set nowrapscan")
        echomsg s:trippy_kitty "wrapscan (search wraparound) turned off"
    else
        execute("set wrapscan")
        echomsg s:happy_kitty "wrapscan (search wraparound) turned on"
    endif
endfunction
"}}}
" v_;f - Fit window to visual selection{{{
" Notes:{{{
" TODO: work with folds{{{
" Folded lines are included in the count.
" But I want to count a fold as one line.
"}}}
" Usage:{{{
" visual select a block of text and hit f
"}}}
" Explanation:{{{
" zt on top line of selection
" zN (N is the number of lines)
"}}}
"}}}
vnoremap <leader>f :call FitWindowToSelection()<CR>:echomsg "-O.O- Window fit to visual-selection"<CR>
function! FitWindowToSelection()
    let top=line("'<")
    let bottom=line("'>")
    let numlines = bottom-top
    let numlines += 1
    execute "normal! " . top . "G"
    execute "normal! zt"
    execute numlines . "wincmd_"
endfunction
"}}}
" ;xi - convert hex byte to its inverse{{{
" Usage: Place cursor anywhere on hex byte text and ;xi.{{{
" Example:
"   0xF0 - place cursor on 'F'
"   ;xi
" The text changes to its inverse (all bits flip):
"   0x0F
"}}}
nnoremap <leader>xi :call HexByteInverted()<CR>
function! HexByteInverted()
    normal! "zyiw
    if (match(@z,"0x")) != 0
        echomsg s:sad_kitty "Cursor is not on a hex byte such as 0xab or 0xAB"
        return
    endif
    let old_byte = @z
    normal! viw
    let @z = printf('0x%02X',xor(@z, 0xFF))
    normal! "zp
    echomsg s:happy_kitty "Changed" old_byte "to" @z . "."
endfunction
"}}}
" ;xrgb - convert hex color to rgb{{{
" d9cec3
"}}}
nnoremap <leader>xrgb :call HexColorToRgb()<CR>
function! HexColorToRgb()
    normal! "zyiw
    let r = '0x'.@z[0:1]
    let g = '0x'.@z[2:3]
    let b = '0x'.@z[4:5]
    echomsg "Red:" r . ", Green:" g . ", Blue:" b
    " echomsg "RGB:" printf('(%d,%d,%d)', r,g,b)
    let @z = printf('(%d,%d,%d)', r,g,b)
endfunction
" ;xb - convert hex byte to binary"{{{
" Usage: place cursor anywhere on hex or binary text and ;xb.
" Example:
"   0xF0 - place cursor on 'F'
"   ;xb
" The text changes to its binary representation:
"   0b11110000
" Now change it back:
"   0b11110000 - place cursor on a '0'
"   ;xb
" The text changes back to its hexadecimal representation:
"   0b11110000
nnoremap <leader>xb :call HexByteToBinary()<CR>
function! HexByteToBinary()
    normal! "zyiw
    if match(@z,'0x\|0b') != 0
        echomsg s:sad_kitty "Cursor is not on a hex byte, such as 0xab or 0xAB, or a binary byte, such as 0b10101011"
        return
    endif
    if match(@z, '0x') == 0
        let hex_repr = @z
        normal! viw
        let @z = printf('0b%08b', @z)
        normal! "zp
        echomsg s:happy_kitty "Changed" hex_repr "to" @z . "."
        return
    endif
    if match(@z, '0b') == 0
        let bin_repr = @z
        normal! viw
        let @z = printf('0x%02X', @z)
        normal! "zp
        echomsg s:happy_kitty "Changed" bin_repr "to" @z . "."
        return
    endif
endfunction
"}}}
" ;pfo - Paste Vim formatoptions{{{
nnoremap <leader>pfo :call PasteFormatOptions()<CR>
function! PasteFormatOptions()
    let @z = &fo
    echomsg s:happy_kitty "  formatoptions: " . @z
    normal! "zp
endfunction
"}}}
" ;tw - Toggle auto-wrap{{{
nnoremap <leader>tw :call ToggleAutoWrap()<CR>
function! ToggleAutoWrap()
    let wrap_on = matchstr(&formatoptions,"tc")
    if wrap_on == 'tc'
        set formatoptions-=t
        set formatoptions-=c
        echomsg s:happy_kitty "Auto-wrap is off. No? Try echo &fo and see :h fo-table."
    else
        set formatoptions+=t
        set formatoptions+=c
        echomsg s:happy_kitty "Auto-wrap on: text wraps at column" &tw "in insert mode."
    endif
endfunction
"}}}
" :: Added 2022-08-06 :: {{{ ;lc : Go to column 65
" nnoremap <leader>lc :call cursor(getline('.'), 65)<CR>
nnoremap <leader>lc :call GoToCommentCol()<CR>
function GoToCommentCol()
    if (&filetype == 'c') || (&filetype == 'cpp')
        execute "call cursor(getline('.'), "..s:c_commentcol..")"
    elseif &filetype == 'python'
        execute "call cursor(getline('.'), "..s:python_commentcol..")"
    endif
endfunction
"}}}
" ;ln - turn on line numbers{{{
nnoremap <leader>ln :set number<CR>:set relativenumber<CR>
" Vim help, man pages, and `netrw` all turn off line numbering.
" This shortcut lets me temporarily override this to turn it back on.
"}}}
" ;da - PasteDate{{{
nnoremap <leader>da :call PasteDate()<CR>
function! PasteDate()
    put=strftime('%c')
    normal! kJ$
endfunction
" "PasteBlock_DateAndAvrSize" depends on "OldPasteDate"{{{
function! OldPasteDate()
    " Paste output of command:
    " :!date
    " Example date output: Thu, Jan  2, 2020  9:55:26 AM
    execute "silent !date | clip"
    " Redraw the entire screen.
    " A CTRL-L redraw is necessary after this particular return to Vim screen.
    execute "normal! \<C-L>"
    " Paste timestamp on the current line.
    execute 'normal! "+P'
    " Redraw Vim screen before echo so message stays on screen.
    redraw | echomsg s:happy_kitty @+
endfunction
"}}}
"}}}
" ;+ - Copy default register to clipboard register{{{
nnoremap <leader>+ :let @+=@"<CR>
"}}}
nnoremap <leader>ro :set readonly<CR>
" ;hs - Turn off highlighting for bad spelling"{{{
nnoremap <silent><leader>hs :hi SpellBad NONE<CR>:hi SpellLocal NONE<CR>
"}}}
nnoremap <leader>gr :!grep "inline" --color -rn . --include=*.[ch]

" REF: Git shortcuts
" Git repos with submodules:
" warning: adding embedded git repository: pack/bundle/dev
" hint: You've added another git repository inside your current repository.
" hint: Clones of the outer repository will not contain the contents of
" hint: the embedded repository and will not know how to obtain it.
" hint: If you meant to add a submodule, use:
" hint:
" hint:   git submodule add <url> pack/bundle/dev
" hint:
" hint: If you added this path by mistake, you can remove it from the
" hint: index with:
" hint:
" hint:   git rm --cached pack/bundle/dev
" hint:
" hint: See "git help submodule" for more information.
"
" !git submodule add https://rainbots@bitbucket.org/rainbots/unit-test-vim.git pack/bundle/dev/
" This creates a `.gitmodules` file:
" [submodule "pack/bundle/dev"]
" 	path = pack/bundle/dev
" 	url = https://rainbots@bitbucket.org/rainbots/unit-test-vim.git
"
" when cloned, the cloner gets:
" - this .gitmodules file
" - the folders where the submodules live
" - but the folders are empty
" cloner now runs two commands to populate the submodules:
" git submodule init
" git submodule update
"
" Submodule my Vim plugins...
" !git submodule add https://github.com/scrooloose/nerdtree.git pack/bundle/start/nerdtree/
" !git submodule add https://github.com/Shougo/echodoc.vim.git pack/bundle/start/echodoc.vim/
" !git submodule add https://github.com/tmhedberg/SimpylFold.git pack/bundle/start/SimpylFold/
" !git submodule add https://github.com/webdevel/tabulous.git pack/bundle/start/tabulous/
" !git submodule add https://github.com/tpope/vim-commentary.git pack/bundle/start/vim-commentary/
" !git submodule add https://github.com/junegunn/vim-easy-align.git pack/bundle/start/vim-easy-align/
" !git submodule add https://github.com/masukomi/vim-markdown-folding.git pack/bundle/start/vim-markdown-folding/
" !git submodule add https://github.com/tpope/vim-repeat pack/bundle/start/vim-repeat/
" !git submodule add https://github.com/tpope/vim-surround.git pack/bundle/start/vim-surround/

" ---Git Placeholder until I install vim-fugitive.---
" ;G<Space> - Start a Git command at the Vim command line{{{
nnoremap <leader>G<Space> :!git<Space>
"}}}
" ;Gt - `git tag` {{{
nnoremap <leader>Gt :!git tag<Space>
" FLAGS
" no arguments: list tags{{{
    " same as -l,--list}}}
" -a tag latest commit with annotation (e.g., version number){{{
" -m add a message describing the tag
" Example:
"
" $ git tag -a v0.1.2 -m "Bridge LED is for control by
" application. Sensor LEDs are not. Sensor LED0 red means SPI Rx
" buffer is full: please send Chromation your Python script to
" help debug the firmware."}}}
" }}}
" ;GS - `git show` {{{
nnoremap <leader>GS :!git show<Space>
" ARGS {{{
" no args -- e.g., git show{{{
" like `git log` but with diffs.}}}
" arg is a commit hash -- e.g., git show ea08b5{{{
" Show log and diffs for that commit.}}}
" arg is a tag -- e.g., git show v0.1.2{{{
" Show annotation, log, and diff for commit with that tag.
" Usual flow:
" 1. List tags:
" $ git tag
" v0.1.1
" v0.1.2
" 2. Look at a tag:
" $ git show v0.1.2}}}
"      }}}
" FLAGS{{{
" --oneline -- shorten hash to 6 digits, omit author and date
"      }}}
" }}}
" ;Gs - `git status` (red: unstaged, green: staged){{{
nnoremap <leader>Gs :!git status<Space>
" FLAGS (-sbuall){{{
" -sbuall:I recommend this flag combination{{{
" -sb:short with branch and tracking info
" -suall:short and show all untracked files individually
"}}}
" -v:see staged changes (same as `git diff --staged`)
" -vv:see unstaged changes (same as `git diff` without flags)
" --ignored:see ignored files (-s XY are !!)
"}}}
" -s:short (message uses XY status shorthands: M/A/D/R/C/?/!/U){{{
" X and Y are modification states on each side of the merge.{{{
" If there is no merge conflict:
" X is status of index
" Y is status of work tree
"}}}
" M = modified
" A = added
" D = deleted
" R = renamed
" C = copied
" U = updated but unmerged
" ? = untracked{{{
" For untracked paths, XY are ??
"}}}
" ! = ignored
"}}}
" -u show/hide untracked files{{{
" -unormal:show untracked files and directories (default)
" -uall:show individual untracked files in untracked directories
" -uno:do not show untracked files
" Note: *untracked* files are different from *ignored* files
"}}}
"}}}
" ;Gd - `git diff` (red: working tree, green: changes){{{
nnoremap <leader>Gd :!git diff<Space>
" FLAGS (--staged){{{
" none:show unstaged changes
" --staged:show staged changes
" also see --cached
"}}}
"}}}
" ;Gdp - `git diff` two most recent commits (red: previous commit, green: this commit){{{
nnoremap <leader>Gdp :!git diff HEAD~ HEAD
"}}}

" ;Ga<CR> - `git add` *all* changes in the pwd and its subfolders{{{
nnoremap <leader>Ga<CR> :!git add .
"}}}
" ;Gap - `git add` --patch{{{
nnoremap <leader>Gap :!git add --patch<Space>
" Limit to the file in the active buffer:
" !git add --patch %
"}}}
" ;Ga<Space> - just start the `git add` command{{{
nnoremap <leader>Ga<Space> :!git add 
"}}}
" ;Ga% - `git add` *file* in the active buffer{{{
nnoremap <leader>Ga% :!git add %
"}}}
" ;Gu<Space> - `git unstage` *all* changes currently staged{{{
nnoremap <leader>Gu<Space> :!git reset 
"}}}
" ;Gu% - `git unstage` *file* in the active buffer{{{
nnoremap <leader>Gu% :!git reset %
"}}}
" ;Gut - `git untrack` *file* to stop tracking{{{
nnoremap <leader>Gut :!git rm --cached 
" after "cached" specify file or regex pattern to stop tracking
" manually edit .git/info/exclude so `git add .` does not track the file again
"}}}
" ;GuR - `git reset --hard HEAD`{{{
nnoremap <leader>GuR :!git reset --hard HEAD
" Discard any changes, whether staged or unstaged, since the last
" commit. THIS CHANGES THE WORKING TREE.
" }}}
" ;GcM - `git commit` with text after message (M for *big* message){{{
nnoremap <leader>GcM :!git commit<CR>
    " Launch into a new Vim window for writing a proper commit message.
" Tips on writing proper commit messages{{{
" Think of a commit message as the title of a section.{{{
" Start with a capital letter.
" Do not end with a period.
"}}}
" Speak in the active tense about what this commit *does*.{{{
" Example:
" good: "Unit test Queue lib",
" bad: not Queue lib unit-tested
"}}}
" Links to blogs about commit messages:{{{
" <https://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html>
" <https://github.com/torvalds/linux/pull/17#issuecomment-5659933>
" <https://chris.beams.io/posts/git-commit/>
" <https://medium.com/@steveamaza/how-to-write-a-proper-git-commit-message-e028865e5791>
" <https://code.likeagirl.io/useful-tips-for-writing-better-git-commit-messages-808770609503>
" <https://thoughtbot.com/blog/5-useful-tips-for-a-better-commit-message>
"}}}
"}}}
"}}}
" ;Gcm - `git commit -m 'A short commit message.'` (m is for *little* message){{{
nnoremap <leader>Gcm :!git commit -m<Space>
" 99% of the time, do *NOT* use this. Write a *big* message instead.
"}}}
" ;Gca - `git commit --amend` Amend a commit message before pushing to remote{{{
nnoremap <leader>Gca :!git commit --amend<CR>
"}}}
" ;Gr - `git remote`{{{
" Displays the git URL for push and pull.
" Change the repo name by first doing ;Gr to get the base URL,
" then do :!git remote set-url origin NEW-URL
" Example:
" I changed package `pygs` to `pygstuff` to avoid a name conflict
" on PyPI.
" ;Gr shows me the URL is: https://github.com/sustainablelab/pygs.git
" :!git remote set-url origin https://github.com/sustainablelab/pygstuff.git
nnoremap <leader>Gr :!git remote -v
"}}}
" ;Gp - `git push`{{{
nnoremap <leader>Gp :!git push
" -f or --force - overwrite remote with local{{{
" Example:{{{
" git push --force
"}}}
" Be careful:{{{
" Make sure you want to overwrite remote with local.
" With multiple push destinations, this may overwrite refs other
" than the current branch.
"}}}
" Use `+<branch>` to limit push --force to a single branch.{{{
" Example:
" git push --force +master
" Only pushes to the master branch.
"}}}
"}}}
"}}}
" ;GP - `git pull`{{{
nnoremap <leader>GP :!git pull
"}}}
" ;GR - `git rebase -i HEAD~` for rewording commit messages before commits are pushed{{{
nnoremap <leader>GR :!git rebase -i HEAD~
" git rebase -i HEAD~2{{{
" rebase last two commits
"}}}
" instructions to reword commit messages:{{{
" Replace `pick` with `reword` for commit messages to change.
" Save and close the commit list file.
" Vim opens each commit file. Type new new message, save, close.
" If commits were already pushed to upstream:
" git push --force
"}}}
"}}}
" ;Gb - `git branch`{{{
nnoremap <leader>Gb :!git branch<Space>
" FLAGS (-avv){{{
" none:list local branches
" -r:list remote-tracking branches
" -a:list remote-tracking branches and local branches
" -v:list sha1 and HEAD commit subject line (message)
" -vv:list sha1, name of upstream branch, and HEAD commit subject line
"  (message)
" -l {pat}:list branches matching {pat}
" {pat} is a shell matching pattern{{{
" Example: git branch -l *usb* | clip{{{
"   List all the branches{{{
"   :!git branch
"   master
"   move-bridge-out-of-usb-lib
"}}}
"   List only branches that contain `usb` in their name{{{
"   :!git branch -l *usb*
"   move-bridge-out-of-usb-lib
"}}}
"   Copy that *usb* branch to the clipboard{{{
"   :!git branch -l *usb* | clip
"}}}
"   Clean the name{{{
"   The clipboard now has the branch name with a \n\s\s prefix
"   Paste the clipboard to a Vim buffer first to yank the name.
"}}}
"}}}
"}}}
" -d: delete branch
"}}}
"}}}
" ;GL - `git log` simple short list -- the `\` is for Vim, omit `\` in bash {{{
nnoremap <leader>GL :!git log --date=short --format="- \%cd \%s"<Space>
"}}}
" ;Gld - `git log` with diffs, follow with -n5 for 5 most recent commits{{{
nnoremap <leader>Gld :!git log -p<Space>
"}}}
" ;Gls - `git log` with summaries, follow with -n5 for 5 most recent commits{{{
nnoremap <leader>Gls :!git log --oneline --stat --summary --date=short --pretty="format:\%C(auto)\%h \%ad: \%s"<Space>
"}}}
" ;Glf - pretty `git log` including names and status of changed files.{{{
nnoremap <leader>Glf :!git log --name-status --date=short --decorate --graph --pretty=format:"- \%C(yellow)\%cd \%C(blue)\%>(15)\%ar \%C(reset)\%s"<Space>
"}}}
" ;Gl - pretty `git log`, follow with -n5 for 5 most recent commits{{{
nnoremap <leader>Gl<Space> :!git log --date=short --decorate --graph --pretty=format:"- \%C(yellow)\%cd \%C(blue)\%>(15)\%ar \%C(reset)\%s"<Space>
nnoremap <leader>Gl<CR> :!git log --date=short --decorate --graph --pretty=format:"- \%C(yellow)\%cd \%C(blue)\%>(15)\%ar \%C(reset)\%s"<CR>
" Formatting codes:{{{
" `%ar` is relative date{{{
" Example:
" 3 days ago
"}}}
" `%ad` is absolute date{{{
" Example:
" Fri May 31 17:46:06 2019 -0400
"}}}
" %ci{{{
" committer date, ISO 8601-like format
"}}}
" %cd{{{
" committer date (format respects --date= option)
" Date format is set with `--date=<format>`
" Example:
" `--date=short` shows only the `YYYY-MM-DD`
"}}}
" %s{{{
" the commit message
"}}}
"}}}
" Full list of formatting codes:{{{
" - %H: commit hash
" - %h: abbreviated commit hash
" - %T: tree hash
" - %t: abbreviated tree hash
" - %P: parent hashes
" - %p: abbreviated parent hashes
" - %an: author name
" - %aN: author name (respecting .mailmap, see git-shortlog(1) or git-blame(1))
" - %ae: author email
" - %aE: author email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
" - %ad: author date (format respects --date= option)
" - %aD: author date, RFC2822 style
" - %ar: author date, relative
" - %at: author date, UNIX timestamp
" - %ai: author date, ISO 8601-like format
" - %aI: author date, strict ISO 8601 format
" - %cn: committer name
" - %cN: committer name (respecting .mailmap, see git-shortlog(1) or git-blame(1))
" - %ce: committer email
" - %cE: committer email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
" - %cd: committer date (format respects --date= option)
" - %cD: committer date, RFC2822 style
" - %cr: committer date, relative
" - %ct: committer date, UNIX timestamp
" - %ci: committer date, ISO 8601-like format
" - %cI: committer date, strict ISO 8601 format
" - %d: ref names, like the --decorate option of git-log(1)
" - %D: ref names without the " (", ")" wrapping.
" - %e: encoding
" - %s: subject
" - %f: sanitized subject line, suitable for a filename
" - %b: body
" - %B: raw body (unwrapped subject and body)
" - %GG: raw verification message from GPG for a signed commit
" - %G?: show "G" for a good (valid) signature, "B" for a bad signature, "U" for a
"   good signature with unknown validity, "X" for a good signature that has
"   expired, "Y" for a good signature made by an expired key, "R" for a good
"   signature made by a revoked key, "E" if the signature cannot be checked (e.g.
"   missing key) and "N" for no signature
" - %GS: show the name of the signer for a signed commit
" - %GK: show the key used to sign a signed commit
" - %gD: reflog selector, e.g., refs/stash@{1} or refs/stash@{2 minutes ago}; the
"   format follows the rules described for the -g option. The portion before the @
"   is the refname as given on the command line (so git log -g refs/heads/master
"   would yield refs/heads/master@{0}).
" - %gd: shortened reflog selector; same as %gD, but the refname portion is
"   shortened for human readability (so refs/heads/master becomes just master).
" - %gn: reflog identity name
" - %gN: reflog identity name (respecting .mailmap, see git-shortlog(1) or git-blame(1))
" - %ge: reflog identity email
" - %gE: reflog identity email (respecting .mailmap, see git-shortlog(1) or git-blame(1))
" - %gs: reflog subject
" - %Cred: switch color to red
" - %Cgreen: switch color to green
" - %Cblue: switch color to blue
" - %Creset: reset color
" - %C(...): color specification, as described under Values in the "CONFIGURATION
"   FILE" section of git-config(1). By default, colors are shown only when enabled
"   for log output (by color.diff, color.ui, or --color, and respecting the auto
"   settings of the former if we are going to a terminal). %C(auto,...) is
"   accepted as a historical synonym for the default (e.g., %C(auto,red)).
"   Specifying %C(always,...) will show the colors even when color is not
"   otherwise enabled (though consider just using `--color=always to enable color
"   for the whole output, including this format and anything else git might
"   color). auto alone (i.e. %C(auto)) will turn on auto coloring on the next
"   placeholders until the color is switched again.
" - %m: left (<), right (>) or boundary (-) mark
" - %n: newline
" - %%: a raw %
" - %x00: print a byte from a hex code
" - %w([<w>[,<i1>[,<i2>]]]): switch line wrapping, like the -w option of git-shortlog(1).
" - %<(<N>[,trunc|ltrunc|mtrunc]): make the next placeholder take at least N
"   columns, padding spaces on the right if necessary. Optionally truncate at the
"   beginning (ltrunc), the middle (mtrunc) or the end (trunc) if the output is
"   longer than N columns. Note that truncating only works correctly with N >= 2.
" - %<|(<N>): make the next placeholder take at least until Nth columns, padding
"   spaces on the right if necessary
" - %>(<N>), %>|(<N>): similar to %<(<N>), %<|(<N>) respectively, but padding
"   spaces on the left
" - %>>(<N>), %>>|(<N>): similar to %>(<N>), %>|(<N>) respectively, except that if
"   the next placeholder takes more spaces than given and there are spaces on its
"   left, use those spaces
" - %><(<N>), %><|(<N>): similar to %<(<N>), %<|(<N>) respectively, but padding
"   both sides (i.e. the text is centered)
" - %(trailers[:options]): display the trailers of the body as interpreted by
"   git-interpret-trailers(1). The trailers string may be followed by a colon and
"   zero or more comma-separated options. If the only option is given, omit
"   non-trailer lines from the trailer block. If the unfold option is given,
"   behave as if interpret-trailer’s --unfold option was given. E.g.,
"   %(trailers:only,unfold) to do both.
"}}}
" `nnoremap gl` does ;Gl<CR>
" ;Gl lets you add flags, specify a branch, or a range
" Specify a branch{{{
" git log <branch>{{{
" only show commits for <branch>
" usually <branch> is omitted; this defaults to the active branch
"}}}
"}}}
" Specify a range{{{
" git log <since>..<until>{{{
" git log {branch}..master{{{
" only show commits in master that are *not* on {branch}
" Useful for seeing commits *since* branch merged with master.
"}}}
" git log master..{branch}{{{
" only show commits on {branch} that are *not* in branch master
"}}}
"}}}
"}}}
" FLAGS (-5 --grep="WIP"){{{
" -n: number of most recent commits to show
" --grep="WIP"{{{
" show all commits with "WIP" in commit message
"}}}
" -- {filename 1} {filename 2}: changes to file1 or file2{{{
" show all commits for changes to file1 or file2
"}}}
" -S"SensorCfgLis": when string "SensorCfgLis" added to any file{{{
" - show commits when string FunctionName was added to any file
"   in the project
"}}}
" -G"SensorCfgLis(.*)": use regex to find function calls only{{{
" like -S but uses a regex
" This specifically looks for when the function call was added to a
" file. It matches SensorCfgLis() with and without arguments.
"}}}
" --after="2019-04-01"{{{
" --after="yesterday"
" --after="1 week ago"
"}}}
" --before="2019-04-01"{{{
" --before="1 year ago"
"}}}
" --author="sustainablelab"
"}}}
"}}}
" ;Gh - Put hash of last commit in clipboard.{{{
" TODO(sustainablelab): remove the newline from the end of this clipboard paste
" @Ridiculous: gotta save this solution for posterity
" nnoremap <leader>Gh :!git log \| grep commit -m 1 \| perl -pe 's/commit //;' \| perl -pe 's/\n//;' \| clip<CR><CR>:echomsg "Latest git commit: ".@+.". Paste from Vim register '+'."<CR>
" -m N returns only the first N lines of grep matches
" This returns a line like:
    " commit 9ef51af2d76926a987bfa9f6340310b05c8a2c5e
" perl -pe invokes perl on every line of input and outputs the result
" the first regex erases 'commit '
" the second regex erases the trailing newline
" backslash escape pipes in Vim script line to use pipe in the shell sense:
" piping output of one command as input to another
"
" Here's the easier way to get the hash:
" First six hex digits only:
nnoremap <leader>Gh :!git log --format="\%h" -n1 \| clip<CR><CR>:echomsg "Latest git commit: ".@+.". Paste from Vim register '+'."<CR>
" All 40 hex digits:
nnoremap <leader>GH :!git log --format="\%H" -n1 \| clip<CR><CR>:echomsg "Latest git commit: ".@+.". Paste from Vim register '+'."<CR>
" nnoremap <leader>Gh :!git log --format="\%h" -n1 | clip<CR><CR>:echomsg "Latest git commit: ".@+.". Paste from Vim register '+'."<CR>
"}}}
" ;Gch - `git checkout`{{{
nnoremap <leader>Gch<Space> :!git checkout 
" Example: change version on disk to `master` branch{{{
" git checkout master (shortcut ;Gchm)
"}}}
" -b: create branch and checkout in one step{{{
" Example:
" git checkout -b inline-all-lib-functions
" Use this anytime I start making changes.
" This gives me an easy undo: `git checkout master`
" If I did not branch, `git checkout -f master` undoes all changes after the
" most recent commit.
"}}}
" -- <file>: throwawy changes to <file>{{{
" Example:
" git checkout -- index.html
" Abandons my local changes to `index.html`.
" Useful before doing `git pull` to avoid merge conflicts when
" I'm sure I don't want my local changes.
"}}}
"}}}
nnoremap <leader>Gchm :!git checkout master
nnoremap <leader>Gchp :!git checkout HEAD~1
" ;Gm - `git merge`{{{
nnoremap <leader>Gm :!git merge 
" Example: incorporate changes on `master` in `experimental` branch
"   git checkout experimental
"   git merge master
" This only affects `experimental`. It does not affect `master`.
"}}}
" TODO: git-notes{{{
" Add notes to a commit message!
" Maybe this is a better way to use the log for tasks?
"}}}
" TODO: git-rebase{{{
" Use `git rebase` to clean up my old crappy commit messages.
" Wait to do this until I figure out my WIP/RIP task-listing strategy
"
" Summary of process from GitHub:
" <https://help.github.com/en/articles/changing-a-commit-message>
" Warn Sean{{{
" We strongly discourage force pushing, since this changes the history of
" your repository. If you force push, people who have already cloned your
" repository will have to manually fix their local history. For more
" information, see "Recovering from upstream rebase" in the Git manual.
"}}}
" Process{{{
" Display the last n commits in Vim in a commit list file.
    " git rebase -i HEAD~n
" Replace `pick` with `reword` for commit messages to change.
" Save and close the commit list file.
" Vim opens each commit file. Type new new message, save, close.
" git push --force
"}}}
" From Git documentation{{{
" ~/read-the-docs/man-git.man:
" Start it with the last commit you want to retain as-is:
" git rebase -i <after-this-commit>
"
" An editor will be fired up with all the commits in your current branch
" (ignoring merge commits), which come after the given commit. You can
" reorder the commits in this list to your heart’s content, and you can
" remove them. The list looks more or less like this:

" pick deadbee The oneline of this commit
" pick fa1afe1 The oneline of the next commit
" If you just want to edit the commit message for a commit, replace the
" command "pick" with the command "reword".
"}}}
"}}}
" ;cm -- Python check-manifest{{{
" Install via PowerShell with `pip install check-manifest`.
" Now `check-manifest.exe` is available from Cygwin bash.
" - cd into Python project folder
" - project must contain `setup.py` and `.gitignore`
" - prior to committing changes to a Python package repo, run
" check-manifest to see if the .gitignore file and the `sdist`
" still match, e.g., if the `.gitignore` does not ignore the
" `build` folder, and you do `python setup.py bdist_wheel`, the
" project now contains a build/ folder, and git add . stages this
" for a commit, so check-manifest complains that the `sdist` does
" not match the repository because the `sdist` is not supposed to
" include `build/` -- in this way, check-manifest guides which
" files or folders to add to the .gitignore file.
nnoremap <leader>cm :!check-manifest.exe
" }}}
" REF: Git log in bash{{{ alias: gitlog
" $ git log --date=short --format=" - %Cblue %cd %Cred %d %Creset %s"
" %Cred %Cblue %Cgreen -- set color to red/blue/green
" %Creset -- rest color (to white)
" %cd -- commit date
" %s -- commit message
" %d -- refs{{{
"   Usually, %d just includes this:
"   (HEAD -> master, origin/master)}}}
"}}}
" REF: Git logs in Vim
" TLDR:
    " ;glw (quick tasklist from WIPs in git log)
    " gl (colorful git log in Terminal)
    " ;gl<Space> (git log in Vim)
    " ;G (starts a :!git )
" TODO: replace `grep` with `git grep`{{{
" `git grep` is faster
"}}}
" TODO: replace grep of a git log with `git log --grep`{{{
" `git log --grep=` will intelligently pull entire commits
" But I don't know how to highlight the matching terms.
" So for the terminal view, I use `| grep --color`.
" And for the Vim view, I use `git log --grep=`
"}}}
" ---Show the log in the terminal---{{{
" gl{{{
" terminal shows one-line git log with color
" show branch history with --decorate --graph
"}}}
" ;gl: (this one needs love, better to use ;gl<Space>, then /){{{
" like `gl`
" but you can add a `grep` pattern before execution to only show lines
" with the search term
" `grep --color` highlights the pattern red
" grep messes with output, so do not show branch history
"}}}
"}}}
" ---Show the log in a Vim window---{{{
" ;gl<Space>{{{
" Like `gl` but display in a Vim window.
" No color because \%C color commands do not work.
" Just show relative date.
" Place commit on a new line so I can turn these into tasks.
"}}}
" ;glw (quick task list!){{{
" Like ;gl<space> but grep for `WIP`
" Convert log to a task list format: every WIP becomes a task
"}}}
"}}}
nnoremap <leader>gl: :!git log --pretty=format:"- \%ci \%>(15)\%ar \%s" <Bar> grep --color ""
" nnoremap <leader>gl: :!git log --pretty=format:"- \%ci \%>(15)\%ar \%s" --grep=
nnoremap <leader>glw :call GitLogInVim('WIP')<CR><CR>
" TODO: make complementary version for 'RIP'
" TODO: revise 'WIP' to check off WIPs that have complementary RIPs.
" ;gl<Space> Display git log in a Vim window.{{{
nnoremap <leader>gl<Space> :call GitLogInVim('')<CR><CR>
function! GitLogInVim(grep_pat)
    " Display git log in a Vim window at the bottom of the screen.
    " Highlight the optional grep pattern.
    " Format the log as a task file if the grep pattern is `WIP`.
    " USAGE:
        " ;gl<Space>
        " -- view the entire log in Vim:
            " relative time stamps
            " indent commit message below the timestamp
        " ;glw
        " -- only view log entries with WIPs
            " break out each WIP as a task
            " relative time stamps
            " indent commit message below the timestamp
            " indent WIP tasks below the timestamp

    " Save git log in clipboard
    if a:grep_pat == ''
        execute '!git log --pretty=format:"- \%ar\%n    - \%s" | clip'
    else
        " execute '!git log --pretty=format:"- \%>(13)\%ar \%s" | grep '.a:grep_pat.' | clip'
        execute '!git log --grep='.a:grep_pat.' --pretty=format:"- \%ar\%n    - \%s" | clip'
    endif
    " Paste clipboard in a new Vim window as readonly
    botright new | execute 'normal! "+p' | set readonly
    " Put WIPs on their own line with [ ]
    if a:grep_pat == 'WIP'
        " Taskify `WIP` occurrences *not* in `    - WIP`
        %s/\(    - \)\@<!WIP/\r    - [ ] WIP/g
        " Taskify `WIP` occurrences in `    - WIP`
        %s/    - WIP/    - [ ] WIP/g
        " Listify `RIP` occurrences not already listified
        %s/\(    - \)\@<!RIP/\r    - RIP/g
        " Word wrap every line.
        %normal!gqq
        " Go to the top of the buffer.
        normal!gg
    endif
    " Highlight the grep pattern.
    if (a:grep_pat != '') && (a:grep_pat != 'WIP')
        execute 'match Search /' . a:grep_pat . '/'
    endif
    if a:grep_pat == 'WIP'
        call ColorWipRip()
    endif
    " return to previous window
    " execute "silent wincmd p"
    redraw
    echomsg s:happy_kitty '  Git log in bottom window. q! to close.'
endfunction
"}}}
nnoremap <silent> <leader>WR :call ColorWipRip()<CR>
function! ColorWipRip()
    :match ErrorMsg /WIP/
    :2match Exception /RIP/
endfunction

nnoremap gl :call GitLogWithTimesToConsole()<CR>
function! GitLogWithTimesToConsole()
    "Display the git log in the bash terminal.
    execute GitLogWithTimes()
endfunction
function! GitLogWithTimes()
    "This is a pretty one-liner with timestamps for me to predict how long
    "development takes.
    "Return the string with the one-liner command.
    "Other functions execute the string returned by this function.
    return '!git log --decorate --graph --pretty=format:"- \%C(yellow)\%ci \%C(blue)\%>(15)\%ar \%C(reset)\%s"'
endfunction
function! GitLogWithDates()
    " %ar is relative dates, example: `3 days ago`
    " %ad is absolute dates, example: `Fri May 31 17:46:06 2019 -0400`
    " Absolute date format is set with --date=<format>
    " example: --date=short shows only the YYYY-MM-DD
    return '!git log --date=short --pretty=format:"| \%ad|\%s |"'
endfunction
nnoremap gL :call GitLogWithTimesToFile()<CR><CR>
function! GitLogWithTimesToFile()
    "Record the git log to file.
    execute GitLogWithDates() . ' > git-commits.md'
    "execute "normal! \<CR>"
    redraw
    echomsg s:happy_kitty 'Git commits are logged in `git-commits.md`.'
endfunction


" REF: csv file to table
" ---Convert Csv To Vim Table---
nnoremap <leader>xcsv :call CsvToVimTable()<CR>
    " Usage:
        " put cursor in csv file
        " ;xcsv
        " the cursor stays on the line it was on
        " TODO: put cursor back *on the word* it was on
function! CountSeparators(line_number)
    " Return count of column separators (commas) on line line_number.
    " Ignore commas inside double quotes, these are not columns separators.
    "
    " USAGE:
    " :echo(CountSeparators(line('.')))
    "
    " Algorithm:
    " Use count() and substitute():
        " count({str}, {expr})
            " count occurrences of {expr} (,) in {str} " (line)
        " substitute({expr}, {pat}, {sub}, {flags})
            " replace {pat} (,) in {expr} (line) with {sub} ( )
            " if the commas are not column separators
        " unlike :s///, substitute() only returns modified text,
        " i.e., it has no side effects altering the original text
    return count(
        \ substitute(
            \ getline(a:line_number),
            \ '".\{-}"',
            \'\=substitute( submatch(0), ",", " ", "g" )',
            \ 'g'),
        \ ",")
endfunction
function! RemoveNewlinesInCsvFields()
    " Join lines to make every line of the CSV have the same number of commas.
    " Why this is hard:
        "
        " 1. CSV files use a comma as a separator, but a single entry may
        " contain commas if the comma is inside quotes.
        " Example: "a, b, c", "d, e, f" is two entries, not six.
        " Ignore these commas when aligning the columns into a table.
        "
        " 2. Vim treates all newlines as a new line, but a single row of the csv
        " file may contain newlines inside quotes.
        " Example: entry1, entry2, "a,\nb,\nc", entry4, entry5
        " This is one row, not three rows.
        " entry3 contains new lines, so Vim opens the file as three lines.
        " Treat these three lines as a single row.

    " Find the expected number of columns.
    let header_row = getline(1)
    echomsg "Header row: " . header_row
    let expect_num_columns = count(header_row, ",")
    echomsg "Expected number of columns: " . expect_num_columns
    " Fix lines that have less than the expected number of columns.
    let line_number = 1
    while line_number < line("$")
        " First make sure the line is not broken in the middle of a quote.
        let odd_num_quotes = (fmod(count(getline(line_number),'"'),2) == 1.0)
        let ncols = CountSeparators(line_number)
        if (ncols < expect_num_columns) || odd_num_quotes
            " Join this line with the next line.
            " 1st: create a string that concatenates this line and the next line
            let joined = join(getline(line_number,line_number+1))
                " getline() returns a list when {end} is specified
                " {end} is line_number+1 (the next line)
                " join() joins the items in the list with {sep}
                " omit {sep} and separator is a single whitespace.
            " 2nd: overwrite this line with the joined string
            call setline(line_number, joined)
            " 3rd: delete the next line
            call deletebufline(bufname("%"),line_number+1)
            " Report the side effects.
            let new_ncols = CountSeparators(line_number)
            echomsg "Fix line " . line_number
            echomsg "- Join line " .line_number . " with " . line_number+1
            echomsg "- Line " . line_number . " was " . ncols . " columns, now it is " . new_ncols . " columns."
        elseif ncols > expect_num_columns
            echomsg "Line " . line_number . ", ncol: " . ncols . " -- too many columns!"
        else
            let line_number = line_number + 1
        endif
    endwhile
endfunction

" CsvToVimTable{{{
function! CsvToVimTable()
    " ---Check This is a csv File---
    if expand("%:e") != 'csv'
        echomsg s:sad_kitty "  Nothing done. This is not a 'csv' file."
        return
    endif
    " Save cursor position to restore before exiting this function.
    let save_cursor = getcurpos()

    " ---Convert Commas To Pipes and Align To Pipes---
    " Step_0: Remove newlines within the CSV fields.
    silent call RemoveNewlinesInCsvFields()
    " Step_1: Convert all commas inside double-quotes to {;}.
        " {;} is a string that is not likely to occur in the csv file.
        " And we can easily find this string later and turn it back into a
        " comma.
    silent %s/\(".\{-}"\)/\= substitute( submatch(0), ',', '{;}', 'g' )/g
    " Step_2:
    " Convert all commas to pipes.
    silent %s/,/|/g
    " Step_3:
    " Convert {;} back to comma.
    silent %s/{;}/,/g
    " Step_4:
    " Add pipes at start and end of all lines.
    silent %s/.*/|\0|/g
    " Align entire buffer to pipes.
    silent execute "%EasyAlign*|"

    " ---Fix the View---
    execute "set filetype=markdown"
    execute "normal! zR"
    " Add a ---- under the header row.
    execute "normal! ggyyp"
    s/[^|]/-/g
    " Turn off soft-wrapping (tables look bad when text autowraps the screen)
    execute "set nowrap"
    " Return cursor to original position.
    call setpos('.', save_cursor)
    echomsg s:happy_kitty . "   CSV file converted to a table."
endfunction
"}}}
function! FirstTryAtCsvToVimTable()
    " Dev:
        " %s/,/|/g
            " replace , with | in entire file
        " ggVG
            " select entire file in visual mode
        " gv
            " re-select the selection
        " ga*|
            " align selection to | using the Easy-Align plugin
            " need to do this with `normal` not `normal!`
        " change filetype to markdown for syntax
            " `csv` is not recognized as any special filetype.
            " Use markdown to see if anything will show up odd as
            " markdown.
        " zR
            " unfold all folds
        " set nowrap
        " Turn off wrapping so that text does not wrap if it runs past
        " the end of the window.
    " TODO: ignore ',' inside double quotes
    " TODO: First check the file *does not use { or }*
    " Now surround all occurrences of double quotes with {}:
    execute '%s/\(".\{-}"\)/{\0}/g'
        " \( \)
            " parentheses around an expression
        " \{-}
            " \{-} is like * but it uses the *least* number of characters to
            " satisfy the match
        " \0
            " replace using the matched string
            " Add whatever you want before and after the matched string.
            " I added { and }.
        " Example:
        " foo bar "field 1: value 1, value2", "field2: value 3"
        " becomes
        " foo bar {"field 1: value 1, value2"}, {"field2: value 3"}
    " Now replace all `,` with `;` within the double quotes
    execute
    " stuck
        " see:
        " <https://vim.fandom.com/wiki/Search_for_lines_not_containing_pattern_and_other_helpful_searches>
        " I'm sure there's a way via regex only to do this, but I spent four hours
        " and couldn't do it!
        "
        " I also tried doing this by making a macro:
        " let line_number = line(".")
            " (save line number because the cursor moves to next line after macro)
        " let @a = '0f"vf":s/\%V,/;/g'
        " execute line_number
            " (goes back to the line just edited)
        " This is on the right track, but it also changes the ',' outside the double
        " quotes, inbetween the groups of double-quotes.
        " Macro-less regex solutions suffer from the same.
        " I can specify what must come *before* the first ',' match, but I cannot
        " specify the ',' occurs between a pair of '"'.
    execute "%s/,/|/g"
        " This converts *all* commas,
        " but I need to *ignore* commas inside double quotes.
    execute "normal! ggVG"
    " execute "normal gvga*|"
    execute "set filetype=markdown"
    execute "normal! zR"
    execute "normal! ggyyp"
    execute "s/[^|]/-/g"
    execute "set nowrap"
    call setpos('.', save_cursor)
    echomsg s:happy_kitty . "   CSV file converted to a table."
endfunction


" ---Views and Sessions---
nnoremap <leader>lv :loadview<CR>
nnoremap <leader>mv :mkview<CR>
nnoremap <leader>ls :source ~/sessions/
nnoremap <leader>ms? :echo "This session: " . v:this_session<CR>
nnoremap <leader>ms<Space> :call WriteThisSession()<CR>
function! WriteThisSession()
    execute "mksession! " . v:this_session
    echomsg "mksession! " . v:this_session
    echomsg s:happy_kitty v:this_session "written"
endfunction

" ---Highlights---
" TODO: make search higlight toggle!
    " nnoremap <silent> <leader><Space> :call HighlightSearchToggle()<CR>
    " function! HighlightSearchToggle()
    "     " Note:
    "         " nohlsearch *cannot* be called from inside a function
    "         " Maybe I can do this by making unlikely mappings:
    "         " <leader>1 and <leader>2
    "         " then call `normal <leader>1` and `normal <leader2>`
    "     echomsg s:trippy_kitty
    "     if v:hlsearch != 0
    "         " nohlsearch
    "     else
    "     "     set hlsearch
    "     endif
    " endfunction

" ---Highlights For Search Terms---
" / search for something
" ;<Space> turn off highlight on last search
" ;H turn highlight back on for last search
nnoremap <leader>H :set hlsearch<CR>
" nnoremap <leader><Space> :noh<CR>
    " :noh
        " Clear highlights.
        " Use to remove highlighted search term after doing a `/` search.
        " To clear a line highlighted with ;hh use ;h<Space>

" ---Mark And Highlight This Line---
" ;hh highlight this line
" ;h<Space> turn off the highlight
" 'h go back to the highlighted line
nnoremap <silent> <leader>h<Space> :match<CR>
    " :match
        " turn off the line highlight
nnoremap <silent> <leader>hh :execute 'match Search /\%'.line('.').'l/'<CR>mh
    " Highlight the current line.
    " line('.') gets the current line number
    " mh
        " mark the highlighted line for jumping back to
        " 'h to jump back to the highlighted line
    " My attempt:
        " nnoremap <silent> <leader>hh :execute '/\%' . line(".") . 'l.*'<CR>
    " The one I'm using is from here:
        " http://vim.wikia.com/wiki/Highlight_current_line

nnoremap <leader>opt :call OmniPreviewToggle()<CR>
function! OmniPreviewToggle()
    if matchstr(&completeopt,"preview") == "preview"
        set completeopt-=preview
        echomsg s:blind_kitty.'   Omni complete <C-x><C-o> *without* preview.'
    else
        set completeopt+=preview
        echomsg s:seeing_kitty.'   Omni complete <C-x><C-o> *with* preview.'
    endif
endfunction

nnoremap <leader>rh :syntax sync fromstart<CR>
    ":h syn-sync-first
    "Refresh syntax highlighting.

nnoremap <leader>rs :silent redraw!<CR>
    ":h redraw
    "Refresh screen after X11 writes a bunch of window nonsense that pollutes my
    "Vim view.

" ---Ctags for Python without Cscope---
nnoremap <leader>tf :call ToggleTrueFalse()<CR>
function ToggleTrueFalse()
    if (&filetype != 'python') && (&filetype != 'c') && (&filetype != 'cpp')
        echomsg s:sad_kitty "This is not a Python, C, or C++ file"
        return
    endif
    let l:true_word = 'BOB'
    let l:false_word = 'BOB'
    if (&filetype == 'c') || (&filetype == 'cpp')
        let l:true_word = 'true'
        let l:false_word = 'false'
    elseif (&filetype == 'python')
        let l:true_word = 'True'
        let l:false_word = 'False'
    endif
    " Change the words
    normal! 0f=w"zyiw
    if (&filetype == 'python')
        normal! 0f:b"zyiw
    endif
    if @z == l:false_word
        let new_word = l:true_word
        if (&filetype == 'c') || (&filetype == 'cpp')
            normal! cEtrue; 
        elseif (&filetype == 'python')
            normal! ciwTrue
        endif
        echomsg s:happy_kitty "USER thing turned on."
    elseif @z == l:true_word
        let new_word = l:false_word
        if (&filetype == 'c') || (&filetype == 'cpp')
            normal! cEfalse;
            normal! lx
        elseif (&filetype == 'python')
            normal! ciwFalse
        endif
        echomsg s:happy_kitty "USER thing turned off."
    endif
    " Clear out z register before next call to ToggleTrueFalse()
    let @z = ""
    " Highlight changed line.
    if 0 | execute 'match Search /\%'.line('.').'l/' | endif
    " Highlight all occurrences of new_word.
    " execute 'match Search /'.l:new_word.'/'
    " Put cursor on next line.
    normal! j
endfunction
nnoremap <leader>tv :call TagVimrc()<CR>
function! TagVimrc()
    call system("ctags --language-force=vim vimrc")
    echomsg s:happy_kitty "Updated vimrc tags."
endfunction
" nnoremap <leader>tp<Space> :!ctags % --languages=python<CR>
nnoremap <leader>tp :call PythonTags(v:false)<CR>
function PythonTags(recurse)
    if a:recurse
        " All Python files in this folder:
        let l:cmd = "ctags -R --languages=python"
    else
        " Just the active Python file:
        let l:this_file = expand("%")
        let l:cmd = "ctags "..l:this_file.." --languages=python"
    endif
    call system(l:cmd)
    echomsg s:happy_kitty l:cmd
endfunction
" nnoremap <leader>tp :!ctags -R --languages=python
" I intentionally left off the <CR> so:
" 1. I'd see the command and remember this was an out-of-the-box one-liner.
" 2. I can add `--exclude="tests"` or some such before I hit Enter.
" The Python tags file is for navigating the tag stack:
"   make the tags file, then:
"   Browse:
    " :pta <tab>
        " uses tab-completion to pick the tag
        " see more on the Preview window below
"   Tag_hop:
    " :ts
        " hop at the command line with a menu of tag locations
    " <C-]>
        " hop to definition
    " <C-t>
        " hop backwards in *tag* stack
    " <C-o>
        " hop backwards in *jump* stack
    " ;w]
        " open the tag in a new window
"   Preview:
    " :set previewheight=6
        " set height of the preview window
    " ;w}
        " open the tag in the preview window
        " same as :pta <tag-name>
    " ;wP
        " jump to the preview window
    " ;wp
        " jump back to the previous window
    " ;wz
        " closes the preview window
        " same as :pc
    " :pta
        " reopens a closed preview window
    " :pta <tab>
        " if tag stack is empty, need to pick something to open on
    " :pta <tag-name>
        " open the preview window on <tag-name>
        " :pta uses tab-completion while writing the <tag-name>
"   Tag_complete:
    " i_<C-x><C-]>
        " complete using the tags file
        " ;opt
            " toggle whether omni complete opens the preview window
" Omni completion works independently of the tags file. See my writeup here:
" https://stackoverflow.com/questions/2084875/vims-omnicompletion-with-python-just-doesnt-work/57861300#57861300
" Note there are also other kinds of completion:
" https://stackoverflow.com/questions/2084875/vims-omnicompletion-with-python-just-doesnt-work/57861300#57861300
" i_<C-x><C-n> grabs a keyword from the current file
" i_<C-x><C-i> grabs a keyword from the current *and* included files
"   so this can achieve the same as i_<C-x><C-o>, but it is much slower

nnoremap <leader>ve :call ExampleCheckingIfBuildFailed()<CR>
    "This is an example of how to use CheckIfBuildFailed().
function! ExampleCheckingIfBuildFailed()
    call ReportValidErrors(CheckIfBuildFailed())
endfunction
function! CheckIfBuildFailed()
    " Return 0 if no valid errors, 1 if there are valid errors.
        " Purpose:
        " Why did I write this? I want to know if a build fails or not.
        " All build output ends up in the Quickfix list.
        " 
        "   :len(getqflist())>1 is not robust: build output is multiline.
        "   :clist lists all output indiscriminately.
        "   :cw can differentiate between valid and invalid
        " But :cw has no way to query itself, and detecting the affect of :cw is
        " harder than just writing my own function to parse the quickfix list.
        "
        " Algorithm:
        " If the build output contains a 'valid' build error, the build failed.
        " Vim :make does a good job identifying 'valid' errors in the output.
        " This and other info is stored in the quickfix list: getqflist().
        " Build output Error lines are marked as  {...,'valid': 1,...}.
        " All other build output lines are marked {...,'valid': 0,...}.
        " These invalid lines are just build messages displaying what 'make'
        " actually did given the recipe it executed in the Makefile.
        " Go through every line of getqflist(). It is a list of dictionaries.
        " Pull out the value of 'valid' from each dictionary in the list.
        " Concatenate these values as a string of 0s and 1s.
        " Convert the string to a number and compare it with 0.
        " The number is either 0 (no valid build errors) or nonzero.
    let l:all_the_valids = []
    for qfdict in getqflist()
        call add(l:all_the_valids, qfdict['valid'])
    endfor
    return str2nr(join(l:all_the_valids,''))==0 ? 0 : 1
endfunction
function! ReportValidErrors(HasValidError)
    let l:msg = ''
    if a:HasValidError
        let l:msg = "Valid error in this quick fix list."
    else
        let l:msg = "Every 'valid'==0, no errors in this quick fix list."
    endif
    echohl Error
    echo l:msg
    echohl None
endfunction

"=====[--------------------Before Any Build--------------------]=====
"=====[ Remember to set the Vim pwd to the Makefile directory. ]=====

" Vim out-of-the-box errorformat works with MSVC compiler output: {{{
" errorformat=%*[^"]"%f"%*\D%l: %m,"%f"%*\D%l: %m,%-G%f:%l: (Each undeclared identifier is reported only once,%-G%f:%l: for each function it appears in.),%-GIn file included from %f:%l:%c:,%-GIn file included from %f:%l:%c\,,%-GIn file included from %f:%l:%c,%-GIn file included from %f:%l,%-G%*[ ]from %f:%l:%c,%-G%*[ ]from %f:%l:,%-G%*[ ]from %f:%l\,,%-G%*[ ]from %f:%l,%f:%l:%c:%m,%f(%l):%m,%f:%l:%m,"%f"\, line %l%*\D%c%*[^ ] %m,%D%*\a[%*\d]: Entering directory %*[`']%f',%X%*\a[%*\d]: Leaving directory %*[`']%f',%D%*\a: Entering directory %*[`']%f',%X%*\a: Leaving directory %*[`']%f',%DMaking%*\a in %f,%f|%l| %m
" }}}

" Hardcoded view of summary for Main.gd file.
nnoremap <leader>mcs :call MakeCodeSummary()<CR>
function! MakeCodeSummary()
    execute "silent make code-summary"
    " echomsg s:trippy_kitty
    let orig_window_number = winnr()
    " Find code summary window if it is already open
    " HARDCODING HERE:
    let l:buffer_number = bufnr('dev-view-src/Main.md')
    if l:buffer_number == -1 " Buffer does not exist
        belowright vertical new " Create a new window in a vsplit
        " HARDCODING HERE:
        execute 'view dev-view-src/Main.md'
        setlocal filetype=markdown
    else " Buffer exists
        let window_id = win_findbuf(l:buffer_number)
        if window_id != [] " Window exists
            call win_gotoid(window_id[0]) " Go to first window with this buffer
            " HARDCODING HERE:
            execute 'view dev-view-src/Main.md'
            setlocal filetype=markdown
        else " Buffer exists but it is not open in a window
            belowright vertical new " Create a new window in a vsplit
            " HARDCODING HERE:
            execute 'view dev-view-src/Main.md'
            setlocal filetype=markdown
        endif
    endif
    execute orig_window_number . "wincmd w"
    echo ">▸.~<  See code summary."
    redraw
endfunction

function! MakeQuickfix() "{{{
    "Update the build/ folder in the NERDTree window.
    " call RefreshNERDTreeFolder_build()
        " No, when there are many files, this takes too long.
    "call CloseTestResults()
        " Close test output window before calling copen.
        "       The goal is to prevent the quickfix window from landing below
        "       the test output window. And there really is no reason to still
        "       have test output visible if I'm running Make, so just closing
        "       the window is the simplest solution.
        "       And I already have code that does this. Put that code here!
    cclose
        " Close the existing quickfix window so the size will be automatic.
    copen
        " :cwindow is a little simpler since it only opens if there is an error.
        " But I decided I still want to show the quickfix window if only make
        " was invoked. And if the build succeeds, :cwindow doesn't open it.
    let l:build_failed = CheckIfBuildFailed()
    if l:build_failed
        " ---Set the height of the quickfix window---
        "let l:first_error_line = line('.')
            " Remember the cursor location.
        if len(getqflist()) > 10
            execute (10+2)."wincmd _"
        else
            " Set the quickfix window to the height of the build output.
            execute (len(getqflist())+2)."wincmd _"
            " +2 is to account for some soft-wrapping (long error messages).
        endif
        "execute l:first_error_line
            " Go back to the cursor location.
        call ColorMeQuick()
        cc
            " Place the cursor on the first error in the source code.
        normal! zv
            " Expand any folds hiding the cursor line.
        redraw
        echo "<°.°>  make...failed. Cursor is on the first error."
        "echo "<'.'>  make...failed. Jump to the error with <Enter>, then 'zv' if its hidden in a fold."
    else
        execute (len(getqflist())+1)."wincmd _"
            " Set the quickfix window to the height of the build output.
            " +1 accounts for some soft-wrapping.
        "2wincmd_
            " Shrink the quickfix window to 2 lines high.
        exe winnr('#').'wincmd w'
            " Go back to the window where you invoked make with ;mk.
        redraw
        echo ">^.^<  make...OK."
    endif
    return !l:build_failed
endfunction
"}}}

nnoremap <leader>mct :call MakeCleanTestSuite()<CR><CR>
function! MakeCleanTestSuite()
    " echomsg s:happy_kitty ';mct'
    call CloseTestResults()
    execute "make clean-TestSuite"
    " Open Quickfix window to display bash stderr.
    cclose | copen | execute "wincmd p"
    " call RefreshNERDTreeFolder_build()
        " I comment this out on big projects
endfunction
" cclose<CR>:copen<CR>:call RefreshNERDTreeFolder_build()<CR>
nnoremap <leader>mC  :call CloseTestResults()<CR>:make clean-test-and-lib-builds<CR><CR><CR>:call MakeQuickfix()<CR>
    " I never use this.
    " Just remove the lib-objects and the TestSuite-Results .exe/.md files.
    " Saves on having to rebuild the test framework object files (unity.o,
    " binrepr.o).

nnoremap <leader>mca :call MakeCleanAllBuilds()<CR><CR>
function! MakeCleanAllBuilds()
    call CloseTestResults()
    " execute "make clean-all-builds"
    " Starting May 25th, 2020, just "make clean" for clean all
    execute "make clean"
        "Use execute to watch bash run the command.
    redraw
    echomsg  ">°.°<   Deleting project executable and object files."
    "call system("make clean-all-builds)
        "Use system to run the command quietly in the background.
        "The catch is that this is not the Vim internal make, so it does not
        "populate the quickfix window with errors/warnings, just the invoked
        "build recipe.
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg "┌>^.^<┐  make OK. Cleaned old builds."
        echomsg "└>^.^<┘  "
    endif
endfunction

nnoremap <leader>mkf :make compiler=fake -n unit-test
    " Show the recipes but do not run them.
    " Change the target before pressing enter
    " e.g., change `unit-test` to `avr-target`
" nnoremap <leader>mka :call CloseTestResults()<CR>:make avr-target compiler=avr-gcc<CR><CR><CR>:call MakeQuickfix()<CR>
nnoremap <leader>mka :call CloseTestResults()<CR>:make avr-elf compiler=avr-gcc<CR><CR><CR>:call MakeQuickfix()<CR>
    " Build the TestSuite using avr-gcc.
nnoremap <leader>mna :make avr-elf compiler=avr-gcc -n<CR>
    " See what make recipe is invoked by ;mka.
" ;mpv - Paste Makefile variables output by `print_vars` target{{{
" Example: `print_vars` target{{{
".PHONY: print_vars
"print_vars:
"	echo hw_lib_src: ${hw_lib_src}
"	echo inlhw_lib_src: ${inlhw_lib_src}
"	echo nonhw_lib_src: ${nonhw_lib_src}
" Then from Vim
" :make print_vars -s
" prints the output of each `echo` in the Quickfix window
" `-s` is to suppress printing the rule for each `echo`
"}}}
" PasteMakefileVars{{{
nnoremap <leader>mpv :call PasteMakefileVars()<CR>
function! PasteMakefileVars()
    execute "silent make print-vars -s"
    execute "normal! \<C-L>"
    copen
    normal! "zyG
    execute "wincmd p"
    cclose
    execute "normal! o\<Esc>"
    execute "normal! i```Makefile-variables\<Esc>"
    execute "normal! o\<Esc>"
    execute 'normal! "zP'
    normal! j
    execute "normal! }I```\<Esc>"
    execute "normal! o\<Esc>"
endfunction
"}}}
"}}}
nnoremap <leader>mkr :make reset<CR>
nnoremap <leader>mkp :make test_programmer_is_connected<CR>
nnoremap <leader>mkv :make display_target_voltage<CR>
"nnoremap <leader>mkc :call CloseTestResults()<CR>:make compiler=gcc<CR><CR><CR>:call MakeQuickfix()<CR>
"nnoremap <leader>mkc :call CloseTestResults()<CR>:make compiler=gcc file-stem=%:t:r<CR><CR><CR>:call MakeQuickfix()<CR>
" nnoremap <leader>mkc :call MakeActiveWindowWith(expand("%:t:r"), 'gcc')<CR><CR>
" Why am I setting file-stem? I'm passing the current file name for no reason.
" In other Makefiles, the default target is just markdown output, so I pass in
" the active window file stem to get a markdown file from a C file.
" But the Makefile in `game-dev` has no variable `file-stem`. It only has the
" default target, which for now is just my test results.
" TLDR: MakeDefaultTarget should make the damn default target and not need any
" file name.
" nnoremap <leader>mkwc :call MakeActiveWindowWith(expand("%:t:r"), 'x86_64-w64-mingw32-gcc')<CR><CR>
    " Build using named compiler.
    " If the default target is the TestSuite, build that.

" ---Build Default Target in Makefile---
function! MakeDefaultTargetWith(compiler)
    call CloseTestResults()
    execute "make compiler=" . a:compiler
        "Use execute to watch bash run the command.
    "redraw
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg "┌>^.^<┐  make OK."
        echomsg "└>^.^<┘  Built default target with " . a:compiler . "."
    endif
endfunction
function! MakeDefaultTargetForFileStemWith(compiler)
    call CloseTestResults()
    execute "make file-stem=%:t:r compiler=" . a:compiler
        "Use execute to watch bash run the command.
    "redraw
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg "┌>^.^<┐  make OK."
        echomsg "└>^.^<┘  Built default target with " . a:compiler . "."
    endif
endfunction
function! MakeDefaultTarget() " {{{
    "-B -- Unconditionally rebuild everything.
    " execute "make -B"
    execute "make"
    cclose | copen | wincmd L
    let l:build_failed = CheckIfBuildFailed()
    if l:build_failed
        redraw | echo "<°.°>  ran make, build failed."
    else
        " Go back to the window where you invoked make with ;m.
        exe winnr('#').'wincmd w'
        redraw | echo ">^.^<  ran make, no errors."
    endif
endfunction
"}}}
function! RunHandmade()
    echomsg "Running win32_handmade.exe. Quit with Alt+F4."
    call system("../build/win32_handmade.exe")
    " Note: only use this function if the .exe has a way to quit.
    " If there is no response to quit messages, the .exe locks up Vim and the
    " task manager is the only way to close the .exe.
    " In that early stage, run the game from VisualStudio debugger, or run from
    " PowerShell.
endfunction
" ;m -- make shortcuts {{{
" Note this is not :!make, it's :make
" Vim gets in the middle, and that's why all the
" Quickfix stuff works.
nnoremap <leader>m<Space> :call MakeDefaultTarget()<CR><CR>
nnoremap <leader>mt<Space> :call CloseTests()<CR>:call MakeDefaultTarget()<CR><CR>:call OpenTests()<CR>
nnoremap <leader>mr<Space> :call MakeDefaultTarget()<CR><CR>:call RunHandmade()<CR>
nnoremap <leader>mkfgc  :call MakeDefaultTargetForFileStemWith('gcc')<CR><CR>
nnoremap <leader>mkgc  :call MakeDefaultTargetWith('gcc')<CR><CR>
nnoremap <leader>mkwgc :call MakeDefaultTargetWith('x86_64-w64-mingw32-gcc')<CR><CR>
nnoremap <leader>mkg+  :call MakeDefaultTargetWith('g++')<CR><CR>
nnoremap <leader>mkwg+ :call MakeDefaultTargetWith('x86_64-w64-mingw32-g++')<CR><CR>
nnoremap <leader>mkcl  :call MakeDefaultTargetWith('clang')<CR><CR>
nnoremap <leader>mkwcl :call MakeDefaultTargetWith('x86_64-w64-mingw32-clang')<CR><CR>
nnoremap <leader>mkc+  :call MakeDefaultTargetWith('clang++')<CR><CR>
nnoremap <leader>mkwc+ :call MakeDefaultTargetWith('x86_64-w64-mingw32-clang++')<CR><CR>
" }}}

" ---Build Unittest Target in Makefile---
function! MakeUnittestTargetWith(compiler)
    call CloseTestResults()
    " `execute` -- watch command run in terminal
    " -w flag: entering/leaving directory
    execute "make -w unit-test compiler=" . a:compiler
    " If the build succeeds, close quickfix window and open test output.
    call MakeQuickfixAndTest()
endfunction
nnoremap <leader>mktgc :call MakeUnittestTargetWith('gcc')<CR><CR>
nnoremap <leader>mktg+ :call MakeUnittestTargetWith('g++')<CR><CR>
nnoremap <leader>mktcl :call MakeUnittestTargetWith('clang')<CR><CR>
nnoremap <leader>mktc+ :call MakeUnittestTargetWith('clang++')<CR><CR>

function! MakeActiveWindowWith(file_stem, compiler)
    call CloseTestResults()
    execute "make compiler=" . a:compiler . " file-stem=" . a:file_stem
        "Use execute to watch bash run the command.
    "redraw
    "echomsg  ">°.°<   Building with " . a:compiler . "..."
    "call system("make compiler=gcc file-stem=" . a:file_stem)
        "Use system to run the command quietly in the background.
        "The catch is that this is not the Vim internal make, so it does not
        "populate the quickfix window with errors/warnings, just the invoked
        "build recipe.
    "call MakeQuickfix()
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg "┌>^.^<┐  make OK."
        echomsg "└>^.^<┘  Built default target with " . a:compiler . "."
    endif
endfunction
" TODO: make windows versions of all mkc, mkl, mk+, mtc, mtl, mt+
" I added conditional to Makefile, so all you have to do is pass the right
" compiler. There is only one Makefile.
" nnoremap <leader>mtwc :call 

" Old version with seperate Makefiles:
" nnoremap <leader>mtwc :call MakeWindowsTests('build/TestSuite-results', 'x86_64-w64-mingw32-gcc', 'Makefile-Windows')<CR><CR>
" function! MakeWindowsTests(test_results, compiler, makefile)
"     " specify makefile with `-f`
"     execute "make -f " . a:makefile . " compiler=" . a:compiler
"     let l:build_passed = MakeQuickfix()
"     if l:build_passed
"         redraw
"         echomsg "┌>^.^<┐  make OK."
"         echomsg "└>^.^<┘  Built tests for Windows with " . a:compiler . "."
"     endif
"     " format test_results.md with sed? get project name, date, elapsed time
"     " call system('pandoc -f markdown test_results.md -s -o test_results.html -c pandoc.css --toc')
"     " open test results in chrome
" endfunction

function! OldMakeActiveWindowWithGcc(file_stem)
    call CloseTestResults()
    execute "make compiler=gcc file-stem=" . a:file_stem
        "Use execute to watch bash run the command.
    "redraw
    "echomsg  ">°.°<   Building with gcc... "
    "call system("make compiler=gcc file-stem=" . a:file_stem)
        "Use system to run the command quietly in the background.
        "The catch is that this is not the Vim internal make, so it does not
        "populate the quickfix window with errors/warnings, just the invoked
        "build recipe.
    "call MakeQuickfix()
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg "┌>^.^<┐  make OK."
        echomsg "└>^.^<┘  Built default target with gcc."
    endif
endfunction
"nnoremap <leader>mkl :call CloseTestResults()<CR>:make compiler=clang file-stem=%:t:r<CR><CR><CR>:call MakeQuickfix()<CR>
nnoremap <leader>mkl :call MakeDefaultTargetWithClang(expand("%:t:r"))<CR><CR>
    " Build using clang.
    " If the default target is the TestSuite, build that.
    " If the default target is just markdown output, pass in the active window
    " file stem.
function! MakeDefaultTargetWithClang(file_stem)
    call CloseTestResults()
    "execute "make compiler=clang file-stem=" . a:file_stem
    execute "make --warn-undefined-variables compiler=clang file-stem=" . a:file_stem
    "execute "make -i --warn-undefined-variables compiler=clang file-stem=" . a:file_stem . " > mk-output.md"
    " -i ignores errors (but they still are reported and Vim attempts to open an
    "  empty buffer.
    "  > mk-output.md is no good because it steals the output stream from
    "  QuickFix.
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg "┌>^.^<┐  make OK."
        echomsg "└>^.^<┘  Built default target with clang."
    endif
endfunction
nnoremap <leader>mk+ :call MakeDefaultTargetWithGplusplus(expand("%:t:r"))<CR><CR>
function! MakeDefaultTargetWithGplusplus(file_stem)
    call CloseTestResults()
    execute "make compiler=g++ file-stem=" . a:file_stem
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg "┌>^.^<┐  make OK."
        echomsg "└>^.^<┘  Built default target with g++."
    endif
endfunction
"nnoremap <leader>mk+ :call CloseTestResults()<CR>:make compiler=g++ file-stem=%:t:r<CR><CR><CR>:call MakeQuickfix()<CR>
    " Build the TestSuite using g++.


function! OldmakeQuickfix()
    call CloseTestResults()
        " Close test output window before calling copen.
        "       The goal is to prevent the quickfix window from landing below
        "       the test output window. And there really is no reason to still
        "       have test output visible if I'm running Make, so just closing
        "       the window is the simplest solution.
        "       And I already have code that does this. Put that code here!
    cclose
        " Close the existing quickfix window so the size will be automatic.
    copen
    let there_are_errors=len(getqflist())>1
    if there_are_errors
        call ColorMeQuick()
        " Place the cursor on the first error in the source code.
        cc
        " Expand any folds hiding the cursor line.
        normal! zv
        redraw
        echo "<'.'>  make...failed. Cursor is on the first error."
        " [ ] TODO: search for /\cerror\|warning and if there are no results:
        "echo ">^.^<  make...OK."
    else
        " Shrink the quickfix window to 2 lines high.
        2wincmd_
        " Go back to the window where you invoked make with ;m.
        exe winnr('#').'wincmd w'
        redraw
        echo ">^.^<  make...OK."
    endif
endfunction


nnoremap <leader>mtu :call CloseTestResults()<CR>:make TestUnityExtensions compiler=clang<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
" Old long-time shortcuts, replaced by longer names to allow for Windows and for
" clang++.
" nnoremap <leader>mtc :call CloseTestResults()<CR>:make compiler=gcc<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
" nnoremap <leader>mtl :call CloseTestResults()<CR>:make compiler=clang<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
" nnoremap <leader>mt+ :call CloseTestResults()<CR>:make compiler=g++<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
nnoremap <leader>mtgc :call CloseTestResults()<CR>:make compiler=gcc<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
nnoremap <leader>mtwgc :call CloseTestResults()<CR>:make compiler=x86_64-w64-mingw32-gcc<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
nnoremap <leader>mtg+ :call CloseTestResults()<CR>:make compiler=g++<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
nnoremap <leader>mtwg+ :call CloseTestResults()<CR>:make compiler=x86_64-w64-mingw32-g++<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
nnoremap <leader>mtcl :call CloseTestResults()<CR>:make compiler=clang<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
nnoremap <leader>mtwcl :call CloseTestResults()<CR>:make compiler=x86_64-w64-mingw32-clang<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
nnoremap <leader>mtc+ :call CloseTestResults()<CR>:make compiler=clang++<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
nnoremap <leader>mtwc+ :call CloseTestResults()<CR>:make compiler=x86_64-w64-mingw32-clang++<CR><CR><CR>:call MakeQuickfixAndTest()<CR>
    " Run the default make target and unittest if no errors.
    " Same as the two mappings: ;mk ;te
nnoremap <leader>k 
            \:call TestLineBreak()<CR>
function! TestLineBreak()
    echomsg s:trippy_kitty
endfunction
"nnoremap <leader>mfa :call CloseLogfileWindows()<CR>:make avr-target compiler=avr-gcc<CR><CR><CR>:call MakeQuickfixAndDownloadFlash()<CR><CR>
" nnoremap <leader>mfa :call avrmake#CloseLogfileWindows()<CR>
            " \:make avr-target compiler=avr-gcc<CR><CR><CR>
            " \:call MakeQuickfixAndDownloadFlash()<CR><CR>
nnoremap <leader>mfa :call BuildAndDownloadFlash()<CR><CR><CR>
function! BuildAndDownloadFlash()
    " call avrmake#CloseLogfileWindows() -- nah, this is just annoying
    execute 'make avr-target compiler=avr-gcc'
    " Build the TestSuite using avr-gcc.
    " If the build is OK, download flash.
    call MakeQuickfixAndDownloadFlash()
    redraw | echomsg s:happy_kitty | return
endfunction
nnoremap <leader>mrc :call MakeDefaultTargetAndReadOutput(expand("%:t:r"), 'gcc')<CR><CR>
function! MakeDefaultTargetAndReadOutput(file_stem, compiler)
    call CloseExampleOutputWindows()
    call MakeActiveWindowWith(a:file_stem, a:compiler)
    call ReadExampleOutput(expand("%:t:r"))
endfunction
nnoremap <leader>mrl :call MakeDefaultTargetWithClangAndReadOutput(expand("%:t:r"))<CR><CR>
function! MakeDefaultTargetWithClangAndReadOutput(file_stem)
    call CloseExampleOutputWindows()
    call MakeDefaultTargetWithClang(a:file_stem)
    call ReadExampleOutput(expand("%:t:r"))
endfunction
nnoremap <leader>mr+ :call MakeDefaultTargetWithGplusplusAndReadOutput(expand("%:t:r"))<CR><CR>
function! MakeDefaultTargetWithGplusplusAndReadOutput(file_stem)
    call CloseExampleOutputWindows()
    call MakeDefaultTargetWithGplusplus(a:file_stem)
    call ReadExampleOutput(expand("%:t:r"))
endfunction
nnoremap <leader>coc :call CompileObject("gcc")<CR>
nnoremap <leader>col :call CompileObject("clang")<CR>
nnoremap <leader>co+ :call CompileObject("g++")<CR>
function! CompileObject(compiler)
    "Remove the existing object file in './build/'.
    "Replace it with a new object file.
    "Usage:
        "Place the cursor in the window with the file to compile.
        "This is how Vim gets the file-stem name.
        "Args: compiler: compiler name as a string.

    "call system() "no, this will not show me any compiler messages
    execute "!clear;"
        \ "rm -f " ."./build/" .expand("%:t:r"). ".o;"
        \ .a:compiler
        \ "-Wall -Wextra -pedantic"
        \ "-c ./src/" . expand("%:t:r") . ".c"
        \ "-o ./build/" . expand("%:t:r") . ".o"
    redraw
    echomsg ">^.^< Built " . expand("%:t:r") . ".o with" a:compiler . "."
endfunction
"nnoremap <leader>mrl :call CloseTestResults()<CR>:call CloseExampleOutputWindows()<CR>:make compiler=clang file-stem=%:t:r<CR><CR><CR>:call ReadExampleOutput(expand("%:t:r"))<CR><CR>
    " Context: learning by writing some example code.
    " Build the example into an executable that writes to stdout.
    " 'make' runs the executable to create a .md and erases the executable.
    " If the build is OK, open the .md file readonly.
    "Old version that required hard-coding the filename in the Makefile:
    ":make example compiler=clang<CR><CR><CR>:call ReadExampleOutput()<CR><CR>
nnoremap <leader>rf :call ReadFailedOutput(expand("%:t:r"))<CR>
function! ReadFailedOutput(file_stem)
    echomsg ">^.^ file stem is '" . a:file_stem . "'."
    call ReadMarkdownFile(a:file_stem . "_stderr.md")
endfunction
nnoremap <leader>re :call ReadOutput(expand("%:t:r"))<CR>
    "TODO: Why does ;mre not always call ReadExampleOutput? I have no idea.
    "Place the cursor in a window with the .c source when using ;re. The stem of
    "the .c source file is used to find the .md file.
function! ReadOutput(file_stem)
    echomsg ">^.^ file stem is '" . a:file_stem . "'."
    call ReadMarkdownFile(a:file_stem . ".md")
endfunction
function! ReadMarkdownFile(file_name)
    echomsg ">^.^<   Read stdout/stderr from '" . a:file_name . "'."
    let not_invoked_from_nerdtree_window =
        \!(
            \ (&filetype == 'nerdtree')
            \ &&
            \ (&buftype == 'nofile')
        \ )
    "call RefreshNERDTreeFolder_build()
        " very slow when there are many files in the build folder
    execute "NERDTreeFocus"
    let l:match = search(a:file_name)
        "Find the .md output file.
            " If there are no matches,
            " l:match == 0 and the cursor is on 'build/'
            " If there are matches,
            " l:match > 0 and the cursor is on the first match.
    if l:match > 0
        execute "normal s"
            " Open in a vertical split."
        execute "set readonly"
        execute "normal! zR"
            " Unfold all.
        execute "noh"
            " Remove highlighting from the last search
        redraw
        echomsg ">^.^<  '" . a:file_name . "' is shown. ';r<Space>' to close."
    else
        if not_invoked_from_nerdtree_window
            execute "wincmd p"
            " Return to the window where ;nr was invoked.
        endif
        redraw
        echomsg "<-.->  There is no '" . a:file_name . "' in the build/ folder."
    endif
endfunction

function! _ReadExampleOutput(file_stem)
    echomsg ">^.^ file stem is '" . a:file_stem . "'."
    execute "/" . a:file_stem
endfunction
function! ReadExampleOutput(file_stem)
    echomsg ">^.^<   Read output from '" . a:file_stem . ".exe'."
    " refresh
    call RefreshNERDTreeFolder_build()
    " TODO: Refactor with RefreshNERDTreeWindow() to remove duplication.
    " Open the .md file created when building and running the example with make.
    " Open the files from NERDTree to use NERDTree's window management.

    let not_invoked_from_nerdtree_window =
        \!(
            \ (&filetype == 'nerdtree')
            \ &&
            \ (&buftype == 'nofile')
        \ )
    execute "NERDTreeFocus"
    "=====[ ReadExampleOutput starts here ]=====
    " TODO: Come back to this later when the fragility is troublesome.
        " The following sequence is fragile.
        " It depends on there being at least one file already open.
        " NERDTree does not have any means to control where "s" and "i" open new
        " windows. The defaults are good, but it required the following fragile
        " kludge for what the vsplit/hsplit I wanted.
    execute "/" . a:file_stem . "\.md"
        "Find the .md output file.
    execute "normal s"
        " Open in a vertical split."
    execute "set readonly"
    execute "normal! zR"
    "=====[ ReadExampleOutput ends here ]=====
    execute "noh"
        " Remove highlighting from the last search
    redraw
    echomsg ">^.^<  " . a:file_stem . ".c built successfully.   "
        \">▸.~<  " . a:file_stem . ".md is shown. ';r<Space>' to close."
endfunction
function! MakeQuickfixAndTest()
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        " Close the quickfix window.
        cclose
        redraw
        echomsg ">^.^<  make...OK.    <°.°>  Running unit tests..."
        "call RunUnityTestSuite()
        "2018-04-18: Refactored to match new Makefile.
        call ReadTestResults()
        redraw
        echomsg ">^.^<  make...OK.    >▸.~<  Unit tests finished: see results above. "
    endif
endfunction
nnoremap <leader>fa :call DownloadFlash()<CR>
function! DownloadFlash()
    "echo "DownloadFlash >^.^<"
    execute "make download_flash"
    "Refresh the build folder.
    " call nerdtree_#RefreshFolder('build')
    " well why? -- the open logs shortcut will refresh the build folder
endfunction
function! MakeQuickfixAndDownloadFlash()
    "=====[ Summary: ]=====
        " Download the build to flash memory.
        " Open log file windows: the atprogram output to stdout and stderr.
    " Other MakeQuickfixAndBlah functions close the quickfix window.
    " Leave the quickfix window open since there are no tests to look at.
    let l:build_passed = MakeQuickfix()
    if l:build_passed
        redraw
        echomsg ">^.^<  make with avr-gcc...OK.    <°.°>  Downloading flash..."
        call DownloadFlash()
        "Go to NERDTree window."
        "Open *stdout.log in vsplit. Open *stderr.log in hsplit.
        " call OpenDownloadFlashLogs() -- nah, this is just annoying
    endif
    " echomsg s:sad_kitty . 'Build failed.'
endfunction
function! OpenDownloadFlashLogs()
    let pwd_head = avrmake#PwdHead()
    " echomsg s:trippy_kitty . 'head: `' . pwd_head . '`' | return
    " echomsg s:happy_kitty | return
    let not_invoked_from_nerdtree_window =
        \!(
            \ (&filetype == 'nerdtree')
            \ &&
            \ (&buftype == 'nofile')
        \ )
    if !nerdtree_#RefreshFolder('build') | return | endif
    "
    " Refresh succeeded.
    execute "NERDTreeFocus"
    " ---flash success/fail---
    " call search('atprogram-download_flash-stdout.log')
    " Open in a horizontal split, leave focus in NERDTree window.
    " execute "normal gi"
    " ---flash error log---
    " call search('atprogram-download_flash-stderr.log')
    " execute "normal gi"
    " ---.elf sizes---
    " pwd_head is either `simBrd` or `mBrd`
    call search('avr-size_' . pwd_head . '.log')
    execute "normal gi"
    " call avrmake#ResizeWindowHeight('build/atprogram-download_flash-stdout.log', 3)
    " call avrmake#ResizeWindowHeight('build/atprogram-download_flash-stderr.log', 3)
    call avrmake#ResizeWindowHeight('build/avr-size_' . pwd_head . '.log', 3)
    " echomsg s:happy_kitty | return
    if not_invoked_from_nerdtree_window
        execute "wincmd p"
        " Return to the original window.
    endif
    echomsg ">▸.~<  flash_download logs are shown. ';f<Space>' to close."
endfunction
"Old version
function! OldOpenDownloadFlashLogs()
    " echomsg s:happy_kitty | return
    " TODO: Refactor with RefreshNERDTreeWindow() to remove duplication.
    " Open the log files created when downloading the flash with make
    " download_flash.
    " Open the files from NERDTree to use NERDTree's window management.
    let not_invoked_from_nerdtree_window =
        \!(
            \ (&filetype == 'nerdtree')
            \ &&
            \ (&buftype == 'nofile')
        \ )
    " echomsg s:happy_kitty | return
    " Go to NERDTree window.
    execute "NERDTreeFocus"
    " Place cursor on root folder to jump past any bookmarks with the word
    " 'build'
    execute "normal P"
    " echomsg s:happy_kitty | return
    "=====[ OpenDownloadFlashLogs starts here ]=====
    " /build\/ " old way
    " new way: use `search()`, `W` means `don't Wrap around the end`
    if !search('build', 'W')
        echomsg 'Cannot see `build` folder.'
        return
    endif
    " echomsg s:happy_kitty | return
    execute "normal O"
        " NERDTree-O opens a node recursively. This guarantees it will be open.
        " NERDTree-o toggles a node open and closed.
        " Note this must be 'normal' and not 'normal!' for 'O' to behave as
        " 'NERDTree-O' because 'O' already has a Vim mapping.
    " /atprogram-download_flash-stdout\.log " old way
    call search('atprogram-download_flash-stdout.log') " new way
    " echomsg s:happy_kitty | return
    execute "normal gi"
        " Open in a horizontal split, leave focus in NERDTree window.
    " echomsg s:happy_kitty | return
    " execute "wincmd r"
        " Swap positions with whatever file was already open so that NERDTree-i
        " opens stderr.log in a horizontal split with stdout.log.
    " /atprogram-download_flash-stderr\.log " old way
    call search('atprogram-download_flash-stderr.log') " new way
    execute "normal gi"
        " Open in a horizontal split, leave focus in NERDTree window.
    " echomsg s:happy_kitty | return
    "=====[ OpenDownloadFlashLogs ends here ]=====
    if not_invoked_from_nerdtree_window
        execute "wincmd p"
        " Return to the window where ;nr was invoked.
    endif
    execute "noh"
        " Remove highlighting from the last search
    redraw
    " echomsg ">^.^<  simBrd build OK and flash downloaded.   "
    echomsg ">▸.~<  flash_download logs are shown. ';f<Space>' to close."
endfunction
function! TryListingBuffers()
    "This is me figuring out how to use Vim lists again...
    "=====[ Example from last time I used Vim lists]=====
    "let l:all_the_valids = []
    "for qfdict in getqflist()
    "    call add(l:all_the_valids, qfdict['valid'])
    "endfor
    "return str2nr(join(l:all_the_valids,''))==0 ? 0 : 1
    "=====[ End Example ]=====
    let l:logfile_buffers = [
        \'./build/atprogram-download_flash-stdout.log',
        \'./build/atprogram-download_flash-stderr.log'
        \]
    for logfile in logfile_buffers
        echo logfile
    endfor
endfunction

function! Run(target, os)
    if a:os == 'linux'
        echomsg s:happy_kitty "Running build/"..a:target.." ("..a:os..")"
        let l:use_terminal = v:true
        if l:use_terminal
            exec "botright terminal ./build/"..a:target
            wincmd p
        else
            exe "!./build/"..a:target
        endif
    endif
    if a:os == 'windows'
        " Code below is not tested
        echomsg s:trippy_kitty "Running build/"..a:target.." ("..a:os..")"
        " exec "!./build/"..a:target..".exe"
    endif
endfunction
nnoremap <leader>r<Space> :call RunMain(CheckOs())<CR>
function! RunMain(os)
    if a:os == 'linux'
        echomsg s:happy_kitty "Running build/main ("..a:os..")"
        let l:use_terminal = v:true
        if l:use_terminal
            exec "botright terminal ./build/main"
            wincmd p
        else
            exe "!./build/main"
        endif
    endif
    if a:os == 'windows'
        echomsg s:trippy_kitty "Running build/main.exe ("..a:os..")"
        exe "!./build/main.exe"
    endif
endfunction

"After downloading the flash with ;mfa, close the quickfix and atprogram logs.
" nnoremap <leader>r<Space> :cclose<CR>:call CloseExampleOutputWindows()<CR>
function! CloseExampleOutputWindows()
    let l:example_output_buffers = [
        \'./build/' . expand("%:t:r") . '.md',
        \'./build/' . expand("%:t:r") . '_stderr.md'
        \]
    let l:at_least_one_exists = 0
    for l:file in l:example_output_buffers
        let l:file_exists = (bufnr(l:file) != -1) ? 1 : 0
        "echomsg "File exists: " . l:file_exists
        let l:at_least_one_exists = l:at_least_one_exists || l:file_exists
    endfor
    "echomsg "at least one exists: " . l:at_least_one_exists
    if !l:at_least_one_exists
        let l:file_list = ''
        for l:file in l:example_output_buffers
            let l:file_list = l:file_list . ", '" . l:file . "'"
        endfor
        echomsg ">^.^< Closed quickfix window. " . l:file_list . " are not in any buffers."
    else
        for l:logfile in l:example_output_buffers
            let l:buffer_number = bufnr(l:logfile)
            if l:buffer_number != -1
                "Buffer exists... Does the window exist?"
                let window_id = win_findbuf(buffer_number)
                if window_id != []
                    "echo "Markdown output " . l:logfile . 
                    "    \" is at window_id " . string(window_id)
                    let found_it = win_gotoid(window_id[0])
                    if found_it
                        " Close it and delete the buffer.
                        execute "bw!" l:buffer_number
                    else
                        echo "The markdown output window exists but I cannot find it."
                        " TODO: Return an error here to notify the caller.
                        return
                    endif
                else
                    echomsg ">^.^< Closed quickfix window. No open markdown output to close."
                    return
                endif
            endif
        endfor
        echomsg ">^.^<  Closed quickfix window and markdown output."
    endif
endfunction
function! _CloseExampleOutputWindows()
    " Close the ExampleOutputWindows for the active project.
    "TODO: refactor with CloseLogfileWindows().

    let l:example_output_buffers = [
        \'./build/' . expand("%:t:r") . '.md',
        \'./build/' . expand("%:t:r") . '_stderr.md'
        \]
    let l:at_least_one_exists = 0
    for l:file in l:example_output_buffers
        let l:at_least_one_exists = l:at_least_one_exists || ((bufnr(l:file) != -1) ? 1 : 0)
    endfor
    if !l:at_least_one_exists
        let l:file_list = ''
        for l:file in l:example_output_buffers
            let l:file_list = l:file_list . ", '" . l:file . "'"
        endfor
        echomsg ">^.^< Closed quickfix window. " . l:file_list . " are not in any buffers."
    else
        for l:logfile in l:example_output_buffers
            let l:buffer_number = bufnr(l:logfile)
            "if l:buffer_number == -1
                "echo "Nothing to do. Example output " . l:logfile . " is not in any buffer."
                "echomsg ">^.^< Closed quickfix window. No markdown output in any buffers."
            "    return
            if l:buffer_number != -1
            "else
                "Buffer exists... Does the window exist?"
                let window_id = win_findbuf(buffer_number)
                if window_id != []
                    "echo "Example output " . l:logfile . 
                    "    \" is at window_id " . string(window_id)
                    let found_it = win_gotoid(window_id[0])
                    if found_it
                        " Close it and delete the buffer.
                        execute "bd!" l:buffer_number
                    else
                        echo "The example output window exists but I cannot find it."
                        " TODO: Return an error here to notify the caller.
                        return
                    endif
                else
                    "echo "Nothing to do: " . l:logfile . 
                    "    \" is in buffer " . l:buffer_number .
                    "    \", but is not in any window."
                    echomsg ">^.^< Closed quickfix window. No open example output to close."
                    return
                endif
            endif
        endfor
        echomsg ">^.^<  Closed quickfix window and markdown output."
endfunction
nnoremap <leader>f<Space> :cclose<CR>:call avrmake#CloseLogfileWindows()<CR>
"nnoremap <leader>f<Space> :cclose<CR>:call CloseLogfileWindows()<CR>
"old
"function! CloseLogfileWindows()
"    "TODO" get rid of those return statements! Whichever file is found missing
"    "first, the whole function gets exited, even if there are other files that
"    "are open.
"    " Close the LogfileWindows for the active project.
"    "Replaced the following with a list:
"        "let l:log_atprogram_stdout = './build/atprogram-download_flash-stdout.log'
"        "let l:log_atprogram_stderr = './build/atprogram-download_flash-stderr.log'
"        "let l:buffer_number_stdout = bufnr(l:log_atprogram_stdout)
"        "let l:buffer_number_stderr = bufnr(l:log_atprogram_stderr)
"        "let l:buffer_number = l:buffer_number_stderr

"    let l:logfile_buffers = [
"        \'./build/atprogram-download_flash-stdout.log',
"        \'./build/atprogram-download_flash-stderr.log'
"        \]
"    for l:logfile in l:logfile_buffers
"        let l:buffer_number = bufnr(l:logfile)
"        if l:buffer_number == -1
"            "echo "Nothing to do. Logfile " . l:logfile . " is not in any buffer."
"            echomsg ">^.^< Closed quickfix window. No logfiles in any buffers."
"            return
"        else
"            "Buffer exists... Does the window exist?"
"            let window_id = win_findbuf(buffer_number)
"            if window_id != []
"                "echo "Logfile " . l:logfile . 
"                "    \" is at window_id " . string(window_id)
"                let found_it = win_gotoid(window_id[0])
"                if found_it
"                    " Close it and delete the buffer.
"                    execute "bd!" l:buffer_number
"                else
"                    echo "The logfile window exists but I cannot find it."
"                    " TODO: Return an error here to notify the caller.
"                    return
"                endif
"            else
"                "echo "Nothing to do: " . l:logfile . 
"                "    \" is in buffer " . l:buffer_number .
"                "    \", but is not in any window."
"                echomsg ">^.^< Closed quickfix window. No open logfile to close."
"                return
"            endif
"        endif
"    endfor
"    echomsg ">^.^<  Closed windows with quickfix and atprogram-flash_download logs."
"endfunction

" nnoremap <leader>t<Space> :cclose<CR>:call CloseTestResults()<CR>
nnoremap <leader>t<Space> :make tags<CR>
nnoremap <leader>te<Space> :call BuildAndRunTarget("test")<CR><CR>
function BuildAndRunTarget(target)
    echomsg s:happy_kitty a:target
    exec "make" a:target
    let l:build_failed = CheckIfBuildFailed()
    if l:build_failed
        copen
    else
        call Run("test", CheckOs())
    endif
endfunction
" nnoremap <leader>ts :make show-tags<CR><CR>:copen<CR>:wincmd J<CR>
nnoremap <leader>ts :make tags-stdout<CR><CR>:copen<CR>:wincmd J<CR>
" nnoremap <leader>t<Space> :cclose<CR>:call CloseTests()<CR>
function! CloseTestResults()
    " if FileTypeIs('c')
    if (&filetype == 'c') || (&filetype == 'cpp')
        call CloseCTestResults()
    elseif &filetype == 'python'
        call ClosePythonTestResults()
    else
        echo s:sad_kitty "  This is file is not C or Python."
    endif
endfunction
function! ClosePythonTestResults()
    cclose " close quickfix window
    if CloseWindowWithBufferNumber(bufnr("pytest-testdox-output"))
        echomsg ">^.^<  Closed Python test result window."
    endif
endfunction
function! CloseWindowWithBufferNumber(buffer_number)
    if a:buffer_number == -1
        "Nothing to do.
        echomsg ">^.^< No open test results to close."
        return
    else
        let window_id = win_findbuf(a:buffer_number)
        if window_id != []
            "echo "Test Window exists!"
            let orig_window_number = winnr()
            let found_it = win_gotoid(window_id[0])
            if found_it
                " Close it. No, just closing the window is not enough.
                "execute "wincmd c"
                " Close it and delete the buffer.
                execute "bd!" a:buffer_number
                " [ ] TODO: Why not change bd! to bw!
            else
                echo "The window exists but I cannot find it."
                " TODO: Return an error here to notify the caller.
                return 0
            endif
            execute orig_window_number . "wincmd w"
        else
            " This buffer is in memory but not in any window. It is unlisted.
            execute "bw!" a:buffer_number
            echo "---Wiping test results buffer from memory" a:buffer_number ."---"
            "echo "Test window is closed, but I can still see the buffer number."
        endif
    endif
    return 1
endfunction
" CloseTests() {{{
function! CloseTests()
    " let l:buffer_number = bufnr('../build/test_runner.md')
    let l:buffer_number = bufnr('build/test_runner.md')
    if l:buffer_number == -1
        "Nothing to do.
        echomsg ">^.^< Closed quickfix window. No open test results to close."
        return
    else
        let window_id = win_findbuf(l:buffer_number)
        if window_id != []
            "echo "Test Window exists!"
            let orig_window_number = winnr()
            let found_it = win_gotoid(window_id[0])
            if found_it
                " Close it. No, just closing the window is not enough.
                "execute "wincmd c"
                " Close it and delete the buffer.
                execute "bd!" l:buffer_number
                " [ ] TODO: Why not change bd! to bw!
            else
                echo "The TestSuite-results window exists but I cannot find it."
                " TODO: Return an error here to notify the caller.
                return
            endif
            execute orig_window_number . "wincmd w"
        else
            " This buffer is in memory but not in any window. It is unlisted.
            execute "bw!" l:buffer_number
            echo "---Wiping unlisted project test buffer" l:buffer_number ."---"
            "echo "Test window is closed, but I can still see the buffer number."
        endif
    endif
    echomsg ">^.^<  Closed test result window and quickfix window."
endfunction
"}}}
function! CloseCTestResults()
    " Close the TestResultWindow for the active project.
    " If the TestResultWindow for another project is visible, do nothing to it.
    "echo ">^.^<"
    let l:buffer_number = bufnr('./build/TestSuite-results.md')
    if l:buffer_number == -1
        "Nothing to do.
        echomsg ">^.^< Closed quickfix window. No open test results to close."
        return
    else
        let window_id = win_findbuf(l:buffer_number)
        if window_id != []
            "echo "Test Window exists!"
            let orig_window_number = winnr()
            let found_it = win_gotoid(window_id[0])
            if found_it
                " Close it. No, just closing the window is not enough.
                "execute "wincmd c"
                " Close it and delete the buffer.
                execute "bd!" l:buffer_number
                " [ ] TODO: Why not change bd! to bw!
            else
                echo "The TestSuite-results window exists but I cannot find it."
                " TODO: Return an error here to notify the caller.
                return
            endif
            execute orig_window_number . "wincmd w"
        else
            " This buffer is in memory but not in any window. It is unlisted.
            execute "bw!" l:buffer_number
            echo "---Wiping unlisted project test buffer" l:buffer_number ."---"
            "echo "Test window is closed, but I can still see the buffer number."
        endif
    endif
    echomsg ">^.^<  Closed test result window and quickfix window."
endfunction
"Snippet for reporting when multiple TestSuite-results buffers are open.
    "Do nothing if there is more than buffer named TestSuite-results.md
    "This might come in handy later, though it ony works if the buffers have not
    "been deleted. A deleted buffer is still findable, but bufnr() does not
    "consider it. The only way to catch this is to combine wrap bufnr() inside
    "of win_findbuf() and test for an empty list.
    "let l:buffer_number = bufnr('TestSuite-results.md')
    "    if l:buffer_number == -1
    "        echo "<°.°>   There is more than one TestSuite-results buffer open."
    "        return
    "    endif

" nnoremap <leader>te :call CloseTestResults()<CR>:call ReadTestResults()<CR>
"nnoremap <leader>te :call CloseTestResults()<CR>:call RunUnityTestSuite()<CR>
function! DeleteOldTestResultsMd()
    " Delete the test-results .md file.
        " The old test-results .md file hides a failed build. If a build fails,
        " my program should not call RunUnityTestSuite, but it does because it's
        " not trivial to detect a failed build. RunUnityTestSuite runs
        " TestSuite.exe. If that file does not exist, it should be game over
        " because that file generates the markdown file. But if a previous
        " markdown file still exists, it gets opened in the buffer.
        "execute "!clear;"
        "execute "normal! \<CR>"
        "execute "!"
        "    \ ."rm -f " ."./TestSuite-results.md"
    " [ ] Refactor this so that the Makefile generates the markdown file to.
        " That ought to simplify things considerably.
        " It will hopefully improve the make message also so that I don't have
        " to run make twice to see this message:
        "No rule to make target 'test/test_examples.c', needed by 'build/TestSuite.exe'.
    call system('rm -f ./build/TestSuite-results.md')
endfunction

" ViewPythonTestOutput() -- view output and put docstring in default reg"{{{
" Open test results in bottom Vim window
" Window height snaps to the test results
" Put 'Behavior' docstring in default reg
" Return number of ✗ marks in pytest-testdox output
function! ViewPythonTestOutput(testoutput_file)
    call CloseTestResults()
    " Save window number
    let orig_window_number = winnr()
    " Save cursor position
    let save_cursor = getcurpos()
    execute "botright split" a:testoutput_file
    " This worked, now w! fails with CONVERSION ERROR on the lines with check marks
    " replace \u2713 with ✓ mark, silent to suppress E486: Pattern not found
    silent! execute '%s/\\u2713/✓/g'
    " replace \u2717 with ✗ mark
    silent! execute '%s/\\u2717/✗/g'
    " replace <Space>DOT with .
    silent! execute '%s/\(\s\)DOT\(\s\)/./g'
    " replace <Space>COMMA with ,
    silent! execute '%s/\(\s\)COMMA\(\s\)/,/g'
    " replace <Space>OPENPAREN with ( (match trailing \s 0 or more times)
    " silent! execute '%s/\(\s\)OPENPAREN\(\s\)*/(/g'
    silent! execute '%s/OPENPAREN/(/g'
    " replace CLOSEPAREN with ) (do not erase trailing space)
    silent! execute '%s/CLOSEPAREN/)/g'
    " replace SQUOTE with '
    silent! execute "%s/SQUOTE/'/g"
    silent! execute '%s/DQUOTE/"/g'
    silent! execute "%s/COLON/:/g"
    silent! execute "%s/PLUS/+/g"
    " replace <Space>UNDERSCORE<Space> with _
    silent! execute '%s/\(\s\)UNDERSCORE\(\s\)/_/g'
    " Encode as utf-8 for ✓ and ✗. DOS error if fileencoding is latin1
    set fileencoding=utf-8
    " color passing tests green
    :match Title /✓.*/
    " color failing tests red
    :2match ErrorMsg /✗.*/
    " Save the fomatted test output
    execute "write!" a:testoutput_file
    " Put a Python docstring in the clipboard with the test results
    call DocstringFromPythonTests_ToClipboard()
    " Return -1 if test has ERRORS
    let has_ERRORS = search("ERRORS")
    " Return number of ✗ marks
    let has_x = search("✗")
    " Put cursor on second paragraph
    normal! gg}j
    " Fit window to test results (end of second paragraph)
    normal V}k;f
    " has_ERRORS -- if test cannot run because of ERRORS, stay in window and
    " highlight the errors
    if has_ERRORS > 0
        :match diffFile /.*ERRORS.*\|Traceback/
        :2match ErrorMsg /.*Error\|.* ERROR .*/
        " :3match diffLine /Traceback/
        " Put ERROR and Traceback on vimgrep error list
        vimgrep /\C ERROR \|\CError\|Traceback/ %
        " Open the quickfix window 5 lines high
        copen 5
        " Only put Traceback on vimgrep error list
        " TODO: want this to find Traceback, then put the next line in the error
        " list, not the line with Traceback
        " vimgrep /Traceback:\n.*/ %
        return -1
    endif
    " Return to previous window
    execute orig_window_number . "wincmd w"
    " Restore cursor position
    call setpos('.', save_cursor)
    " has_x -- if any test is FAIL, caller runs pytest again in the console and
    " stops at first FAIL
    return has_x
endfunction
"}}}
" OpenTests {{{
function! OpenTests()
    let orig_window_number = winnr()
    botright new
    " execute 'view ../build/test_runner.md'
    execute 'view build/test_runner.md'
    setlocal filetype=markdown
    execute 'normal! zM'
    syntax clear markdownError
    syntax clear markdownItalic
    call ColorMeUnittest()
    call BufAutoHeight()
    execute 'normal! zR'
    execute 'normal! G'
    " Temp stuff begin
    " execute 'normal! zM'
    " split
    " execute "wincmd p"
    " execute 'normal! za'
    " execute 'normal Vkk;f'
    " execute "wincmd p"
    " call search("S13131Readout")
    " execute 'normal! za'
    " Temp stuff end
    execute orig_window_number . "wincmd w"
    redraw
    echo ">▸.~<  Unit tests finished: see results above."
endfunction
"}}}
function! ReadTestResults()
    "2018-04-18: Refactored to match new Makefile.
        " Refactoring my test-results reporting now that I have the
        " Makefile generating the markdown from the .exe.
    "echomsg ">^.^<"
    " Get the window number so we can return back later.
    let orig_window_number = winnr()
    " Open a new window to display the test results.
    botright new
    " Run the TestSuite and store the test results.
        "execute "call DeleteOldTestResultsMd()"
            "This is unnecessary now because `make` will determine if the
            "TestResults are old based on the prerequisites.
    execute 'view build/TestSuite-results.md'
    " Use markdown style syntax highlighting."
    setlocal filetype=markdown
    " Fold all.
    execute 'normal! zM'
    " But do not highlight `_` in red. `_` delimits words in C function names!
    syntax clear markdownError
    syntax clear markdownItalic
    " Color the test output with Vim matching.
    call ColorMeUnittest()
    "Auto-adjust the window height to fit the test report.
    call BufAutoHeight()
    " Unfold all.
    execute 'normal! zR'
    " Place the cursor on the results line.
    execute 'normal! G'
    " Put the cursor back in the window that invoked the TestSuite.
    execute orig_window_number . "wincmd w"
    redraw
    echo ">▸.~<  Unit tests finished: see results above."
endfunction
function! RunUnityTestSuite()
    " Get the window number so we can return back later.
    let orig_window_number = winnr()
    " Open a new window to display the test results.
    botright new
    " Run the TestSuite and store the test results.
    "execute "call DeleteOldTestResultsMd()\<CR>"
    execute "call DeleteOldTestResultsMd()"
    let test_results = system('./build/TestSuite.exe')
    " Write the results to the screen and to file.
    if append(0, split(test_results, '\n'))
        echo "Error appending test results to TestSuite-results buffer."
        "TODO: cleanup and return.
    else
        write! ./build/TestSuite-results.md
    endif
    "Use the default syntax highlighting."
    setlocal filetype=
    " Color the test output with Vim matching.
    call ColorMeUnittest()
    "Auto-adjust the window height to fit the test report.
    call BufAutoHeight()
    " Put the cursor back in the window that invoked the TestSuite.
    execute orig_window_number . "wincmd w"
    redraw
    echo ">▸.~<  Unit tests finished: see results above."
endfunction

function! OldstableRunUnityTestSuite()
    " Get the window number so we can return back later.
    let orig_window_number = winnr()
    " Use the existing test result window. Create it if it does not exist.
    let buffer_number = bufnr('TestSuite-results.md')
        "bufnr() returns -1 if the buffer does not exist.
        "bufname() returns an empty string if there is no match.
        "But even after the buffer is deleted, it lives on as an unlisted buffer.
        "Use bufexists() to test for the existence of a buffer.
        "No, bufexists() still sees the unlisted buffer.
        "The following tests are insufficient.
            "let test_result_window_exists = buffer_name!=''
            "test_result_window_exists == 1   -   Window exists.
            "test_result_window_exists == 0   -   Window does not exist.
            "buffer_number = bufnr('TestSuite-results.md')
            "bufexists(buffer_number)
        "Use bufnr() followed by win_findbuf().
    let window_id = win_findbuf(buffer_number)
    if window_id == []
        " The window does not exist.
        " Open a new window to display the test results.
        botright new
    else
        " The window exists! Find it.
        let found_it = win_gotoid(window_id[0])
        if found_it
            "Clear the window.
            normal! ggdG
        else
            echo "The TestSuite-results window exists but I cannot find it."
            " Return before you start editing the wrong window.
            return
            " TODO: cleanup before you return.
        endif
    endif
    " Run the TestSuite and store the test results.
    let test_results = system('./build/TestSuite.exe')
    " Write the results to the screen and to file.
    if append(0, split(test_results, '\n'))
        echo "Error appending test results to TestSuite-results buffer."
        "TODO: cleanup and return.
    else
        write! ./build/TestSuite-results.md
    endif
    "Use the default syntax highlighting."
    setlocal filetype=
    " Color the test output with Vim matching.
    call ColorMeUnittest()
    "Auto-adjust the window height to fit the test report.
    call BufAutoHeight()
    " Put the cursor back in the window that invoked the TestSuite.
    execute orig_window_number . "wincmd w"
    redraw
    echo ">▸.~<  Unit tests finished: see results above."
endfunction

function! ColorMeQuick()
    " Highlight the error in the quickfix window.
    normal ;hh
    :match Error /\cerror.*/
        " white text on red background  -- '.*' to end-of-line
    :2match ErrorMsg /undefined.*/
        " red bold text  -- '.*' to end-of-line
    :3match WarningMsg /warning.*/
        " pink bold text  -- '.*' to end-of-line
endfunction
function! ColorMeUnittest()
    " Highlight the error in the quickfix window.
    normal ;hh
    :match ErrorMsg /FAIL.*/
        " white text on red background  -- '.*' to end-of-line
    :2match Cursor /\%1c\d.*/
        " red bold text  -- '.*' to end-of-line
    :3match Define /-\|.*PASS.*/
        " green text -- '.*' to end-of-line
    ":3match Cursor /PASS.*/
        " blue background -- '.*' to end-of-line
    ":3match Comment /PASS.*/
        " subdued
endfunction

" REF: find next line of C code that is not a comment
execute "set <M-j>=\033j"
execute "set <M-k>=\033k"
" REF: find next C comment of type //
execute "set <M-J>=\033J"
execute "set <M-K>=\033K"
" Allows mapping key combinations Alt+j and Alt+k.
nnoremap <M-j> :call NextNonCommentLineOfC('j')<CR>
nnoremap <M-k> :call NextNonCommentLineOfC('k')<CR>
nnoremap <M-J> :call NextCommentLineOfC('j')<CR>
nnoremap <M-K> :call NextCommentLineOfC('k')<CR>
" nnoremap j :call NextNonCommentLineOfC('j')<CR>
" nnoremap k :call NextNonCommentLineOfC('k')<CR>
" nnoremap J :call NextCommentLineOfC('j')<CR>
" nnoremap K :call NextCommentLineOfC('k')<CR>
function! NextCommentLineOfC(direction)
    " Find next line of comment in a C file
    " A comment line is not a line of code or blank line.
    " Works with C++ and C-style comments.
    " Respects folds, i.e., fold-level is preserved and cursor moves as if using
    " j/k normally.
    if (&filetype != 'c') && (expand("%:e") != 'h') && (expand("%:e") != 'cpp') && (expand("%:e") != 'hpp')
        echo s:sad_kitty "  This is not a C file."
        return
    endif
    let save_cursor = getcurpos()
    let found_comment_line = 0
    let done_searching = 0
    while !done_searching
        " Done searching if this is the start/end of the file
        if a:direction == 'j'
            if line('.')==line('$')
                let done_searching = 1
                echo s:sad_kitty ' Searched to end of file.'
            endif
        elseif a:direction == 'k'
            if line('.')==1
                let done_searching = 1
                echo s:sad_kitty ' Searched to start of file.'
            endif
        endif
        " Not at start/end of file yet.
        if !done_searching
            " Go to next line
            execute "normal! " . a:direction
            " Done searching if this line is a C++ comment.
            if matchstr(getline('.'), '\(.*\S.*\)\@<!//') == '//'
                " Regex explanation
                    " \S is non-whitespace
                    " .* is zero or more of any character
                    " \(.*\S.*\) treat this is an atom
                    " The atom is 'any string of characters containing at least one
                    " non-whitespace character'
                    " \@<! require that the PRECEDING atom does NOT match BEHIND
                    " // is a C++ style comment
                    " English: match '//' only if it is preceded by nothing or by white
                    " space. If it is preceded by any non-white space characters, it is not
                    " a match.
                let found_comment_line = 1
                let done_searching = 1
            " Done searching if this line is a C comment.
            elseif matchstr(getline('.'), '\(.*\S.*\)\@<!/\*') == '/*'
                let found_comment_line = 1
                let done_searching = 1
            " Keep searching if this line is not a comment.
            else
                let found_comment_line = 0
                let done_searching = 0
            endif
        else " done_searching
            if a:direction == 'j'
                echo s:happy_kitty "  Moved to next line of code."
                return
            endif
            if a:direction == 'k'
                echo s:happy_kitty "  Moved to previous line of code."
                return
            endif
        endif
    endwhile
endfunction
function! NextNonCommentLineOfC(direction)
    " Find the next line of code.
    " A line of code is not a comment line or blank line.
    " Works with C++ and C-style comments.
    " Respects folds, i.e., fold-level is preserved and cursor moves as if using
    " j/k normally.
    if (&filetype != 'c') && (expand("%:e") != 'h') && (expand("%:e") != 'cpp') && (expand("%:e") != 'hpp')
        echo s:sad_kitty "  This is not a C file."
        return
    endif
    let save_cursor = getcurpos()
    let found_non_comment_line = 0
    let done_searching = 0
    while !done_searching
        " Done searching if this is the start/end of the file
        if a:direction == 'j'
            if line('.')==line('$')
                let done_searching = 1
                echo s:sad_kitty ' Searched to end of file.'
            endif
        elseif a:direction == 'k'
            if line('.')==1
                let done_searching = 1
                echo s:sad_kitty ' Searched to start of file.'
            endif
        endif
        " Not at start/end of file yet.
        if !done_searching
            " Go to next line
            execute "normal! " . a:direction
            " Keep searching if this line is a C++ comment.
            if matchstr(getline('.'), '\(.*\S.*\)\@<!//') == '//'
                " Regex explanation
                    " \S is non-whitespace
                    " .* is zero or more of any character
                    " \(.*\S.*\) treat this is an atom
                    " The atom is 'any string of characters containing at least one
                    " non-whitespace character'
                    " \@<! require that the PRECEDING atom does NOT match BEHIND
                    " // is a C++ style comment
                    " English: match '//' only if it is preceded by nothing or by white
                    " space. If it is preceded by any non-white space characters, it is not
                    " a match.
                let found_non_comment_line = 0
            " Keep searching if this line is a C comment.
            elseif matchstr(getline('.'), '\(.*\S.*\)\@<!/\*') == '/*'
                let found_non_comment_line = 0
            " Keep searching it this line is blank or is only whitespace.
            elseif matchstr(getline('.'), '\S') == ''
                let found_non_comment_line = 0
            " Found a non-comment line! Stop searching.
            else
                let found_non_comment_line = 1
                let done_searching = 1
                if a:direction == 'j'
                    echo s:happy_kitty "  Moved to next line of code."
                    return
                endif
                if a:direction == 'k'
                    echo s:happy_kitty "  Moved to previous line of code."
                    return
                endif
            endif
        endif
    endwhile
    if !found_non_comment_line
        " Failed to find more lines of code.
        " Restore cursor to original position.
        call setpos('.', save_cursor)
        return
    endif
endfunction

" REF: find start of function
" Find the next/prev Python function:
    " the Vim built-in ]m and [m works great with Python:
    " [optional-count] ]m
    " [optional-count] [m
" ]m and [m do not work in C and Vim files
" Use ;]m and ;[m for C and Vim
    " C: search for curly brackets
    " Vim: search for `function!`
nnoremap <leader>jf :call GotoNextStartOfFunction()<CR>
" nnoremap <leader>]m :call GotoNextStartOfFunction()<CR>
nnoremap <leader>kf :call GotoPrevStartOfFunction()<CR>
" nnoremap <leader>[m :call GotoPrevStartOfFunction()<CR>
" TODO: implement these next two for C files as well
" For now, go to function start, then use `%`
nnoremap <leader>jF :call GotoNextEndOfFunction()<CR>
" nnoremap <leader>]M :call GotoNextEndOfFunction()<CR>
nnoremap <leader>kF :call GotoPrevEndOfFunction()<CR>
" nnoremap <leader>[M :call GotoPrevEndOfFunction()<CR>

function! GotoNextEndOfFunction()
    if (&filetype != 'c') && (&filetype != 'vim')
        " This is not a C or Vim file. Use ]m instead of a special ;]m.
        execute "normal ]M"
    else
        if &filetype == 'c'
            call FindNextEndOfCFunc()
        endif
        if &filetype == 'vim'
            /endfunction
        endif
    endif
    echo s:happy_kitty "  Went forward to end of function."
endfunction
function! FindNextStartOfCFunc()
    " Go to start of next function. Only works if { is in first column.
    let save_cursor = getcurpos()
    normal! ]]
    let at_funcdef_start = getline('.')[0] == '{'
    if at_funcdef_start
        " normal! k
        " Alas, I cannot put cursor on func name line
        " or the shortcut gets stuck on this function.
        echomsg "At start of function definition."
        return
    else
        call setpos('.', save_cursor)
        echomsg "No function definitions after cursor."
        return
    endif
endfunction
function! FindPrevStartOfCFunc()
    " Go to start of function. Only works if { is in first column.
    let save_cursor = getcurpos()
    normal! [[
    let at_funcdef_start = getline('.')[0] == '{'
    if at_funcdef_start
        echomsg "At start of function definition."
        return
    else
        call setpos('.', save_cursor)
        echomsg "No function definitions before cursor."
        return
    endif
endfunction
function! FindNextEndOfCFunc()
    " Note: [[ only works if { is in first column.
    " Save cursor position in case next function start is not found.
    let save_cursor = getcurpos()
    let at_funcdef_start = getline('.')[0] == '{'
    if at_funcdef_start
        normal! %
        return
    endif
    let at_funcdef_end = getline('.')[0] == '}'
    if at_funcdef_end
        normal! ]]
        if getline('.')[0] == '{'
            normal! %
            return
        else
            call setpos('.', save_cursor)
        endif
    endif
    " Try to go to previous function start.
    normal! [[
    let at_funcdef_start = getline('.')[0] == '{'
    if at_funcdef_start
        normal! %
        return
    else
        call setpos('.', save_cursor)
    endif
    " Try to go to next function start.
    normal! ]]
    let at_funcdef_start = getline('.')[0] == '{'
    if at_funcdef_start
        normal! %
        return
    else
        call setpos('.', save_cursor)
    endif
endfunction
function! FindPrevEndOfCFunc()
    " Note: [[ only works if { is in first column.
    let save_cursor = getcurpos()
    let at_funcdef_start = getline('.')[0] == '{'
    if at_funcdef_start
        normal! [[
    else
        normal! [[[[
    endif
    let at_funcdef_start = getline('.')[0] == '{'
    if at_funcdef_start
        normal! %
        return
    else
        call setpos('.', save_cursor)
        return
    endif
endfunction
function! GotoPrevEndOfFunction()
    if (&filetype != 'c') && (&filetype != 'vim')
        " This is not a C or Vim file. Use ]m instead of a special ;]m.
        execute "normal [M"
    else
        if &filetype == 'c'
            silent call FindPrevEndOfCFunc()
        endif
        if &filetype == 'vim'
            ?endfunction
        endif
    endif
    echo s:happy_kitty "  Went backward to end of function."
endfunction
" Copy C function signature to register f.
nnoremap <leader>fs :call CopyCFuncSigToReg()<CR>
function! CopyCFuncSigToReg()
    let @f = matchstr(getline('.'),'.*(\&.*)')
    echomsg "Paste signature from register f."
endfunction
" TODO: work on this:
" Copy C function name to register f.
" nnoremap <leader>fn :call CopyCFuncNameToReg()<CR>
" function! CopyCFuncNameToReg()
"     let @f = matchstr(getline('.'),'.*(')
"     echomsg "Paste name from register f."
" endfunction
function! GotoNextStartOfFunction()
    if (&filetype != 'c') && (&filetype != 'vim')
        " This is not a C or Vim file. Use ]m instead of a special ;]m.
        execute "normal ]m"
    else
        if &filetype == 'c'
            " silent call FindNextFunctionDefinition()
            call FindNextStartOfCFunc()
        endif
        if &filetype == 'vim'
            /function!
        endif
    endif
    " echo s:happy_kitty "  Went forward to start of function."
endfunction
function! GotoPrevStartOfFunction()
    if (&filetype != 'c') && (&filetype != 'vim')
        " This is not a C or Vim file. Use ]m instead of a special ;]m.
        execute "normal [m"
    else
        if &filetype == 'c'
            " silent call FindPrevFunctionDefinition()
            call FindPrevStartOfCFunc()
        endif
        if &filetype == 'vim'
            ?function!
        endif
    endif
    " echo s:happy_kitty "  Went backward to start of function."
endfunction

" ---This is old, but I'm afraid to delete it.---
nnoremap <leader>fd :call FindNextFunctionDefinition()<CR>
nnoremap <leader>FD :call FindPrevFunctionDefinition()<CR>
function! FindNextFunctionDefinition()
    let save_cursor = getcurpos()
    " Try to go to the next function.
    normal! 0]]
    let cursor_lnum  = save_cursor[1]
    let funcdef_lnum = getcurpos()[1]
    " First check that we did not just move from a function name to its {.
    let in_same_function = (funcdef_lnum - cursor_lnum) == 1
    if in_same_function
        " Need one more ']]' to get to the next function.
        normal! ]]
    endif
    " Now check that we are actually at a function definition.
    let found_a_funcdef = getline('.')[0] == '{'
    let no_more_functions = !found_a_funcdef
    if no_more_functions
        call setpos('.', save_cursor)
        echo 'Already at last function definition.'
        return
    endif
    "This is the '{' of the next function definition!
    "Now just go up one line to be on the function definition.
    normal! k
    "And restore whatever column the cursor was on.
    let new_cursor = getcurpos()
    let new_cursor[2] = save_cursor[2]
    call setpos('.', new_cursor)
    echomsg 'Moved to next function definition.'
endfunction
function! FindPrevFunctionDefinition()
    let save_cursor = getcurpos()
    " Try to go to the previous function.
    normal! 0[[
    " 0[[ only works *if* the `{` is in the first column.
    " TODO: implement a better method
    let cursor_lnum  = save_cursor[1]
    let funcdef_lnum = getcurpos()[1]
    " Check that we are actually at a function definition.
    let found_a_funcdef = getline('.')[0] == '{'
    if !found_a_funcdef
        call setpos('.', save_cursor)
        echo 'Already at first function definition.'
        return
    endif
    "This is the '{' of the previous function definition!
    "Now just go up one line to be on the function definition.
    normal! k
    "And restore whatever column the cursor was on.
    let new_cursor = getcurpos()
    let new_cursor[2] = save_cursor[2]
    call setpos('.', new_cursor)
    echomsg 'Moved to previous function definition.'
endfunction

" I deprecated this.
" Use the right ftplugins. I should not change foldmethod so
" often I need a shortcut!
"Quickly change fold method: see :h fold-expr
" nnoremap <leader>zm :call SetFoldmethodManual()<CR>
" function! SetFoldmethodManual()
"     " Make large markdown files snappier.
"     " Alas, this is not the problem with my .vimrc lag
"     set foldmethod=manual
" endfunction
" nnoremap <leader>zx :call SetFoldmethodExpr()<CR>
" function! SetFoldmethodExpr()
"     " I think this also calculates folds, so no need to `zx`.
"     " Use this with markdown files.
"     " Also enable markdown folding (this is in my .vimrc):
"     " ```vim
"     " let g:markdown_folding = 1
"     " ```
"     set foldmethod=expr
" endfunction
" nnoremap <leader>zi :call SetFoldmethodIndent()<CR>
" function! SetFoldmethodIndent()
"     " I think this also calculates folds, so no need to `zx`.
"     " Use this with Python scripts and Vim scripts.
"     set foldmethod=indent
" endfunction


" This is all replaced by Tim Pope's `surrounds` and `commentary`.
" The one exception is inserting/deleting spaces around a character:
" ;s<Space> and ;x<Space>
nnoremap <leader>s<Space> :call SurroundCharWithSpace()<CR>
function! SurroundCharWithSpace()
    execute 'normal! i '
    execute 'normal! la '
    execute 'normal! h'
    echomsg s:happy_kitty "SurroundCharWithSpace()"
endfunction
nnoremap <leader>x<Space> :call RemoveCharsAroundChar()<CR>
function! RemoveCharsAroundChar()
    let save_column = getcurpos()[2]
    execute 'normal! hxl'
    if (getcurpos()[2] == save_column) | execute 'normal! xh' | endif
    echomsg ">^.^< RemoveCharsAroundChar()"
endfunction

nnoremap <silent> <leader>gt :s/\w\+/\L\u\0/g<CR>:noh<CR>
    "Make This Line Titlecase.
    "The `g` prefix goes with gu and gU, built-ins for lower and uppercase
    "guiw turns the word lower case, gUiw turns it upper case
    "v<select-text>gu turns the selection lower case
    "v<select-text>gU turns the selection upper case
    "For title-case use gt, but since that is already "go to next tab", precede
    "it with a leader.
    "
    "This next version does the same thing, but I could not get it to work in
    "Visual mode.
        "nnoremap <silent> <leader>gt :s/\v<(.)(\w*)/\u\1\L\2/g<CR>:noh<CR>
        "\v very magic
        "< beginning of a word
        "() grouping into an atom
    "Also seeh :h substitute and search for 'capitalize':
        ":s/\w\+/\u\0/g		 modifies "bla bla"  to "Bla Bla"
        ":s/\w\+/\L\u\0/g		 modifies "BLA bla"  to "Bla Bla"
        "Note the \L forces the words to titlecase.
        "Omitting the \L, "BLA bla" becomes "BLA Bla"
vnoremap <silent> <leader>gt :call VisualSelectionToTitlecase()<CR>
function! VisualSelectionToTitlecase()
    "Make the <Visual Selection> titlecase.
    "Try it out: place the cursor inside <visual seleciton> and press:
    "vi<    to make a selection inside the < >
    ";gt    to convert the selection to titlecase.
    execute 's/\%V\w\+\%V/\L\u\0/g'
    "\%V is "match inside the Visual area." See :h \%V
        "Without \%V, the substitution applies to the whole line:
            "execute 's/\w\+/\u\0/g'
        "And with \%V, the nmap version I copied from Vim help does not work:
            "execute 's/\%V\v<(.)(\w*)\%V/\u\1\L\2/g'
        "Note: if using doublequotes, you need two backslashes!
        "execute "'<,'>s/\\w\\+/\\u\\0/g"
    "noh
endfunction

set nojoinspaces"{{{
    "Vim default is to format paragraphs with two spaces after a sentence.
    "I have mixed feelings on this. I like the look of extra space, but I also
    "like reducing line count. What tips the scale for me is that the single
    "space is considered correct (and the two spaces incorrect) by all of the
    "major style guides for English. So if it's good enough for general writing,
    "I'd say it's good enough for me. The capital letter at the beginning of the
    "sentence ought to be sufficient for the reader.
"}}}
" Timeout instantly on <Esc>{{{
" Instant timeout on "keycodes" so that <Esc> does not wait for an Alt-mapped key.
" Turn on timeout on keycodes.
set ttimeout
" Make timeout instant.
set ttimeoutlen=0
"By setting ttimeoutlen to 0, keycodes time out instantly, but mapping
"timeout is unaffected.
"This addresses the problem that <Esc> has to timeout, so
"after hitting <Esc>, I have to be careful not to hit a mapped key like 'w',
"or I enter a window command by accident.
"
"By default ttimeoutlen is -1, which tells Vim to use timeoutlen as
"tttimeoutlen. By default timeoutlen is 1000ms.
"}}}
" Do not timeout on keyboard shortcut mappings{{{
set notimeout
"Never timeout on mappings.
"1s is a little too short. But why even timeout? If I want to
"end a command I started by accident, I'll just hit Esc.
"}}}
"Special keys see: :h <>
" nnoremap <F2> :call OpenTerminalInVerticalSplit()<CR>
" alternatives to F2:

" REF: edit file in window
" ;eh ;ej ;ek ;el ;eH ;eJ ;eK ;eL
" Edit in a new window.
    " see :h opening-window
    " :sp
    "   - horizontal split this buffer into new window
    "   - same as ;ws
    " :vs
    "   - vertical split this buffer into new window
    "   - same as ;wv
    " :vnew
    "   - vertical split to edit an empty buffer
    " :new
    "   - horizontal split to edit an empty buffer
    "   - same as ;wn
    " Edit the alternate file without first making a window.
    " ;w^
" Edit <filename> without first making a window.
    " :sp <filename>
    "   - example:
    "   - :sp .git/info/exclude
    " :sv <filename>
    "   - same as :sp but open readonly
    "   - the `v` is for `view`
    " :view
    "   - open file read-only
    " :set ro
    "   - change buffer to read-only
    " :sf <filename>
    "   - same as :sp, but search for <filename> in path like in :find
    "   - tab through results found on path
    "   - if filename is found, split and edit
    " Do any of the above *vertically* by prefacing with `:vert`
    " example:
    " :vert sf main.log
" Control *where* splits go:
    " Vertical splits right by default.
    " Preface with :abo to split left (if vertical) and above (if horizontal):
    " :abo vert sf main.log
    " Horizontal splits above by default.
    " Preface with :bel to split right (if vertical) and below (if horizontal):
    " :bel sf main.log
    " Split to top window, full width:
    " :to sf main.log
    " Split to bottom window, full width:
    " :bo sf main.log
    " Split to left or right at full height by combining:
    " :to vert sf tags
    " :bo vert sf tags
    "

" Edit shortcuts to finish as you wish:
" ---`split` to edit, `sview` for read-only, `sfind` to search path---
" sfind is slow
" sview is redundant: can always hammer ;ro to switch to readonly

" Edit in left split.
nnoremap <leader>eh :aboveleft vertical split<Space>

" Edit in right split.
nnoremap <leader>el :belowright vertical split<Space>

" Edit in below split.
nnoremap <leader>ej :belowright split<Space>

" Edit in above split.
nnoremap <leader>ek :aboveleft split<Space>

" Edit at left of screen, full height:
nnoremap <leader>eH :topleft vertical split<Space>

" Edit at right of screen, full height:
nnoremap <leader>eL :botright vertical split<Space>

" Edit at bottom of screen, full width:
nnoremap <leader>eJ :botright split<Space>

" Edit at top of screen, full width:
nnoremap <leader>eK :topleft split<Space>

" REF: :sbuffer {tab-complete-buffer-name}
    " split this window and open the buffer
    " this is quicker than `:drop`
    " because you can tab-complete buffer names
    " shortcut:
        " ;sb
        " enter a few characters from file name
        " hit tab for Vim to find matching buffers
nnoremap <leader>sb :sbuffer<Space>


" REF: Vimdiff{{{
    " diff windows have `scrollbind` and `cursorbind` set by default
    " Turn off synchronized scrolling:
    " set noscb nocrb
    " `scb` is shortcut for `scrollbind`
    " `noscb` is shortcut for `noscrollbind`
    " `crb` is shortcut for `cursorbind`
    " `nocrb` is shortcut for `nocursorbind`
    " :set scb?
    "   returns `scrollbind` or `noscrollbind`
    " :set crb?
    "   returns `cursorbind` or `nocursorbind`
    " :set scb
    "   turns on scrollbinding
    " :set noscb
    "   turns off scrollbinding
    " :set crb
    "   turns on cursorbinding
    " :set nocrb
    "   turns off cursorbinding
    "
    " Turn off scrollbinding and cursorbinding to align assembly files to the
    " same function body. :set noscb nocrb (;bo)
    " Align the files to the desired lines.
    " Turn cursorbinding back on.
    " :set crb (;bb)
    " Note scroll resumes old binding if Vim is confused about what's in the
    " file. Deleting white space column-wise confuses Vim.
"}}}

" Include this window in the diff
nnoremap <leader>dt :diffthis<CR>

" Turn off diff in this window
nnoremap <leader>do :diffoff<CR>
"
" Turn off scrollbind and cursorbind in this window
nnoremap <leader>bo :set noscb nocrb<CR>

" Toggle cursorbind in this window
nnoremap <leader>bb :call ToggleCursorbind()<CR>
function! ToggleCursorbind()
    let cursorbind = execute('set crb?')
    if matchstr(cursorbind, 'nocursorbind') == ''
        set nocrb
        echo "set nocrb (cursorbind turned off)"
    else
        set crb
        echo "set crb (cursorbind turned on)"
    endif
endfunction

" REF: run terminal in window
" ---Open A Terminal Window---

nnoremap <leader>T<Space> :terminal<CR>
    " opens terminal with default window opening behavior:
        " default: split above active window
    " $ exit
        " exits the terminal
        " closes the window

" ;TE - open a terminal without splitting the window {{{
nnoremap <leader>TE :terminal ++curwin<CR>
"}}}
nnoremap <leader>TJ :botright terminal<CR>
    " opens on bottom of screen, fills width

nnoremap <leader>TL :botright vertical terminal<CR>
    " opens on right of screen, fills height

nnoremap <leader>TK :topleft terminal<CR>
    " opens on top of screen, fills width

nnoremap <leader>TH :topleft vertical terminal<CR>
    " opens on left of screen, fills height

nnoremap <leader>Tk :aboveleft terminal<CR>
    " opens above active window, matches width
    " note this is the default behavior of :term

nnoremap <leader>Th :aboveleft vertical terminal<CR>
    " opens left of active window, matches height

nnoremap <leader>Tj :belowright terminal<CR>
    " opens below active window, matches width

nnoremap <leader>Tl :belowright vertical terminal<CR>
    " opens right of active window, matches height

" Somehow I fixed it so that `exit` not only exits the session but also
    " closes the window.
    " <C-w> is the main way to let Vim take control while in the Terminal.
    " <C-w><h,j,k,l,t,b,p,w>
    "   to navigate to another window
    "   p is previous
    "   w cycles the windows
    " <C-w>N (note that is a CAPITAL N)
    " alternative: <C-\><C-n>
    "   take Vim out of insert mode in the Terminal window
    "   (puts Vim in Normal mode)
    "   see :h terminal-job-index
    "   The Terminal gets line numbers and you can interact with it like any
    "   other Vim buffer.
    "   i
    "   Puts the Terminal back in `insert` mode.
    "   Terminal behaves like a Terminal, not like a Vim buffer.
    " <C-w>N is a nice complement to plugin `deol.nvim`. This plugin lets you
    " write to the Terminal as if it is another Vim buffer. The trick is it lets
    " you work in another window to affect the Terminal:
    " :DeolCd
    " `cd` at the Vim command line to set the Terminal pwd
    " . , or for other terminal commands, 

"function! OpenTerminalInVerticalSplit()
"    execute "term"
"    execute "wincmd L"
"    "<C-w>{motion} to leave the window.
"    "<C-w>: to access the Vim command line.
"endfunction
"nnoremap <S-F2> :call CloseTerminalInVerticalSplit()<CR>
    " No dice. <S-F2> prints Q2 to the terminal window.
    " What key besides Ctrl does anything? What other combos can I do besides
    " Ctrl-w?
"function! CloseTerminalInVerticalSplit()
"    " TODO: figure out how to invoke this from the terminal!
"    " TODO: generalize this to close from any window.
"    "
"    " Close the terminal window with :bw!
"    " This removes it completely. With :bd it is still hidden. With :q! it is
"    " still hidden.
"    "
"    " This must be called from the terminal window, otherwise it closes the
"    " window you are in.
"    execute "bw!"
"endfunction

set clipboard=
"set clipboard=unnamed
    " Paste from other applications without needing *.
    " Downside: this will clobber the '*' register.
    " If you find yourself saving '*' to another register, maybe set this back.
    " Default is nothing (clipboard= )
nnoremap <leader>pwd :redir @+<Bar>pwd<Bar>redir END<CR>$"+pj:execute "left"indent(line('.')-1)<CR>
"nnoremap <leader>pwd :redir @+<Bar>pwd<Bar>redir END<CR>$"+pj0ky^jP
    "like :pwd but clipboard pastes the output on the next line
    " Failed attempts at making the pasted text align with the line above using
    " gq and using insert mode paste with formatoptions adjusted:
    "nnoremap <leader>pwd :set fo+=l<CR>$:redir @+<Bar>pwd<Bar>redir END<CR>"+pgqj:set fo-=l<CR>
    "nnoremap <leader>pwd :set fo-=tcq<CR>$:redir @+<Bar>pwd<Bar>redir END<CR>"+pgqj:set fo^=tcq<CR>
    "nnoremap <leader>pwd :set fo+=l<CR>:redir @+<Bar>pwd<Bar>redir END<CR>o<C-r>+<Esc>:set fo-=l<CR>

" :h keycodes

" =====[ Math ]=====
nnoremap <leader>a :call InsertArithmeticResult()<CR>
function! InsertArithmeticResult()
    " Calculate expression on this line.
    " Expression starts with first non-whitespace and ends with `=`.
    " Example:{{{
    " (2 + 3 + 4 + 5)/4.0 = 3.5
    "
    " Check for an equals sign. If it does not exist, let user know.}}}
    " How it works:{{{
    " See: :help i_CTRL-R_=
    " (Vimscript CTRL-R is <c-r>)
    " This pastes register contents while in insert mode.
    " The `=` register evaluates expressions.
    " See :help expression
    " See :help usr_41.txt, then go to 41.3 Expressions, then down to
    " MATHEMATICS -- these are the basic operations and some logic.
    " See :help float-functions
    " Example:{{{
    " While typing a sentence in insert mode, like
    " 2 + 2 = 
    " I can then hit CTRL-R=
    " This puts me on the command line and I type `2+2` and hit Enter:
    " =2+2<CR>
    " Vim puts the result as the next string in my sentence:
    " ( old ) (NEW)
    " 2 + 2 = 4}}}
    " Music example:{{{
    " 440*pow(2,0/12.0)  = 440.0
    " 440*pow(2,1/12.0)  = 466.163762
    " 440*pow(2,2/12.0)  = 493.883301
    " 440*pow(2,3/12.0)  = 523.251131
    " 440*pow(2,4/12.0)  = 554.365262
    " 440*pow(2,6/12.0)  = 622.253967
    " 440*pow(2,7/12.0)  = 659.255114
    " 440*pow(2,8/12.0)  = 698.456463
    " 440*pow(2,9/12.0)  = 739.988845
    " 440*pow(2,10/12.0) = 783.990872
    " 440*pow(2,11/12.0) = 830.609395
    " 440*pow(2,12/12.0) = 880.0
    "}}}
    "}}}
    let has_equal_sign = matchstr(getline('.'),'=')
    if l:has_equal_sign != '='
        echomsg s:sad_kitty 'This line must contain "=" to do arithmetic.'
        " Highlight the line missing the "=" sign.
        normal ;hh
        return
    endif
    " Found the "=" sign. Clear the highlight.
    execute 'match'
    " Clear register `m`
    execute 'let @m = ""'
    " Yank from first non-whitespace up to the first equals sign.
    " Store result in register `m`
    execute 'normal! ^"myt='
    " TODO: check if anything was yanked!
    if @m == ""
        echomsg s:sad_kitty 'This line contains nothing before the "=".'
        normal ;hh
        return
    endif
    " \a is [A-Za-z]
    " following with \+ means find one or more matches
    let has_alpha_chars = matchstr(@m,'\a\+')
    " " ONLY ALLOW EXPRESSIONS WITH NUMBERS AND ARITHMETIC SYMBOLS. Why?
    " " I commented this out so I could do lines like `pow(2,3)=`
    " if l:has_alpha_chars != '' && l:has_alpha_chars != 'e'
    "     echomsg s:sad_kitty 'This line contains alphabetic characters before the "=".'
    "     normal ;hh
    "     return
    " endif
    " If you get here, register m contains a proper arithmetic expression.
    " Append the answer after the equals sign.
    execute "normal! f=a \<c-r>=\<c-r>\"\<cr>"
    " Place the cursor at the beginning of the answer.
    normal! B
    "<C-r>=<C-v>"<CR><Esc>B
    echomsg s:happy_kitty
endfunction
"

"=====[ ASCII art ]=====================================
" nnoremap <silent> <leader>- ^v$gr-
    " Replace all text on this line with '-'.
    " This is stupid because it replaces whitespace too.
    " So it does something obvious, something I would do naturally.
"{{{;-U -- Upperline text with '-'
nnoremap <silent> <leader>-U yyP^v$gr-j
    " ^ moves to the first non white-space character on the line
    " }}}
"{{{;-u -- Underline text with '-'.
nnoremap <silent> <leader>-u yyp^v$gr-k
    "}}}
"{{{;=U -- Upperline text with '='
nnoremap <silent> <leader>=U yyP^v$gr=j
    " }}}
"{{{;=u -- Underline text with '='.
nnoremap <silent> <leader>=u yyp^v$gr=k
    " }}}
"{{{;=u -- Underline text with '*'.
nnoremap <silent> <leader>*u yyp^v$gr*k
    " }}}
"{{{;^u -- Underline text with '^'.
nnoremap <silent> <leader>^u yyp^v$gr^k
    "}}}

nnoremap <silent> <leader>-s I---< <Esc>A >---<Esc>bb
    " Surround the text with =====[ text ]=====
nnoremap <silent> <leader>=s I=====[<Space><Esc>A<Space>]=====<Esc>F[w
    " Surround the text with =====[ text ]=====
nnoremap <silent> gcd :call InsertCfuncDocstring()<CR>
function! InsertCfuncDocstring()
    normal! o/* *************DOC***************
    normal! o*******************************/
    normal! k^
endfunction
" nnoremap <silent> gcs :call SurroundWithEqAndSqBrackThenComment()<CR>
nnoremap <silent> gcs :call SurroundWithCommentChar()<CR>
function SurroundWithCommentChar()
    if (&filetype == 'c') || (&filetype == 'cpp')
        execute 'normal! I// '
        execute 'normal! yyPv$r/yyjpkw'
    elseif (&filetype == 'python')
        execute 'normal! I# '
        execute 'normal! yyPv$r#yyjpkw'
    else
        echomsg s:sad_kitty 'Is not C C++ or Python'
    endif
endfunction
function! SurroundWithEqAndSqBrackThenComment()
    " Surround text like ;=s but also comment the line using surround.vim
    echomsg s:happy_kitty
    " execute 'normal! I=====[\<Space>\<Esc>A\<Space>]=====\<Esc>F[w'
    execute 'normal! I=====[ '
    execute 'normal! A ]====='
    execute 'normal! F[w'
    execute 'normal gcc'
    " gcc is from the surround.vim plugin
endfunction
nnoremap <silent> <leader>-b I<Bar><Space><Esc>A<Space><Bar><Esc>yyP^v$gr-jyyp^v$gr-k
    " [-B]ox the text.
    " Surround the text with bars: | blah text |.
    " Place a line of '-' above and below the barred text.
    " Example:
    "   --------------
    "   | Boxed Text |
    "   --------------
"=====[ Map my favorite window navigation commands]=====
" Map Alt-W to Ctrl-W to run windows commands.
"execute "set <M-w>=\033w"
"nnoremap <M-w> <C-w>
    " I am taking this out in favor of doing <leader>w
    " And using <M-w> for fitting window to selection

"---Remap <C-w> commands to <leader>w---
nnoremap <leader>w <C-w>
" See Window commands in :h CTRL-W
";wt <C-w>t
    " Move to top left window (usually NERDTree).
    " Explicit mapping to wt no longer necessary.
";wb <C-w>b
    " Move to bottom right window (usually Terminal buffer with test output).
    " Explicit mapping to wt no longer necessary.
";wp <C-w>p
    " Move to previous window.
";ww <C-w>w
    " Toggle through all windows.
"N;ww N<C-w>w
    " Go to window N
    " N is the number returned by :echo winnr()
" ;wo
    " Close all but current window
" ;wT
    " Move current window to a new tab page
" ;wc
    " Close current window
" ;wd
    " split window and jump to definition under the cursor
" ;wa - Auto-adjust window height to number of rows of text.{{{
nnoremap <leader>wa :call BufAutoHeight()<CR>
function! BufAutoHeight()
    " Calculate window height in rows
    let height = line("$")+1
    " Do nothing if there are too many rows
    if height > 30
        echomsg s:sad_kitty 'Too many rows to auto-adjust window height.'
        return
    endif
    " Auto-adjust the window height to the number of rows of text.
    execute height.'wincmd _'
    " Place the cursor line at the top of the window.
    execute "normal! gg"
    echomsg s:happy_kitty "Fitted window height to number of rows."
endfunction
"}}}

"=====[ Make Visual modes work better ]==================
" 2019-07-08:
    " use `v` for block selection
    " use `<C-v>` for selecting by word and spanning multiple lines
nnoremap v <C-v>
nnoremap <C-v> v
vnoremap v <C-v>
vnoremap <C-v> v
    " https://github.com/thoughtstream/Damian-Conway-s-Vim-Setup/blob/master/.vimrc
    " Damian Conway
    " Swap key mappings for "Visual" and "Visual Block".
    " set virtualedit=block
    " Allow visual block selection even where there is no text.

" ---Remove ^M from the file in the active window---
nnoremap <leader>eol :call RemoveEolCaretM()<CR>
function! RemoveEolCaretM()
    " Keywords to help you find this function in the future
    "   end-of-line
    "   carriage return
    "   ctrl-M control M ^M
    " Do not run this on the .vimrc or you'll mess up this function!
    " :%s/^M//g
    " Which is entered by typing this:
    " :%s/Ctrl-V<CR>//g
        " Well, with my remap of Ctrl-V, it's this:
        " :%s/Ctrl-B<CR>//g
    "echo ">^.^< remove ^M"
    if (expand("%:t") == ".vimrc")
        echo "I refuse to call RemoveEolCaretM() in the .vimrc."
    else
        %s///g
    endif
endfunction

" ---Clean expanded #includes from preprocessed C files---
nnoremap <leader>di :call CleanExpandedIncludes()<CR>
function! CleanExpandedIncludes()
    " Find the first and last line containing /usr/include/
    " Delete all lines in this range.
    " Expect this is all the included system headers.
    normal! gg
    let system_header_pattern = "\/usr\/include\/"
    " Find first line with system_header_pattern
    " call search("\/usr\/include\/","c")
    call search(system_header_pattern,"c")
    normal! ma
    " Find last line with system_header_pattern
    while search(system_header_pattern,"W") > 0
        " Do nothing...
    endwhile
    normal! mb
    " Go back to first line
    normal! 'a
    " Erase from there down to last line
    normal! d'b
    " Save the file
    execute "w"
endfunction
function! CleanExpandedAvrIncludes()
    " Note the  shown below was entered in insert mode with the keystrokes
    " <C-v><C-m>
    " See :h i_CTRL-V
    let @d='ggd/\%1c#\_s1.*main\.c*.*dd'
    normal @d
    let @d='/\%1c#\_s.*avr8-gnu-toolchain.*d/\%1c#\_s.*main\.c.*'
    let num_includes = 5
    execute "normal" num_includes . "@d"
    echo ">^.^<  Deleted expanded #includes from preprocessor output."
endfunction
" nnoremap <leader>di :call CleanExpandedAvrIncludes()<CR>
function! CleanExpandedAvrIncludes()
    " Note the  shown below was entered in insert mode with the keystrokes
    " ~<C-b><C-m>    -   This is because I remapped <C-v> to <C-b>.~
    " <C-v><C-m>
    " See :h i_CTRL-V
    let @d='ggd/\%1c#\_s1.*main\.c*.*dd'
    normal @d
    let @d='/\%1c#\_s.*avr8-gnu-toolchain.*d/\%1c#\_s.*main\.c.*'
    let num_includes = 5
    execute "normal" num_includes . "@d"
    echo ">^.^<  Deleted expanded #includes from preprocessor output."
endfunction
    " Clean the expanded #include files from the avr-gcc preprocessor output.
    " Look at the preprocessor output (-E), including comments (-C):
    " ... -E -C > preproc-E-C.c
    " This includes entire avr8-gnu-toolchain include files.
    " Here are the steps to erase these from the resulting output:
    " Deletion 1: (eliminates the first four lines)
        " gg   -   Start at the beginning of the file.
        " d    -   Start a delete command.
        " Then use a search to make a motion:
        " /\%1c#\_s1.*\main\.c.*
        " dd   -   Delete the final line.
    " Deletion 2: (eliminate every expanded avr #include file)
        " Repeat Deletion 2 for every #include avr file:
        " Find where the #include avr stuff starts:
        " /\%1c#\_s.*avr8-gnu-toolchain.*
        " d    -   Start a delete command.
        " And search again to make a motion to the next mention of main.c:
        " /\%1c#\_s.*\main\.c.*
" Show line numbers.
set number
set relativenumber
" loaded_nerd_tree
let NERDTreeShowLineNumbers=1
" let NERDTreeMinimalUI=0 " 1: Hide the Press ? for help and bookmarks.
let NERDTreeShowBookmarks=1 "default to bookmarks shown... 'B' to toggle
let NERDTreeCascadeSingleChildDir=0
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeChDirMode = 1

nnoremap <leader>ncd :call ChangeDirectoryAndTreeToCurrentFile()<CR>
function! ChangeDirectoryAndTreeToCurrentFile()
    execute "cd %:h"
    NERDTreeFind
    execute "wincmd p"
        " Return to the window where ;ncd was invoked.
endfunction

";nf -- NERDTree directory of current buffer {{{
nnoremap <leader>nf :NERDTreeFind<CR>
    " (n)ERDTree(f)ind
    " Explore the directory of the current buffer.
    "}}}
";nt -- NERDTree toggle {{{
nnoremap <silent> <leader>nt :NERDTreeToggle<CR>
    " (n)ERDTree(t)oggle
    " Toggle explorer open/closed, putting cursor back where it was.
    " This saves having to navigate the windows, close the window, and navigate
    " back to wherever you left off.
    " Note that
    "   :NERDTreeToggle
    "   and
    "   :NERDTree
    " do the same thing when you first start Vim. But once you call
    "   :NERDTreeFind
    " :NERDTreeToggle toggles the view of the current buffer directory, not the
    " Vim current directory. This is exactly the behavior you would expect/want,
    " it's only worth noting because when you first open Vim, you can just
    " straightaway do ;nt instead ;ne. And of course, if you ;ne again, then ;nt
    " goes back to toggling the view of the current Vim directory.
"}}}
";nv -- Shortcut is NOT USED {{{
" nnoremap <leader>nv :NERDTree<CR>
    " I retired this because I realized ;ne made more sense.
        " Instead of one command to only open the current directory, now you
        " have the option of hitting Enter for the current directory (default)
        " or pressing Tab to see what directories you can go to, or just
        " entering the directory at the command line.
    "
    " Old notes:
    " (n)ERDTree for the (v)im current directory
    " Explore the current vim directory.
    " I thought about this mapping:
    " nnoremap <leader>n<Space> :NERDTree<CR>
    " But nv makes more sense as the (n)ERDTree for the (v)im current directory.
"}}}
";ne -- NERDTree a path. <Enter> to NERDTree the pwd. {{{
nnoremap <leader>ne :NERDTree<Space>
    " Start command to browse a path.
    " Open the current directory by pressing Enter.
    " Or enter the path to browse. Or hit tab.
"}}}
";nb -- NERDTree a bookmark {{{
nnoremap <leader>nb :NERDTreeFromBookmark<Space>
    " Start command to open from bookmark.
    " This command combines with:
    " let NERDTreeChDirMode = 1
    " to have the affect that the Vim pwd is changed to the project directory
    " when the project is opened by bookmark with ;nb,
    " but does not alter the Vim pwd when the project is opened by bookmark with
    " 'o'. This is the perfect behavior to use ;nb to open projects.
"}}}
nmap <leader>nr :call nerdtree_#RefreshFolder('build')<CR>
" nmap <leader>nr :call nerdtree_#RefreshFolder('build')<CR>
" nmap <leader>nr :call RefreshNERDTreeFolder_build()<CR>
function! RefreshNERDTreeFolder_buildDEV()
    echo "DEV >^.^<"
    /build\/
endfunction
function! RefreshNERDTreeFolder_build()
    " Refresh only the build folder in the NERDTreeWindow.
    " TODO: Refactor with RefreshNERDTreeWindow to remove duplicate code.
    let not_invoked_from_nerdtree_window =
        \!(
            \ (&filetype == 'nerdtree')
            \ &&
            \ (&buftype == 'nofile')
        \ )
    execute "NERDTreeFocus"
    "=====[ RefreshNERDTreeFolder_build starts here ]=====
    "First go to the root. This avoids the case that 'build' appears in the
    "Bookmarks.
    execute "normal P"
    " find the build/ folder
    " /build\/ " old way
    call search('build') " new way
    execute "normal O"
    execute "normal r"
        " Note this must be 'normal' and not 'normal!' for 'r' to behave as
        " 'NERDTree-r' because 'r' already has a Vim mapping.
    "=====[ RefreshNERDTreeFolder_build ends here ]=====
    if not_invoked_from_nerdtree_window
        execute "wincmd p"
        " Return to the window where ;nr was invoked.
    endif
    execute "noh"
        " Remove highlighting from the last search
endfunction

nmap <leader>nR :call RefreshNERDTreeWindow()<CR>
function! RefreshNERDTreeWindow()
    " Refresh the list of files in the NERDTree window.
        " Formerly this was just a keymapping:
        "   :NERDTreeFocus<CR>R<C-w>p
        " But then I wanted to call this from other functions,
        " so I made it its own function.
    let not_invoked_from_nerdtree_window =
        \!(
            \ (&filetype == 'nerdtree')
            \ &&
            \ (&buftype == 'nofile')
        \ )
    execute "NERDTreeFocus"
    execute "normal R"
        " Note this must be 'normal' and not 'normal!' for 'R' to behave as
        " 'NERDTree-R' because 'R' already has a Vim mapping.
    if not_invoked_from_nerdtree_window
        execute "wincmd p"
        " Return to the window where ;nr was invoked.
    endif
endfunction

" New style
function! ThisIsANerdtreeWindow()
    return (&filetype == 'nerdtree') && (&buftype == 'nofile')
endfunction
nnoremap <leader>n<Space> :call nerdtree_#RefreshActiveFolder()<CR>

    " Refresh the view in the NERDTree window (like after make or make clean).
    " nmap is required for Vim to interpret 'R' as NERDTree-R rather than R.
    " Hence the error: 'not modifiable' if mapped with nnoremap.
    " See :h recursive_mapping
    " This is almost good enough: nmap <leader>nr :NERDTreeFocus<CR>R<C-w>p
    "   For now, I can remember to just hit 'R' in the NERDTree window.
    "   Issue:
    "   If you call this from the NERDTree window, you are bounced back to a
    "   different window, like the quickfix preview window.
" NERDTree is my default file browser, but I can still access netrw.
" Make netrw useable.

let g:netrw_liststyle = 3       " Use tree view.
let g:netrw_banner = 0          " Hide the banner.
let g:netrw_browse_split = 4    " Open in previous window.
let g:netrw_winsize = 30        " Set width to 35% of page.
let g:netrw_altv = 1            " Keep explorer on left when file opened with 'v' 

" Use netrw to browse files:
" See :h netrw-browse-maps for a full list of netrw browsing key mappings.
" Here are the ones I thought most useful.
" :Lex
    " Open a vertical split window to browse, like NERDTree
    " Like NERDTree, this uses the `pwd`.
" :Sex
    " Open a horizontal split window to browse directory of active file.
    " Windows opens directly above the active file's window.
    " Unlike NERDTree, this uses the path of the file the cursors is on.
" gh
    " in a netrw browser, this toggles hidden files on/off
" <CR>
    " in a netrw browser with cursor on folder, toggle a folder open/closed
" gf
    " in a netrw browser, with cursor on file, open file in the previously
    " active window
" p
    " in a netrw browser, with cursor on a folder or file, open in a preview
    " window. This is a special Vim window. Close a preview window with ;wz.
" o
    " in a netrw browser, with cursor on a folder or file, open in a new split
    " above the netrw browser
" I
    " in a netrw browser, toggle the banner on/off
    " latest setting is remembered if window is closed


" let loadTabulous = 1
" Uncoment the above line to disable Tabulous.
" But Tabulous is fabulous, so I'm not sure why I would ever do that.
let tabulousCloseStr = '>^.^<'
" let tabulousLabelNameOptions = ':t:r'
" Default label name is buffer filename without extension.
"
" REF: tab labels
    " ;trw<Space> - assign a custom individual tab name for each window
    " ;tr<Space> - assign a custom tab name for active window only
    " ;trwn - assign one tab name for all windows using filename of active
    " ;trn - assign tab name for active window using filename of active
    " ;trwh - assign one tab name for all windows using folder of active
    " ;trh - assign tab name for active window using folder of active
" ---Tab label for all windows in active tab---
" Tab labels are saved with the session. Use with ;ms<Space> and ;ls.
" Rename tab for *every* buffer in the active window to whatever you want:
nnoremap <leader>trw<Space> :windo call g:tabulous#renameTab()<CR>
    " Rename the tab at the command line (for the active buffer).
" Rename tab for *every* buffer in the active window to the folder name:
nnoremap <leader>trwh :windo TabulousRename<Space><C-r>=expand("%:p:h:t")<CR><CR>
    " `windo` applies what follows to every window in the active tab.
" Rename tab for *every* buffer in the active window to the filename of the
" active buffer:
nnoremap <leader>trwn :windo TabulousRename<Space><C-r>=expand("%:p:t:r")<CR><CR>
    " :TabulousRename <C-r>=expand("%:p:t")
    " Rename the tab to the file name.
    " Restores default tabulous naming for the active buffer.
" ---Tab label for active buffer only---
" Rename tab to whatever you want *for this buffer*:
nnoremap <leader>tr<Space> :call g:tabulous#renameTab()<CR>
    " Rename the tab at the command line (for the active buffer).
" Rename tab to the folder *for this buffer*:
nnoremap <leader>trh :TabulousRename<Space><C-r>=expand("%:p:h:t")<CR><CR>
    " :TabulousRename <C-r>=expand("%:p:h:t")
    " Default Tabulous is to name the tab as the file of the active buffer.
    " Rename the tab to the folder of the active buffer (for the active buffer).
    " This is for quickly naming tabs of a development project.
    " Open the project's Makefile and hit ';trh'.
" Rename tab back to filename default *for this buffer*:
nnoremap <leader>trn :TabulousRename<Space><C-r>=expand("%:p:t")<CR><CR>
    " :TabulousRename <C-r>=expand("%:p:t")
    " Rename the tab to the file name.
    " Restores default tabulous naming for the active buffer.

" D deletes to end of line. Make Y also yank to end of line.
nnoremap Y y$

" Search for the visual block
" Old:
    " vnoremap s y/<C-R>"<CR>zv
" New:
    " `s<space>` to match: /{visual-block}
        " if searching for `end`, then `ends` and 'endfunction' are also matches
    " `sc<space>` for count occurrences instead of search
    " `sp` for a precise match: /\<{visual-block}\>
        " if searching for `end`, then `ends` is *not* a precise match
    " `scp` for count precise match
    " {visual-block} is yanked into register s to not clobber default register
    " gv to re-select a visual block

" REF: search-pattern{{{
    " :h search-pattern :h pattern :h regex <-- ALL THE SAME
    " [xyz] - Match to x, y, or z
    " [^xyz] - Do not match to x or y or z - #exclude
    " Examples
    " 1. Find any "call" not preceded by ":"
    "   [^:]call
    " 2. Find occurrences of HDL but exclude |HDL
    "   :vimgrep "[^|]HDL" %
    " 3. Find any identifier character (:set isident?) followed
    "    by an open parentheses
    "    vimgrep "\i(" %
"}}}
" REF: regex atoms{{{
    " Examples
    " \@! - Do not match to the preceding atom
    " 1. Find any "win" preceded by space or tab (" win" or "	win")
    "    not followed by "dow", "nr", "line", "_findbuf", or "_gotoid"
        " /\swin\(dow\)\@!\(nr\)\@!\(line\)\@!\(_findbuf\)\@!\(_gotoid\)\@!
    " 2. Find any "diff" not followed by "erent"
        " /diff\(erent\)\@!
        " finds diff but not different
    " 3. Find any "erent" not preceded by "diff"
        " /\(diff\)\@<!erent
        " finds erent but not different
"}}}
" REF: search for string in visual block{{{

" ---Search For Any String Matching The Visual Block---
vnoremap s<space> "sy/<C-R>"<CR>zv

" ---Search For Precise Match Of The Visual Block---
vnoremap sp "sy/\<<C-R>"\><CR>zv

" ---Count Occurrences Matching The Visual Block---
vnoremap sc<Space> "sy:%s/<C-R>"//nc<CR>

" ---Count Occurrences Of Precise Matches Of The Visual Block---
vnoremap scp "sy:%s/\<<C-R>"\>//nc<CR>

"vnoremap S y?<C-R>"<CR>zv
    "visual mode `S` conflicts with vim-surround
"}}}
set showmatch
    " Show matching opening brace when closing braces.
    " TODO(sustainablelab@gmail.com): make the 'show' a little faster.

" Use >--- for tab and unicode middle dot for space.
exec "set listchars=tab:>-,trail:\uB7,space:\uB7"
set list " Turn on whitespace display but setup toggle.

" For all the keycodes, like <Esc>, see :h key-codes

" No more wrist pain!"
    " Make the Alt-key functional for mappings."
    " This was discovered at the mintty terminal:
    "   $ sed -n l
    "   {type the key combo, such as Alt-w and hit Enter}
    "   Each line ends with $.
    "   Ctrl-C to quit.
    "   The resulting mappings displayed with :nmap are shown as random unicode
    "   codepoints for the {lhs} and blank for the {rhs}.
" 2019-10-16: I use <C-e> and <C-y>. I stopped using <M-e> and <M-f>.
" Save <M-e> and <M-f> for something else.
" Map Alt-E to Ctrl-E to scroll up.
" execute "set <M-e>=\033e"
" nnoremap <M-e> <C-y>
" Map Alt-F to Ctrl-Y to scroll down.
" execute "set <M-f>=\033f"
" nnoremap <M-f> <C-e>

" Map Alt-R to Ctrl-R for redo.
" In insert mode, Ctrl-v, then Alt-r to get the ^[
" nnoremap r <C-r>

" On my Windows 8 Vim installation:
" \033r comes from `sed -n l`.
" \033r does not always work on my Windows 10 Vim.
" It works when Vim first starts... then at some point it stops.
execute "set <M-r>=\033r"
nnoremap <M-r> <C-r>
" Using <A-r> has the exact same effect.
" execute "set <A-r>=\033r"
" nnoremap <A-r> <C-r>

" Alt unicode is weird:
    " M-Up is \033[1;3A
    " M-Down is \033[1;3B
    " How come I didn't need to set the Alt-key unicode for M-Up and M-Down?
" Map Alt-Up to align with the text above.
" This is that term cap thing... 3 means Alt
" execute "set <M-Up>=\033[1;3A"
nnoremap <M-Up> :execute "left ".expand(indent(line('.')-1))<CR>
":call LeftAlignWithAbove()<CR>
vnoremap <M-Up> :call LeftAlignWithAbove()<CR>
function! LeftAlignWithAbove()
    execute "left ".expand(indent(line("'<")-1))
    " Notes{{{
    "Two issues to consider:{{{
    " 1. The nnoremap one-liner doesn't work for visual mode.{{{
    " This has to be a function call to convert the output of
    " indent() to a string.  If this is just a mapping, the range
    " is passed and I get the error: E481: No range allowed.
    " Similarly, doing the highlight and typing the execute line
    " throws the same error.
    "}}}
    " 2. If '.' is used instead of "'<" as the valule for line(), then{{{
    " the function gets the value of the line 1 above the current
    " line, as it steps through and left-aligns each line in the
    " selection! What we want for ---VISUAL LINE--- is to just
    " use the line at the top of the selection. When we have a
    " ---VISUAL LINE--- selection:
    " "'<" uses the line number at the top of the selection
    " "'>" uses the line number at the bottom of the selection
    "}}}
    "}}}
    " Also see this:
    " https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript/6271254#6271254
    "}}}
endfunction
" Map Alt-Down to align with the text below.
" execute "set <M-Down>=\033[1;3B"
nnoremap <M-Down> :execute "left ".expand(indent(line('.')+1))<CR>
":call LeftAlignWithBelow()<CR>
vnoremap <M-Down> :call LeftAlignWithBelow()<CR>
function! LeftAlignWithBelow()
    execute "left ".expand(indent(line("'>")+1))
endfunction

" Why doesn't this Alt-key mapping work? Ah, `M-w` maps to a division symbol!
" How do I change that behavior?
" vnoremap <M-w> :call FitWindowToSelection()<CR>:echomsg "-O.O- Window fit to visual-selection"<CR>
" Search for '#' as the first character on a line.
" nnoremap <leader>3  /\%1c#<CR>:noh<CR>
" nnoremap <leader>#  ?\%1c#<CR>:noh<CR>

" Echo the linenumber before and after a change in folds.
" nnoremap <leader>zr :call EchoFold()<CR>
" nnoremap <leader>zr :call UnfoldThenRestoreScroll()<CR>
"nnoremap <leader>zr :call UnfoldThenRestoreScroll()<CR>
function! UnfoldThenRestoreScroll()
    let window_line_number = winline()
    let text_line_number = line(".")
    echo "window:" window_line_number . ", text:" text_line_number
    " Change folds by one level.
    normal zr
    " Move the current line to the top of the window.
    execute "normal" text_line_number . "zt"
    " Move the window down to restore the original line number.
    execute "normal" window_line_number-1 . "\<C-y>"
endfunction
"nnoremap <leader>zm :call FoldThenRestoreScroll()<CR>
function! FoldThenRestoreScroll()
    let window_line_number = winline()
    let text_line_number = line(".")
    echo "window:" window_line_number . ", text:" text_line_number
    " Change folds by one level.
    normal zm
    " Move the current line to the top of the window.
    execute "normal" text_line_number . "zt"
    " Move the window down to restore the original line number.
    execute "normal" window_line_number-1 . "\<C-y>"
endfunction

function! EchoFold()
    let old_scroll = winline()
    :normal zr
    let delta_scroll = winline() - old_scroll
    echo delta_scroll
endfunction

" TODO: fix - and _ to deal with folds (right now they wreak havoc!)

" Test highlighting status line
"nnoremap <leader>5 :call HiReadonlyStatusLine()<CR>
" This works. Now call this when you enter a buffer.
function! HiReadonlyStatusLine()
    "echo ">^.^<"
    if &readonly
        hi! link StatusLine WarningMsg
    else
        hi! link StatusLine StatusLine
    endif
    redrawstatus
endfunction
" Toggle visibility whitespace and comments.
    " Query color setting of a group with ":highlight {groupname}".
    " :hi Comment
    " :hi Ignore
nnoremap <leader>hc :call CommentToggle()<CR>
function! CommentToggle()
    let HiInfo = execute('hi Comment')
    if matchstr(HiInfo,'Ignore') == ''
        hi! link Comment Ignore
        echo "Comments are barely visible."
    else
        hi! link Comment Comment
        echo "Comments are visible again."
    endif
endfunction
nnoremap <leader>hw :call WhitespaceToggle()<CR>
function! WhitespaceToggle()
    let HiInfo = execute('hi SpecialKey')
    if matchstr(HiInfo,'Ignore') == ''
        hi! link SpecialKey Ignore
        echo "Whitespace is barely visible."
    else
        hi! link SpecialKey SpecialKey
        echo "Whitespace is visible again."
    endif
endfunction
" Toggle visual wrapping (echoes hardwrap formatting with gq).
nnoremap <leader>gq :call SoftWrapToggle()<CR>
function! SoftWrapToggle()
    execute('set wrap!')
    let wrap_state = execute('set wrap?')
    if matchstr(wrap_state,"nowrap") == "nowrap"
        echo "<'.'>  Soft wrapping --off--"
    else
        echo ">^.^<  Soft wrapping  --on--"
    endif
endfunction

" Try out the next two to see what they do.
" zv is to unfold text at the cursor as it traverses folds.
nnoremap - zvddp
nnoremap _ zvddkP
" The next two do the same but for a visual block of complete lines (V).
vnoremap - zvdpzvV']
vnoremap _ zvdkPzvV']

" <C-O> goes to normal mode for one normal mode command

"---Remap <Esc>---{{{
    " <Esc> to escape sucks. i_<C-c> to escape is OK.
    " Vim recommends i_<C-[> to escape insert mode.
    " But jk to exit insert mode and command-line mode is awesome.
    " Use i_<C-b> to enter the text 'jk' without exiting insert mode.
    " This really is i_<C-b>, not i_<C-v>
    " Or toggle the jk mapping on/off with ;jk
"}}}
" There are two modes that use the jk mapping: Insert and Command-line
" inoremap jk{{{
" inoremap jk <Esc>
    " Map to <Esc>:
    "   jk to exit insert mode
    "   Vim default: <C-c> or <C-[>
    "   jk to exit command line mode
    "   Vim default: <C-c> or <C-[><C-[>
    "   jk to exit after a visual-block column-edit.
    "   Vim default: <C-[><C-[>
    "   Note that <C-c> escapes visual-block edit without changing all lines.
"}}}
" cnoremap jk{{{
" cnoremap jk <C-c>
    " Map to <C-c> to escape command-line mode without executing.
"}}}
    "
" See `:h map-overview`{{{
" Use `:map! :noremap! :unmap!` to affect MODES Insert *and* Command-line
" Example:
" noremap! jk <Esc>
" But then it's the <Esc> mapping for both. For whatever reason, I wanted <C-C>.
"}}}
" jk - Esc{{{
" Turn this mapping on by default
" Check with `:imap` and `:cmap`
inoremap jk <Esc>
cnoremap jk <C-c>
"}}}
" ;jk - Toggle jk i_<Esc> and c_<C-c> mappings on/off{{{
nnoremap <leader>jk :call ToggleMappingOnOff_jk()<CR>
function! ToggleMappingOnOff_jk()
    if maparg("jk", "i") == "<Esc>"
        let l:msg="Use <C-[> to Esc"
    else
        let l:msg=""
    endif
    call ToggleMappingOnOff("jk", "\<Esc\>", "i", l:msg)
    call ToggleMappingOnOff("jk", "\<C-C\>", "c")
endfunction
"}}}
" ToggleMappingOnOff{{{
function! ToggleMappingOnOff(lhs, rhs, mode, msg="")
    " echomsg a:lhs a:rhs a:mode
    if maparg(a:lhs, a:mode) == a:rhs
        execute a:mode."unmap" a:lhs
        echomsg s:sad_kitty " '".a:lhs."' UNmapped to '".a:mode."'-mode" a:rhs."." a:msg
    else
        execute a:mode."noremap" a:lhs a:rhs
        echomsg s:happy_kitty " '".a:lhs."' mapped to '".a:mode."'-mode" a:rhs."." a:msg
    endif
endfunction
"}}}

"---Remap register paste <C-r>---
"In hindsight, this was a bad idea. I am getting confused between my muscle
"memory and the key combinations I need to know for Vimscript `normal!`.
" Stopped using this on 2019-09-25
" inoremap <C-b> <C-v>
" cnoremap <C-b> <C-v>
" inoremap <C-v> <C-r>
" cnoremap <C-v> <C-r>
    " Make Ctrl-V mimic Ctrl-R in insert mode and command mode.
    " Default Ctrl-V is to insert non-digits literally or to insert up to three
    " decimal digits to write a single byte. The non-digits and the three digits
    " that make up the byte are not considered for mapping. So this is a way to
    " insert jk without having to hit Esc. This sounds useful, so I remapped it
    " to Ctrl-B.

" Grow/shrink vertically split windows:
" Windows 8 laptop:
nnoremap <C-Right> :wincmd><CR>
nnoremap <C-Left> :wincmd<<CR>
" Windows 10:
" nnoremap [1;5C :wincmd><CR>
" nnoremap [1;5D :wincmd<<CR>
" Grow/shrink horizontally split windows:
" Windows 8 laptop:
nnoremap <C-Up> :wincmd+<CR>
nnoremap <C-Down> :wincmd-<CR>
" Windows 10:
" nnoremap [1;5A :wincmd+<CR>
" nnoremap [1;5B :wincmd-<CR>
" Search for unfinished tasks [ ] and position cursor for 'rx' to mark done:
" [x]

" ---Find next task and position the cursor---
nnoremap <leader>tA /\[x\]/e-1<CR>zv
nnoremap <leader>ta /\[\ \]/e-1<CR>zv
" ;ta
    " Find next task
    " n to go to next task
    " N to go to previous task
    " rx to mark task done
    " ;H to highlight tasks again without doing ;ta

" nnoremap <leader>T h?\[\ \]?e-1<CR>zv
    " stopped using this
    " intead, ;T is for opening a terminal

" ;sv - Source the vimrc{{{
nnoremap <leader>sv :source $MYVIMRC<CR>
"}}}
" ;so - Source the current Vim file{{{
nnoremap <leader>so :call SourceCurrentFile()<CR>
" SourceCurrentFile{{{
" Sources a Vim or Python file.
" Do not source Python with ;so{{{
" This uses the default Cygwin Python installation, Python 3.6.
" Do not use ;so to source Python files.
" Use ;sw instead ([s]ource with [w]indows)
" But there are reasons to source from Cygwin Python sometimes.
" So then make sure you add a shebang with i_ppp
"}}}
function! SourceCurrentFile()
    if &filetype == 'vim'
        execute "source %"
    elseif &filetype == 'tcl'
        execute "!tclsh %"
    elseif &filetype == 'python'
        " Execution prefix depends on whether the file is in the pwd!
        if expand("%:h") == '.' " file IS in the pwd, % is just the file name
            execute "!./%"
        else " file is NOT in the pwd, % has the full path
            execute "!%"
        endif
    elseif &filetype == 'sh' " bash script
        execute "!%"
    endif
endfunction
"}}}
"}}}
" Source the highlight listing.
nnoremap <leader>sh :source $VIMRUNTIME/syntax/hitest.vim<CR>
" <BS> - edit alternate buffer (toggle between two buffers), see :h CTRL-^{{{
" Used to be just this: nnoremap <BS> :buffer #<CR>
" But I added a check for a presentation file.
nnoremap <BS> :call SpecialBufferToggle()<CR>
function! SpecialBufferToggle()
    if bufname("%") == "slides/slide2.abc"
        " Restore the original state of the slide before switching buffer.
        edit!
    endif
    buffer #
endfunction
"}}}
" ---File Quick Edits--- (Example: ;evt - opens .vimrc in a new tab)
    " zv
        " If the last cursor location happens to be in a fold, unfold at the
        " cursor.
" ;ev<Space> ;evt ;evs ;evv - Edit ~/.vimrc{{{
" <Space> - in this window
" t - new tab
" s - horizontal split
" v - vertical split
" nnoremap <leader>ev<Space> :edit $MYVIMRC<CR>zv:loadview
nnoremap <leader>ev<Space> :edit $MYVIMRC<CR>
nnoremap <leader>evt :tabedit $MYVIMRC<CR>zv
nnoremap <leader>evs :split $MYVIMRC<CR>zv
nnoremap <leader>evv :vertical split $MYVIMRC<CR>zv
"}}}
" ;egs - View `glib.h` in horizontal split{{{
nnoremap <leader>egs :sview /usr/include/glib-2.0/glib.h<CR>
"}}}

" ---Display Directory---
" See :h :file for displaying file/path/buffer.

" ---Change Directory To Active Window---
" OLD: nnoremap <leader>cd :cd %:h<CR>:pwd<CR>
nnoremap <leader>cd :call ChangePwdToWindowAndStoreOldPwd()<CR>
function! ChangePwdToWindowAndStoreOldPwd()
    " Store pwd in register z
    " Change pwd to directory of file in active window
    let @z = getcwd()
    execute "cd %:h"
    redraw | echomsg s:happy_kitty ";CD to restore previous pwd."
endfunction
nnoremap <leader>CD :call RestoreOldPwd()<CR>
function! RestoreOldPwd()
    " Store pwd in register z
    " Restore to pwd stored when user pressed ;cd
    " Now ;CD toggles between the two pwds
    let old_pwd = getcwd()
    execute "cd " . @z
    let @z = old_pwd
    redraw
    echomsg s:happy_kitty "Previous pwd restored. ;CD to toggle pwd."
endfunction
" Quickly navigate up one folder.
nnoremap <leader>z :call CdToParent()<CR>
function! CdToParent()
    execute "cd .."
    redraw | echomsg s:happy_kitty "In parent directory."
endfunction

" REF: path to clipboard
" ;%p<CR>   - absolute file path
" ;%ph      - absolute folder path
" ;%<CR>    - relative file path
" ;%r       - relative file path without extension
" ;%h       - relative folder path
" ;%t<CR>   - filename with extension
" ;%tr      - filename without extension
" nnoremap <leader>pp :let @" = expand("%:p")<CR>:echomsg 'let @"='.@"<CR>
nnoremap <leader>%p :let @" = expand("%:p")<CR>:echomsg 'let @"='.@"<CR>
    " POSIX absolute path to Vim default clipboard
" nnoremap <leader>ph :let @" = expand("%:p:h")<CR>:echomsg 'let @"='.@"<CR>
nnoremap <leader>%ph :let @" = expand("%:p:h")<CR>:echomsg 'let @"='.@"<CR>
    " POSIX absolute head to Vim default clipboard
" nnoremap <leader>pff :let @" = expand("%")<CR>:echomsg 'let @"='.@"<CR>
nnoremap <leader>% :let @" = expand("%")<CR>:echomsg 'let @"='.@"<CR>
    " POSIX relative path to Vim default clipboard
    "   example: mBrd/src/mBrd.c
" nnoremap <leader>pfh :let @" = expand("%:h")<CR>:echomsg 'let @"='.@"<CR>
nnoremap <leader>%h :let @" = expand("%:h")<CR>:echomsg 'let @"='.@"<CR>
    " POSIX relative path to Vim default clipboard
    "   example: mBrd/src/mBrd.c
" nnoremap <leader>pfr :let @" = expand("%:r")<CR>:echomsg 'let @"='.@"<CR>
nnoremap <leader>%r :let @" = expand("%:r")<CR>:echomsg 'let @"='.@"<CR>
    " Same as `pf` but remove the file extension
    "   example: mBrd/src/mBrd
" nnoremap <leader>fnf :let @" = expand("%:t")<CR>:echomsg 'let @"='.@"<CR>
nnoremap <leader>%t :let @" = expand("%:t")<CR>:echomsg 'let @"='.@"<CR>
    " Tail (just the filename with extension) to Vim default clipboard.
" nnoremap <leader>fnr :let @" = expand("%:t:r")<CR>:echomsg 'let @"='.@"<CR>
nnoremap <leader>%tr :let @" = expand("%:t:r")<CR>:echomsg 'let @"='.@"<CR>
    " Tail root (just the filename without extension) to Vim default clipboard.

" ;exh -- EXplore Here{{{
" open the directory in OS File Explorer for file in active Vim window.
if CheckOs() == 'linux'
    " echomsg s:happy_kitty "Linux"
    nnoremap <leader>exh :!open %:h<CR><CR>
endif
if CheckOs() == 'windows'
    " echomsg s:trippy_kitty "Windows"
    nnoremap <leader>exh :cd %:h<CR>:!/cygdrive/c/Windows/explorer.exe "$(cygpath -w -a %:h)"<CR>
endif
"}}}

" ;md - Open the Markdown version of the file in the active Vim window.{{{
nnoremap <leader>md :call ViewMarkdownInBrowser()<CR>
"{{{ function! ViewMarkdownInBrowser()
function! ViewMarkdownInBrowser()
    " Open active file in web browser. Do nothing if filetype is not markdown.{{{
    " Check OS to choose appropriate program for Windows and Linux.
    " Windows: use explorer
    " Linux: use browse
    "}}}
    " One-liner version without OS check:{{{
    " :!/cygdrive/c/Windows/explorer.exe "$(cygpath -w -a %:r.md)"<CR>
    " }}}
    " Check this is a markdown file
    if (&filetype != 'markdown')
        echomsg s:sad_kitty "This is not a markdown file."
        return
    endif
    " Get fullpath to markdown file.
    let mdfullpath = expand('%:p')
    if CheckOs() == 'linux' | call system("browse "..mdfullpath.." &") | endif
    if CheckOs() == 'windows' "{{{
        " Convert POSIX path to Windows path.
        " Surround in double-quotes to handle paths with spaces.{{{
        " Two methods work to handle paths with spaces:
        " Backslash to escape spaces: $ explorer Vim\ window\ location.md
        " Surround in double-quotes: $ explorer "Vim window location.md"
        " It is easier to use double-quotes.}}}
        let mdfullpath = system('cygpath -w -a "'..mdfullpath..'"')
        echomsg mdfullpath
        " Open in browser. Need doublequotes for Windows path backslashes.
        call system('explorer "' . mdfullpath . '"')
    endif "}}}
endfunction
"}}}
" Brave needs an extension to render Markdown.
" Install extension `Markdown Viewer.{{{
" GitHub repo: https://github.com/simov/markdown-viewer.git
" Uses GitHub Flavored Markdown:
" https://guides.github.com/features/mastering-markdown/#GitHub-flavored-markdown
" }}}
" Allow the extension to render local `.md` files in the browser:{{{
" In settings/extensions/details (go to brave://extensions/ or
" chrome://extensions/) find the extension and click on `Details`
" turn on "Allow access to file URLs"
" And unless you want to click the extension everytime to let it *reload*
" the page, just set `Site access` to `On all Sites`}}}
" Allow Vimium to run on local `.md` files:{{{
" right-click Vimium and select `Manage Extensions`
" click `Details` and turn on "Allow access to file URLs"
" }}}
" Allow DarkReader to run on local `.md`. files:{{{
" right-click DarkReader and select `Manage Extensions`
" click `Details` and turn on "Allow access to file URLs"
" }}}
" An alternative to `Markdown Preview Plus` is `grip`{{{
" https://github.com/joeyespo/grip
" use `grip` to view Markdown
" cd into the repo folder with the markdown file
" start a grip server:
" $ grip
" then open a Brave tab and browse to http://localhost:6419/
" grip finds the markdown file and displays it
"}}}
"}}}
nnoremap <leader>M :call SearchMouserForPnumInQuotes()<CR>
    " You put cursor on part number (part number must be in quotes).
    " Opens Mouser search page with part number in clipboard. OVERWRITES `+` register.
    " You use Vimium to access search bar and paste part number.
function! SearchMouserForPnumInQuotes()
    " Search on the docs.microsoft page sucks. OVERWRITES `+` register.
    " Put "win32api {keyword}" into the browser search engine.
    " The best I could do is open DuckDuckGo, then it's up to me to hit Ctrl+V
    normal! "+yi"
    call system('explorer https://www.mouser.com/Electronic-Components/')
endfunction

" This does not work because of the "=" sign:
" :!explorer.exe https://www.mouser.com/Search/Refine?Keyword=810-CGA3E2X7R1H104K

nnoremap <leader>P :call SearchPythonDocsForWordUnderCursor()<CR>
function! SearchPythonDocsForWordUnderCursor()
    " OVERWRITES `+` register.
    " Put "docs.python.org/3 {keyword}" into the browser search engine.
    " The best I could do is open DuckDuckGo, then it's up to me to hit Ctrl+V
    normal! "zyiw
    let @+="docs.python.org/3 " . @z
    call system('explorer https://duckduckgo.com/')
endfunction
nnoremap <leader>kr :call OpenDevDocsRust()<CR>
function OpenDevDocsRust()
    if CheckOs() == 'linux'
        call system ('firefox https://devdocs.io/rust/ &')
    endif
endfunction
nnoremap <leader>kc :call OpenDevDocsCpp()<CR>
function OpenDevDocsCpp()
    if CheckOs() == 'windows' "{{{
        " call system ('explorer https://devdocs.io/c/')
        call system ('explorer https://devdocs.io/cpp/')
        " call system ('explorer https://en.cppreference.com/w/c')
        call system ('explorer https://en.cppreference.com/w/cpp')
        " call system ('explorer https://devdocs.io/go/')
    endif
    "}}}
    if CheckOs() == 'linux'
        call system ('firefox https://devdocs.io/cpp/ &')
        call system ('firefox https://en.cppreference.com/w/cpp &')
    endif
endfunction
" nnoremap <leader>K :call SearchWin32ApiForWordUnderCursor()<CR>
nnoremap <leader>MS :call SearchWin32ApiForWordUnderCursor()<CR>
function! SearchWin32ApiForWordUnderCursor()
    " Search on the docs.microsoft page sucks. OVERWRITES `+` register.
    " Put "win32api {keyword}" into the browser search engine.
    " The best I could do is open DuckDuckGo, then it's up to me to hit Ctrl+V
    normal! "zyiw
    let @+="docs.microsoft win32api " . @z
    call system('explorer https://duckduckgo.com/')
    " This does not work:
    " call system('explorer "https://duckduckgo.com/?q=win32api+' . @z . '&t=brave&ia=web"')
endfunction

nnoremap <leader>KP :call OpenPyDocs()<CR>
function OpenPyDocs()
    call system ('explorer https://docs.python.org/3/')
endfunction
" nnoremap <leader>KP :call OpenPillowDocs()<CR>
function OpenPillowDocs()
    call system ('explorer https://pillow.readthedocs.io/en/stable/')
endfunction

nnoremap <leader>kt :call OpenDevDocsTcl()<CR>
function OpenDevDocsTcl()
    call system ('explorer https://devdocs.io/tcl_tk/')
endfunction
nnoremap <leader>KT :call OpenTclTutorial()<CR>
function OpenTclTutorial()
    call system ('explorer https://www.tcl-lang.org/man/tcl8.5/tutorial/tcltutorial.html')
endfunction

nnoremap <leader>KA :call OpenArmMbedDocs()<CR>
function OpenArmMbedDocs()
    " OVERWRITES `+` register.
    normal! "zyiw
    let @+=@z
    if CheckOs() == 'linux'
        " call system ('browse https://wiki.libsdl.org/wiki/search &')
        call system ('browse https://os.mbed.com/docs/mbed-os/v6.15/apis/index.html &')
    endif
endfunction
nnoremap <leader>KS :call SearchLibSDLWikiForWordUnderCursor()<CR>
function! SearchLibSDLWikiForWordUnderCursor()
    " OVERWRITES `+` register.
    normal! "zyiw
    let @+=@z
    if CheckOs() == 'linux'
        " call system ('browse https://wiki.libsdl.org/wiki/search &')
        call system ('browse https://wiki.libsdl.org/SDL3/'..@z..' &')
    else " Windows
        call system('explorer https://wiki.libsdl.org/wiki/search')
    endif
    " Paste (Ctrl+V) into search bar
endfunction

nnoremap <leader>UL :call SearchUltraLibrarianForWordUnderCursor()<CR>
function! SearchUltraLibrarianForWordUnderCursor()
    " OVERWRITES `+` register.
    normal! "zyiw
    echomsg s:happy_kitty "Search UltraLibrarian for" @z
    let @+=@z
    " This does not work: And don't try to solve it. Been there.{{{
    " Problem is the "=" sign.
    " From PowerShell, the escape sequence is to surround the url in triple
    " qoutes: """blah"""
    " But passing that through bash to PowerShell seems inescapably impossible.
    " call system('explorer https://app.ultralibrarian.com/Search?queryText=' . @z)}}}
    call system('explorer https://app.ultralibrarian.com/Search?queryText')
endfunction

" Colorschemes
set t_Co=256
" ;CS - restore color scheme{{{
nnoremap <leader>CS :call ColorschemeToggle()<CR>"{{{
" Manual refresh scheme with ";CS" instead of changing buffers.
" See augroup vimrc -> au BufEnter.
" Whatever you implement for ";CS" also implement for "au BufEnter".
"}}}
" ColorschemeToggle{{{
function! ColorschemeToggle()
    if matchstr(@%,"notes_for_update") == "notes_for_update"
        exec('colorscheme '.g:my_notes_colorscheme)
        redraw | echo "colorscheme ".g:my_notes_colorscheme
    elseif &filetype == "markdown"
        exec('colorscheme '.g:my_md_colorscheme)
        redraw | echo "colorscheme ".g:my_md_colorscheme
    elseif &filetype == "c" && &readonly
        exec('colorscheme '.g:my_c_ro_colorscheme)
        redraw | echo "colorscheme ".g:my_c_ro_colorscheme
    elseif &filetype == "c"
        exec('colorscheme '.g:my_c_colorscheme)
        redraw | echo "colorscheme ".g:my_c_colorscheme
    elseif &filetype == "asm"
        exec('colorscheme '.g:my_disassembly_colorscheme)
        redraw | echo "colorscheme ".g:my_disassembly_colorscheme
    elseif &filetype == "avra"
        exec('colorscheme '.g:my_disassembly_colorscheme)
        redraw | echo "colorscheme ".g:my_disassembly_colorscheme
    elseif &filetype == "vim"
        exec('colorscheme '.g:my_vimrc_colorscheme)
        redraw | echo "colorscheme ".g:my_vimrc_colorscheme
    else
        exec('colorscheme '.g:my_fav_colorscheme)
        redraw | echo "colorscheme ".g:my_fav_colorscheme
    endif
endfunction
"}}}
" Use Steve Losh schemes{{{
" The Steve Losh schemes are real VimScript.
" Most of the other colorschemes in my folder are bullshit tweaks and I should
" just delete the whole bunch.
"}}}
"}}}
" I modified ~/.vim/colors/badwolf.vim:186 for better contrast{{{
" [x] change blackgravel to blackestgravel (darker)
" " call s:HL('Normal', 'plain', 'blackgravel')
" call s:HL('Normal', 'plain', 'blackestgravel')
"}}}
" Be careful testing colorschemes{{{
" Sourcing a colorscheme .vim file adds tons of variables{{{
" some set colors for things others do not
" so the order you try different schemes in affects the outcome
" and weird settings get into the sesion
"}}}
" Safe way is to save the session before you start messing around.{{{
" If you find something you like,
" :qall
" restart session to make sure no weird variables are in the Session
" put the color setting in the .vimrc
"}}}}}}
" ;co - colorscheme shortcuts{{{
nnoremap <leader>co :colorscheme
" good for everything, but goodwolf has better contrast in markdown and .vimrc
nnoremap <leader>cob :colorscheme badwolf<CR>
" good for .vimrc and markdown but all code is mostly grayscale
nnoremap <leader>cog :colorscheme goodwolf<CR>
" crazy land
nnoremap <leader>cor :colorscheme resdogs<CR>
" nnoremap <leader>coc :colorscheme CandyPaper<CR>
" subdued
nnoremap <leader>cod :colorscheme deus<CR>
"}}}
" background and foreground are quickly manipulated with ctermbg and ctermfg
" see :h :hi-normal-cterm
" to see the current color settings for ctermbg and ctermfg:
" :hi Normal
" badwolf makes ctermbg=232 and ctermgf=15
" turn contrast up by setting ctermbg to 0 or 16 or 232
    " make background progressively lighter increasing from 232 up to 255
" white background is ctermbg=231
" olive background is ctermbg=58 or 100
" green background is ctermbg=22
" dark red is ctermbg=52
" BB: black background
" ;c+ - increment ctermfg"{{{
nnoremap <silent><leader>c+  :call ChangeHiNormalColor('+','fg')<CR>
"}}}
" ;c- - decrement ctermfg
nnoremap <silent><leader>c-  :call ChangeHiNormalColor('-','fg')<CR>
" ;C+ - increment ctermbg
nnoremap <silent><leader>C+  :call ChangeHiNormalColor('+','bg')<CR>
" ;C- - decrement ctermbg{{{
nnoremap <silent><leader>C-  :call ChangeHiNormalColor('-','bg')<CR>
"}}}
" ChangeHiNormalColor - called by ;c+ ;c- ;C+ ;C-{{{
" `Normal` highlight group is text and background not affected by syntax
" coloring.
function! ChangeHiNormalColor(direction,ground)
    let ctermXg = "cterm" . a:ground
    let old_color = matchstr(execute('hi Normal'), ctermXg . "=...")[8:10]
    if a:direction == '+'
        if old_color == '255'
            let new_color = '255'
        else
            let new_color = old_color+1
        endif
    endif
    if a:direction == '-'
        if old_color == '0'
            let new_color = '0'
        else
            let new_color = old_color-1
        endif
    endif
    execute 'hi Normal ' . ctermXg . '=' . new_color
    redraw | echomsg s:happy_kitty a:direction . ctermXg "=" . new_color
endfunction
"}}}
nnoremap <leader>coBB :hi Normal   ctermbg=0
" GF: green text
nnoremap <leader>coGF :hi Normal   ctermfg=2
" PF: purple text
nnoremap <leader>coPF :hi Normal   ctermfg=4
" WF: white text
nnoremap <leader>coWF :hi Normal   ctermfg=15

" Markdown syntax highlighting in code blocks{{{
" Set syntax highlighting languages recognized for code blocks
let g:markdown_fenced_languages = ['vim', 'c', 'python', 'make', 'bash=sh', 'avra', 'asm']
" Check which languages can be 'fenced' in markdown:{{{
" :let g:markdown_fenced_languages
" }}}


" Example: Python code block{{{
" ```python
" def python_function():
"     print("This is a Fenced CodeBlock.")
" ```
"}}}
"let g:markdown_minlines=50{{{
"If needed, make this number bigger. Default is 50. It is the number of
"lines to synchronize syntax highlighting for fenced codeblocks. If too big
"though, it makes highlighting perform badly.
"}}}
"}}}
" Colorscheme variables
" Favorite{{{
let my_fav_colorscheme = "badwolf"
" exec('colorscheme '.my_fav_colorscheme)
"}}}
" Notes{{{
let my_notes_colorscheme = "deus"
" let my_notes_colorscheme = "CandyPaper"
" I like that 'deus' and 'badwolf' bold Markdown headings
" I like that 'badwolf' and 'CandyPaper' have very dark backgrounds
" 'CandyPaper' is even darker than 'badwolf'
" 'duoduo' bolds some things, but not markdown headings
" e.g., 'duoduo' bolds .vimrc nicely and none of the others do!
"}}}
" Markdown{{{
let my_md_colorscheme = "badwolf"
" let my_md_colorscheme = "goodwolf"
"}}}
" C{{{
let my_c_colorscheme = "badwolf"
let my_c_ro_colorscheme = "greywolf"
let resize_c_buffers = 1
" let my_c_ro_colorscheme = "goodwolf" " too subdued
" let my_c_ro_colorscheme = "deus"
" let my_c_ro_colorscheme = "crt"
"}}}
nnoremap <leader>rb :call ToggleResizeCBuffers()<CR>
function! ToggleResizeCBuffers()
    if g:resize_c_buffers == 0
        let g:resize_c_buffers = 1
        echomsg s:happy_kitty "Toggled: resize when entering a C buffer"
    else
        let g:resize_c_buffers = 0
        echomsg s:trippy_kitty "Toggled: do NOT resize when entering a C buffer"
    endif
endfunction
" Vim{{{
let my_vimrc_colorscheme = "badwolf"
" Diff{{{
let my_vimdiff_colorscheme = "asmwolf"
" let my_vimdiff_colorscheme = "duoduo" " super loud for diff
" let my_vimdiff_colorscheme = "Tomorrow-Night-Bright" " Like it, but messes up badwolf
"}}}
"}}}
" Assembly{{{
let my_disassembly_colorscheme = "asmwolf"
"}}}
" TODO[ ] colorscheme for files that begin with the name 'test_'
" Vim fix for big C files is to use manual fold:
        " \ | elseif (&filetype == "c" || &filetype == "cpp")
        "     \ | if matchstr(@%, "MY_BIG_FREAKIN_FILE.cpp") == "MY_BIG_FREAKIN_FILE.cpp" | set fdm=manual | else | set fdm=syntax | endif
" Or just turn off syntax highlighting all together:
        " \ | elseif matchstr(@%,"u8g2_fonts.c") == "u8g2_fonts.c"
        "     \ | set ft=txt
" Autocmd{{{
augroup vimrc
    au!

    " autocmd InsertEnter *.cpp syntax off
    " autocmd InsertLeave *.cpp syntax on | normal! zv
    " TODO: this does not work.... why? Maybe I needed a backslash: \<C-w>
    " autocmd VimResized * execute "normal! <C-w>="
    autocmd VimResized * execute "wincmd p"

    " Simple example autocommand:
    " au BufEnter *
    "     \ :echo "<^.^> Entered a buffer. <^.^>"
    " matchstr() returns "" if there is no match.
            " \ | exec('colorscheme '.g:my_c_colorscheme)
            " \ | redraw | file
    au BufEnter *
        \   if matchstr(@%,"notes_for_update") == "notes_for_update"
            \ | execute('colorscheme '.g:my_notes_colorscheme)
            \ | redraw | file
        \ | elseif matchstr(@%,".obsidian/workspace") == ".obsidian/workspace"
            \ | set ft=json
            \ | set fdm=syntax
            \ | redraw | file
        \ | elseif matchstr(@%,"serial-example.log") == "serial-example.log"
            \ | execute('match ErrorMsg /FAIL.*/')
            \ | execute('2match Cursor /.*---.*/')
            \ | execute('3match Define /.*test_.*PASS.*/')
        \ | elseif &filetype == "markdown"
            \ | set tw=65
            \ | set tw=0
            \ | set shiftwidth=2
            \ | set softtabstop=2
            \ | if matchstr(@%,"todo\.md") == "todo.md"
            \ |     execute('colorscheme '.g:my_notes_colorscheme)
            \ | else
            \ |     execute('colorscheme '.g:my_md_colorscheme)
            \ | endif
            \ | redraw | file
        \ | elseif &diff
            \ | execute('colorscheme '.g:my_vimdiff_colorscheme)
            \ | setlocal nospell
            \ | redraw | file
        \ | elseif &filetype == "json"
            \ | set foldmethod=syntax
            \ | if &readonly
            \ |     execute('colorscheme '.g:my_c_ro_colorscheme)
            \ | else
            \ |     execute('colorscheme '.g:my_c_colorscheme)
            \ | endif
            \ | redraw | file
        \ | elseif (&filetype == "systemverilog") || (&filetype == "verilog")
            \ | set foldmethod=indent
            \ | execute('colorscheme '.g:my_fav_colorscheme)
            \ | redraw | file
        \ | elseif &filetype == "verilog"
            \ | set foldmethod=indent
            \ | execute('colorscheme '.g:my_fav_colorscheme)
            \ | redraw | file
        \ | elseif (&filetype == "c" || &filetype == "cpp")
            \ | if matchstr(@%, "MY_BIG_FREAKIN_FILE.cpp") == "MY_BIG_FREAKIN_FILE.cpp" | set foldmethod=manual
                \ | elseif matchstr(@%, "u8g2.h") == "u8g2.h" | set foldmethod=manual
                \ | elseif matchstr(@%, "u8g2_fonts.c") == "u8g2_fonts.c" | set foldmethod=manual
                \ | else | set foldmethod=syntax | endif
            \ | execute('set colorcolumn='..s:c_commentcol)
            \ | if g:resize_c_buffers | execute('vertical resize '..(s:c_winwidth+4)) | endif
            \ | execute('set textwidth='..(s:c_winwidth))
            \ | if &readonly
            \ |     execute('colorscheme '.g:my_c_ro_colorscheme)
            \ | else
            \ |     execute('colorscheme '.g:my_c_colorscheme)
            \ | endif
            \ | redraw | file
        \ | elseif &filetype == "asm"
            \ | set foldmethod=syntax
            \ | execute('colorscheme '.g:my_disassembly_colorscheme)
            \ | redraw | file
        \ | elseif &filetype == "avra"
            \ | set foldmethod=syntax
            \ | execute('colorscheme '.g:my_disassembly_colorscheme)
            \ | setlocal nospell
            \ | redraw | file
        \ | elseif &filetype == "tcl"
            \ | set foldmethod=marker
        \ | elseif &filetype == "vim"
            \ | set foldmethod=marker
            \ | execute('colorscheme '.g:my_vimrc_colorscheme)
            \ | redraw | file
        \ | elseif &filetype == "gdscript"
            \ | set foldmethod=expr
            \ | execute('colorscheme '.g:my_vimrc_colorscheme)
            \ | redraw | file
        \ | else
            \ | execute('colorscheme '.g:my_fav_colorscheme)
        \ | endif
        \ | call HiReadonlyStatusLine()
        \ | if &filetype == "python"
            \ | if &readonly
            \ |     execute('colorscheme '.g:my_c_ro_colorscheme)
            \ | endif
            \ | execute('set colorcolumn='..s:python_commentcol)
            \ | if g:resize_c_buffers | execute('vertical resize '..(s:python_winwidth+4)) | endif
            \ | execute('set textwidth='..(s:python_winwidth))
            \ | set fdm=expr
            \ | redraw | file
        \ | endif
            " Fence the fruits of TDD with bright happy cat faces.
            " The 'syn match ptyhonTodo' is what makes the faces bright.
                "Example:
                " #   >^.^<     >^.^<    >^.^<    >^.^<    >^.^<  
                " #---BEGIN - Code covered by the above tests---
                " def function_covered_by_TDD():
                " ...
                " def another_function_covered_by_TDD():
                " ...
                " #---END - Code covered by the above tests---
                " #  <'.'>    <'.'>    <'.'>    <'.'>    <'.'>  
    " au BufLeave *
    "     \ if matchstr(@%,"notes_for_update") != ""
    "         \ | execute('colorscheme duoduo')
    "     \ | endif
    au BufLeave *
        \ if &filetype == "markdown"
        \ | set shiftwidth=4
        \ | set softtabstop=4
        \ | endif
    au DirChanged * :call CscopeAddExisting()
        " use <afile> to get the new directory name
        " use pattern "global"?, see :h autocmd-patterns
        " Need to do more testing, but for now this is working!
    au BufEnter *.abc :call RemoveAllDistractionsFromScreen() | :call MapAbcSlideKeys()
    au BufLeave *.abc :call RestoreAllDistractionsToScreen() | :call UnmapAbcSlideKeys()
    au BufEnter *.p8 :set filetype=lua | :set noexpandtab | :set foldmethod=indent
    au BufLeave *.p8 :set expandtab
augroup END
"}}}
" RemoveAllDistractionsFromScreen{{{
function! RemoveAllDistractionsFromScreen()
    "echomsg "Remove all the distractions."
    " Unfold all folds.
    normal! zRgg
    " Save all settings before changing them.
    let s:old_colorcolumn       = &colorcolumn
    set colorcolumn=0
    let s:old_list              = &list
    set nolist
    let s:old_noruler           = &ruler
    set noruler
    let s:old_number            = &number
    set nonumber
    let s:old_relativenumber    = &relativenumber
    set norelativenumber
    let s:old_cursorline        = &cursorline
    set nocursorline
    let s:old_foldlevelstart    = &foldlevelstart
    set foldlevelstart=99
    let s:old_laststatus        = &laststatus
    set laststatus=0
endfunction
"}}}
" RestoreAllDistractionsToScreen{{{
function! RestoreAllDistractionsToScreen()
    "echomsg "Restore distractions to screen."
    let &colorcolumn    = s:old_colorcolumn
    let &list           = s:old_list
    let &ruler          = s:old_noruler
    let &number         = s:old_number
    let &relativenumber = s:old_relativenumber
    let &cursorline     = s:old_cursorline
    let &foldlevelstart = s:old_foldlevelstart
    let &laststatus     = s:old_laststatus
endfunction
"}}}
" MapAbcSlideKeys{{{
function! MapAbcSlideKeys()
    "echomsg "Map PageUp, PageDown, Space, Left, and Right."
    nnoremap <silent> <PageUp> :bprevious<CR>
    nnoremap <silent> <PageDown> :bnext<CR>
    nnoremap <Space> :call Make_NAME_KEYS_FromUserInput('')<CR>
        " Press <Space>
            " You are prompted to enter a name.
            " This calls cryptotunes.py on the name.
            " Vim reads in the NAME and KEYS.
            " Now you can press the arrow keys to see the animation.
        "May need to wrap in call to inputsave() and inputrestore() if you add
        "to the <Space> mapping.
    nnoremap <silent> <Left> :call StepThroughName('Left')<CR>
    nnoremap <silent> <Right> :call StepThroughName('Right')<CR>
endfunction
"}}}
" UnmapAbcSlideKeys{{{
function! UnmapAbcSlideKeys()
    "echomsg "Unmap PageUp, PageDown, Space, Left, and Right."
    nunmap <PageUp>
    nunmap <PageDown>
    nunmap <Space>
    nunmap <Left>
    nunmap <Right>
endfunction
"}}}
"

" Show me highlighting info so I can write my syntax highlighting file.
nnoremap <leader>hi :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . '> lo<' . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . '>'<CR>

" Markdown {{{
" ;mh - find all occurrences of word under cursor in Markdown headings{{{
nnoremap <leader>mh :call SearchForWordInMarkdownHeadings()<CR>
function! SearchForWordInMarkdownHeadings()
    " Copy the word under the cursor into register z
    normal! "zyiw
    let word = @z
    " Search for the word in the Markdown headings.
    " Need try/endtry block to silence E480: not found.
    "
    " search-pattern and vimgrep syntax:
    "
    "                          In the current file ----|
    "           find where word appears ----|          |
    "       with "#" in col1 -----|         |          |
    "                             |         |          |
    try   | execute 'vimgrep "\%1c#.*' .. word .. '.*" %'
        \ | catch /E480:/
        \ | echomsg s:sad_kitty "'" .. word .. "' not found in any headings."
        \ | let @z = ''
        \ | return
        \ | endtry
    " Got here? Great: found word.
    " Open quickfix window to display results.
    copen
    " Go back to previous window
    execute "silent wincmd p"
    " ---Report success---
    echomsg s:happy_kitty "Quickfix opened with all occurrences of '" .. word "' in headings."
    " ---Cleanup---
    let @z = ''
endfunction
" }}}
" }}}

" vim:set fdm=marker:
