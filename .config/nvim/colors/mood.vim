"s Vim colorscheme file

" fiddled with by PureArtistry, tweaked to better match my colour scheme.

" Maintainer:   Fernando Vásquez <fmorataya.04@gmail.com>
" Last Change:  2001-09-25 07:48:15 Mountain Daylight Time
" URL:          http://www.naglenet.org/vim/syntax/adrian.vim
" MAIN URL:     http://www.naglenet.org/vim

" This is my custom syntax file to override the defaults provided with Vim.
" This file should be located in $HOME/vimfiles/colors.

" This file should automatically be sourced by $RUNTIMEPATH.

" NOTE(S):
" *(1)
" The color definitions assumes and is intended for a black or dark
" background.

" *(2)
" This file is specifically in Unix style EOL format so that I can simply
" copy this file between Windows and Unix systems.  VIM can source files in
" with the UNIX EOL format (only <NL> instead of <CR><NR> for DOS) in any
" operating system if the 'fileformats' is not empty and there is no <CR>
" just before the <NL> on the first line.  See ':help :source_crnl' and
" ':help fileformats'.
"
" *(3)
" Move this file to adrian.vim for vim6.0aw.
"



hi clear
set background=dark
if exists("syntax_on")
	syntax reset
endif
let g:colors_name = "mood"


hi Normal                 ctermfg=15  ctermbg=0
hi User1                  cterm=none  ctermbg=6    ctermfg=15
hi User2		  cterm=none  ctermbg=8    ctermfg=15
hi Title                  cterm=none  ctermbg=none ctermfg=DarkGrey
hi TabLineFill            cterm=none  ctermbg=8    ctermfg=15
hi TabLine                cterm=none  ctermbg=8    ctermfg=15
hi TabLineSel             cterm=none  ctermbg=14   ctermfg=0
hi StatusLine             cterm=none  ctermbg=2    ctermfg=15
hi StatusLineNC           cterm=none  ctermbg=8    ctermfg=15
hi StatusLineTerm         cterm=none  ctermfg=12   ctermfg=0
hi StatusLineTermNC       cterm=none  ctermbg=8    ctermfg=15
hi CursorLine             ctermbg=0   cterm=none
hi Visual                 ctermbg=14  ctermfg=0    cterm=none
hi CursorLineNr           ctermfg=15 ctermbg=5
hi LineNr                 ctermfg=15  ctermbg=1
hi VertSplit              ctermfg=0   ctermbg=8    cterm=none
hi Specialkey             ctermfg=13  ctermbg=0
hi ErrorMsg               ctermfg=0   ctermbg=9
hi Pmenu                  ctermbg=3   ctermfg=15
hi PmenuSel               ctermbg=1   ctermfg=15   cterm=bold
hi SpellBad               ctermfg=8   ctermbg=9    term=none
hi Comment                ctermfg=4   ctermbg=0    cterm=italic
hi MatchParen             ctermfg=12  ctermbg=8   cterm=none
hi DiffAdd				  ctermfg=0
hi DiffDelete			  ctermfg=0
hi DiffText				  ctermfg=0
hi DiffChange			  ctermfg=0
hi YCMWarningSection      ctermfg=0  ctermbg=4
hi Special                ctermfg=9
hi WarningMsg             ctermfg=10
hi MoreMsg                ctermfg=15
hi Directory              ctermfg=11
hi Folded                 ctermfg=15  ctermbg=3
hi Underlined             term=underline ctermfg=12

highlight Constant   cterm=none      ctermfg=11   guifg=#ffa0a0
"highlight Number   	 term=underline ctermfg=DarkGrey                     guifg=Yellow
highlight Identifier ctermfg=12       cterm=none guifg=#40ffff
highlight Statement  ctermfg=10  gui=bold  guifg=#ffff60
highlight Keyword    ctermfg=13
highlight Conditional ctermfg=11
highlight Number     ctermfg=12
highlight PreProc    ctermfg=10      guifg=#ff4500
highlight Type       ctermfg=13       cterm=italic term=none
highlight Ignore     ctermfg=0       guifg=bg
highlight Error      ctermfg=0       ctermbg=4 guifg=White guibg=Red
highlight Todo       ctermfg=15      ctermbg=1 guifg=Blue  guibg=Yellow
highlight SignColumn ctermbg=2       ctermfg=15

" Change the highlight of search matches (for use with :set hls).
highlight Search                    ctermfg=0      ctermbg=12  guifg=Black    guibg=Yellow

" Change the highlight of visual highlight.

highlight Float          ctermfg=14  guifg=#88AAEE
highlight Exception      ctermfg=10 ctermbg=0 guifg=Red   guibg=White
highlight Function       ctermfg=14
highlight Typedef        ctermfg=10  ctermbg=8   gui=italic  guifg=White guibg=Blue
highlight SpecialChar    ctermfg=15 ctermbg=4   guifg=Black guibg=White
highlight Delimiter      ctermfg=15 ctermbg=1   guifg=White guibg=Black
highlight SpecialComment ctermfg=11 ctermbg=8   guifg=Black guibg=Green

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
hi! link Question Type
hi! link FoldColumn Folded

highlight link Special        Type
highlight link String         Constant
highlight link Character      Constant
highlight link Boolean        Statement
highlight link Repeat         Conditional
highlight link Label          Type
highlight link Operator       Type
highlight link Include        PreProc
highlight link Define         PreProc
highlight link Macro          PreProc
highlight link PreCondit      PreProc
highlight link StorageClass   Type
highlight link Structure      Type
highlight link Tag            Special
highlight link Debug          Special
highlight link Typedef        Type

"highlight link SpecialChar     Special
"highlight link Delimiter       Special
"highlight link SpecialComment  Special
"highlight link Exception       Type
