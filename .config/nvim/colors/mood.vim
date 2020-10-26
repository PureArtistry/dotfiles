" this colour scheme is specifically designed for wpgtk generated palettes
" lots of stuff lifted from https://github.com/joshdick/onedark.vim/

" Init {{{

hi clear
set background=dark

if exists('syntax_on')
    syntax reset
endif

let g:colors_name = 'mood'

" }}}
" Syntax Groups (descriptions and ordering from `:h w18`) {{{

hi Comment          ctermbg=8       ctermfg=7       cterm=NONE      " any comment
hi Constant         ctermbg=NONE    ctermfg=14      cterm=NONE      " any constant
hi String           ctermbg=NONE    ctermfg=10      cterm=NONE      " a string constant: "this is a string"
hi Character        ctermbg=NONE    ctermfg=2       cterm=bold      " a character constant: 'c', '\n'
hi Number           ctermbg=NONE    ctermfg=11      cterm=NONE      " a number constant: 234, 0xff
hi Boolean          ctermbg=NONE    ctermfg=11      cterm=italic    " a boolean constant: TRUE, false
hi Float            ctermbg=NONE    ctermfg=11      cterm=NONE      " a floating point constant: 2.3e10
hi Identifier       ctermbg=NONE    ctermfg=9       cterm=bold      " any variable name
hi Function         ctermbg=NONE    ctermfg=4       cterm=bold      " function name (also: methods for classes)
hi Statement        ctermbg=NONE    ctermfg=13      cterm=bold      " any statement
hi Conditional      ctermbg=NONE    ctermfg=5       cterm=italic    " if, then, else, endif, switch, etc.
hi Repeat           ctermbg=NONE    ctermfg=5       cterm=italic    " for, do, while, etc.
hi Label            ctermbg=15      ctermfg=0       cterm=bold      " case, default, etc.
hi Operator         ctermbg=NONE    ctermfg=5       cterm=bold      " sizeof", "+", "*", etc.
hi Keyword          ctermbg=NONE    ctermfg=9       cterm=NONE      " any other keyword
hi Exception        ctermbg=5       ctermfg=15      cterm=NONE      " try, catch, throw
hi PreProc          ctermbg=NONE    ctermfg=3       cterm=NONE      " generic Preprocessor
hi Include          ctermbg=NONE    ctermfg=4       cterm=NONE      " preprocessor #include
hi Define           ctermbg=NONE    ctermfg=5       cterm=NONE      " preprocessor #define
hi Macro            ctermbg=NONE    ctermfg=5       cterm=NONE      " same as Define
hi PreCondit        ctermbg=NONE    ctermfg=3       cterm=NONE      " preprocessor #if, #else, #endif, etc.
hi Type             ctermbg=NONE    ctermfg=3       cterm=italic    " int, long, char, etc.
hi StorageClass     ctermbg=NONE    ctermfg=3       cterm=italic    " static, register, volatile, etc.
hi Structure        ctermbg=NONE    ctermfg=3       cterm=italic    " struct, union, enum, etc.
hi Typedef          ctermbg=NONE    ctermfg=3       cterm=italic    " A typedef
hi Special          ctermbg=NONE    ctermfg=12      cterm=NONE      " any special symbol
hi SpecialChar      ctermbg=15      ctermfg=0       cterm=bold      " special character in a constant
hi Tag              ctermbg=8       ctermfg=7       cterm=NONE      " you can use CTRL-] on this
hi Delimiter        ctermbg=NONE    ctermfg=5       cterm=bold      " character that needs attention
hi SpecialComment   ctermbg=15      ctermfg=0       cterm=bold      " special things inside a comment
hi Debug            ctermbg=15      ctermfg=0       cterm=bold      " debugging statements
hi Underlined                                       cterm=underline " text that stands out, HTML links
hi Ignore           ctermbg=15      ctermfg=0       cterm=bold      " left blank, hidden
hi Error            ctermbg=1       ctermfg=15      cterm=NONE      " any erroneous construct
hi Todo             ctermbg=8       ctermfg=15      cterm=bold      " anything that needs extra attention; mostly the keywords TODO FIXME and XXX

" }}}
" Highlighting Groups (descriptions and ordering from `:h highlight-groups`) {{{

hi ColorColumn      ctermbg=15      ctermfg=0       cterm=bold      " used for the columns set with 'colorcolumn'
hi Conceal          ctermbg=15      ctermfg=0       cterm=bold      " placeholder characters substituted for concealed text (see 'conceallevel')
hi Cursor                                           cterm=reverse   " the character under the cursor
hi CursorIM         ctermbg=15      ctermfg=0       cterm=bold      " like Cursor, but used when in IME mode
hi CursorColumn     ctermbg=14      ctermfg=0       cterm=underline " the screen column that the cursor is in when 'cursorcolumn' is set
hi CursorLine                                       cterm=NONE      " the screen line that the cursor is in when 'cursorline' is set
hi Directory        ctermbg=NONE    ctermfg=14      cterm=NONE      " directory names (and other special names in listings)
hi DiffAdd          ctermbg=2       ctermfg=15      cterm=NONE      " diff mode: Added line
hi DiffChange       ctermbg=3       ctermfg=15      cterm=NONE      " diff mode: Changed line
hi DiffDelete       ctermbg=1       ctermfg=7       cterm=italic    " diff mode: Deleted line
hi DiffText         ctermbg=NONE    ctermfg=15      cterm=bold      " diff mode: Changed text within a changed line
hi EndOfBuffer      ctermbg=NONE    ctermfg=NONE    cterm=NONE      " filler lines (~) after the last line in the buffer
hi ErrorMsg         ctermbg=1       ctermfg=15      cterm=bold      " error messages on the command line
hi VertSplit        ctermbg=NONE    ctermfg=8       cterm=NONE      " the column separating vertically split windows
hi Folded           ctermbg=4       ctermfg=7       cterm=italic    " line used for closed folds
hi FoldColumn       ctermbg=15      ctermfg=0       cterm=bold      " 'foldcolumn'
hi SignColumn       ctermbg=NONE    ctermfg=15      cterm=bold      " column where signs are displayed
hi IncSearch        ctermbg=2       ctermfg=15      cterm=underline " 'incsearch' highlighting; also used for the text replaced with ":s///c"
hi LineNr           ctermbg=NONE    ctermfg=7       cterm=NONE      " Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
hi CursorLineNr     ctermbg=5       ctermfg=15      cterm=bold      " Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
hi MatchParen       ctermbg=14      ctermfg=0       cterm=underline " The character under the cursor or just before it, if it is a paired bracket, and its match.
hi ModeMsg          ctermbg=3       ctermfg=15      cterm=bold      " 'showmode' message (e.g., "-- INSERT --")
hi MoreMsg          ctermbg=3       ctermfg=15      cterm=bold      " more-prompt
hi NonText          ctermbg=5       ctermfg=15      cterm=underline " '~' and '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line).
hi Normal           ctermbg=NONE    ctermfg=15      cterm=NONE      " normal text
hi Pmenu            ctermbg=0       ctermfg=15      cterm=NONE      " Popup menu: normal item.
hi PmenuSel         ctermbg=2       ctermfg=15      cterm=bold      " Popup menu: selected item.
hi PmenuSbar        ctermbg=0       ctermfg=15      cterm=NONE      " Popup menu: scrollbar.
hi PmenuThumb       ctermbg=1       ctermfg=15      cterm=NONE      " Popup menu: Thumb of the scrollbar.
" hi Question", { "fg": s:purple }) " hit-enter prompt and yes/no questions
" hi QuickFixLine", { "fg": s:black, "bg": s:yellow }) " Current quickfix item in the quickfix window.
hi Search           ctermbg=2       ctermfg=15      cterm=underline " Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
hi SpecialKey       ctermbg=0       ctermfg=7       cterm=italic    " Meta and special keys listed with ":map", also for text used to show unprintable characters in the text, 'listchars'. Generally: text that is displayed differently from what it really is.
" hi SpellBad", { "fg": s:red, "gui": "underline", "cterm": "underline" }) " Word that is not recognized by the spellchecker. This will be combined with the highlighting used otherwise.
" hi SpellCap", { "fg": s:dark_yellow }) " Word that should start with a capital. This will be combined with the highlighting used otherwise.
" hi SpellLocal", { "fg": s:dark_yellow }) " Word that is recognized by the spellchecker as one that is used in another region. This will be combined with the highlighting used otherwise.
" hi SpellRare", { "fg": s:dark_yellow }) " Word that is recognized by the spellchecker as one that is hardly ever used. spell This will be combined with the highlighting used otherwise.
" hi StatusLine", { "fg": s:white, "bg": s:cursor_grey }) " status line of current window
" hi StatusLineNC", { "fg": s:comment_grey }) " status lines of not-current windows Note: if this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
" hi StatusLineTerm", { "fg": s:white, "bg": s:cursor_grey }) " status line of current :terminal window
" hi StatusLineTermNC", { "fg": s:comment_grey }) " status line of non-current :terminal window
" hi TabLine", { "fg": s:comment_grey }) " tab pages line, not active tab page label
" hi TabLineFill", {}) " tab pages line, where there are no labels
" hi TabLineSel", { "fg": s:white }) " tab pages line, active tab page label
" hi Terminal", { "fg": s:white, "bg": s:black }) " terminal window (see terminal-size-color)
" hi Title", { "fg": s:green }) " titles for output from ":set all", ":autocmd" etc.
hi Visual           ctermbg=7       ctermfg=0       cterm=NONE      " Visual mode selection
hi VisualNOS        ctermbg=7       ctermfg=0       cterm=NONE      " Visual mode selection when vim is "Not Owning the Selection". Only X11 Gui's gui-x11 and xterm-clipboard supports this.
" hi WarningMsg", { "fg": s:yellow }) " warning messages
" hi WildMenu", { "fg": s:black, "bg": s:blue }) " current match in 'wildmenu' completion

" }}}
" Language-Specific Highlighting {{{

" CSS
" call s:h("cssAttrComma", { "fg": s:purple })
" call s:h("cssAttributeSelector", { "fg": s:green })
" call s:h("cssBraces", { "fg": s:white })
" call s:h("cssClassName", { "fg": s:dark_yellow })
" call s:h("cssClassNameDot", { "fg": s:dark_yellow })
" call s:h("cssDefinition", { "fg": s:purple })
" call s:h("cssFontAttr", { "fg": s:dark_yellow })
" call s:h("cssFontDescriptor", { "fg": s:purple })
" call s:h("cssFunctionName", { "fg": s:blue })
" call s:h("cssIdentifier", { "fg": s:blue })
" call s:h("cssImportant", { "fg": s:purple })
" call s:h("cssInclude", { "fg": s:white })
" call s:h("cssIncludeKeyword", { "fg": s:purple })
" call s:h("cssMediaType", { "fg": s:dark_yellow })
" call s:h("cssProp", { "fg": s:white })
" call s:h("cssPseudoClassId", { "fg": s:dark_yellow })
" call s:h("cssSelectorOp", { "fg": s:purple })
" call s:h("cssSelectorOp2", { "fg": s:purple })
" call s:h("cssTagName", { "fg": s:red })

" Go
" call s:h("goDeclaration", { "fg": s:purple })
" call s:h("goBuiltins", { "fg": s:cyan })
" call s:h("goFunctionCall", { "fg": s:blue })
" call s:h("goVarDefs", { "fg": s:red })
" call s:h("goVarAssign", { "fg": s:red })
" call s:h("goVar", { "fg": s:purple })
" call s:h("goConst", { "fg": s:purple })
" call s:h("goType", { "fg": s:yellow })
" call s:h("goTypeName", { "fg": s:yellow })
" call s:h("goDeclType", { "fg": s:cyan })
" call s:h("goTypeDecl", { "fg": s:purple })

" HTML (keep consistent with Markdown, below)
" call s:h("htmlArg", { "fg": s:dark_yellow })
" call s:h("htmlBold", { "fg": s:dark_yellow, "gui": "bold", "cterm": "bold" })
" call s:h("htmlEndTag", { "fg": s:white })
" call s:h("htmlH1", { "fg": s:red })
" call s:h("htmlH2", { "fg": s:red })
" call s:h("htmlH3", { "fg": s:red })
" call s:h("htmlH4", { "fg": s:red })
" call s:h("htmlH5", { "fg": s:red })
" call s:h("htmlH6", { "fg": s:red })
" call s:h("htmlItalic", { "fg": s:purple, "gui": "italic", "cterm": "italic" })
" call s:h("htmlLink", { "fg": s:cyan, "gui": "underline", "cterm": "underline" })
" call s:h("htmlSpecialChar", { "fg": s:dark_yellow })
" call s:h("htmlSpecialTagName", { "fg": s:red })
" call s:h("htmlTag", { "fg": s:white })
" call s:h("htmlTagN", { "fg": s:red })
" call s:h("htmlTagName", { "fg": s:red })
" call s:h("htmlTitle", { "fg": s:white })

" JavaScript
" call s:h("javaScriptBraces", { "fg": s:white })
" call s:h("javaScriptFunction", { "fg": s:purple })
" call s:h("javaScriptIdentifier", { "fg": s:purple })
" call s:h("javaScriptNull", { "fg": s:dark_yellow })
" call s:h("javaScriptNumber", { "fg": s:dark_yellow })
" call s:h("javaScriptRequire", { "fg": s:cyan })
" call s:h("javaScriptReserved", { "fg": s:purple })
" https://github.com/pangloss/vim-javascript
" call s:h("jsArrowFunction", { "fg": s:purple })
" call s:h("jsClassKeyword", { "fg": s:purple })
" call s:h("jsClassMethodType", { "fg": s:purple })
" call s:h("jsDocParam", { "fg": s:blue })
" call s:h("jsDocTags", { "fg": s:purple })
" call s:h("jsExport", { "fg": s:purple })
" call s:h("jsExportDefault", { "fg": s:purple })
" call s:h("jsExtendsKeyword", { "fg": s:purple })
" call s:h("jsFrom", { "fg": s:purple })
" call s:h("jsFuncCall", { "fg": s:blue })
" call s:h("jsFunction", { "fg": s:purple })
" call s:h("jsGenerator", { "fg": s:yellow })
" call s:h("jsGlobalObjects", { "fg": s:yellow })
" call s:h("jsImport", { "fg": s:purple })
" call s:h("jsModuleAs", { "fg": s:purple })
" call s:h("jsModuleWords", { "fg": s:purple })
" call s:h("jsModules", { "fg": s:purple })
" call s:h("jsNull", { "fg": s:dark_yellow })
" call s:h("jsOperator", { "fg": s:purple })
" call s:h("jsStorageClass", { "fg": s:purple })
" call s:h("jsSuper", { "fg": s:red })
" call s:h("jsTemplateBraces", { "fg": s:dark_red })
" call s:h("jsTemplateVar", { "fg": s:green })
" call s:h("jsThis", { "fg": s:red })
" call s:h("jsUndefined", { "fg": s:dark_yellow })
" https://github.com/othree/yajs.vim
" call s:h("javascriptArrowFunc", { "fg": s:purple })
" call s:h("javascriptClassExtends", { "fg": s:purple })
" call s:h("javascriptClassKeyword", { "fg": s:purple })
" call s:h("javascriptDocNotation", { "fg": s:purple })
" call s:h("javascriptDocParamName", { "fg": s:blue })
" call s:h("javascriptDocTags", { "fg": s:purple })
" call s:h("javascriptEndColons", { "fg": s:white })
" call s:h("javascriptExport", { "fg": s:purple })
" call s:h("javascriptFuncArg", { "fg": s:white })
" call s:h("javascriptFuncKeyword", { "fg": s:purple })
" call s:h("javascriptIdentifier", { "fg": s:red })
" call s:h("javascriptImport", { "fg": s:purple })
" call s:h("javascriptMethodName", { "fg": s:white })
" call s:h("javascriptObjectLabel", { "fg": s:white })
" call s:h("javascriptOpSymbol", { "fg": s:cyan })
" call s:h("javascriptOpSymbols", { "fg": s:cyan })
" call s:h("javascriptPropertyName", { "fg": s:green })
" call s:h("javascriptTemplateSB", { "fg": s:dark_red })
" call s:h("javascriptVariable", { "fg": s:purple })

" JSON
" call s:h("jsonCommentError", { "fg": s:white })
" call s:h("jsonKeyword", { "fg": s:red })
" call s:h("jsonBoolean", { "fg": s:dark_yellow })
" call s:h("jsonNumber", { "fg": s:dark_yellow })
" call s:h("jsonQuote", { "fg": s:white })
" call s:h("jsonMissingCommaError", { "fg": s:red, "gui": "reverse" })
" call s:h("jsonNoQuotesError", { "fg": s:red, "gui": "reverse" })
" call s:h("jsonNumError", { "fg": s:red, "gui": "reverse" })
" call s:h("jsonString", { "fg": s:green })
" call s:h("jsonStringSQError", { "fg": s:red, "gui": "reverse" })
" call s:h("jsonSemicolonError", { "fg": s:red, "gui": "reverse" })

" LESS
" call s:h("lessVariable", { "fg": s:purple })
" call s:h("lessAmpersandChar", { "fg": s:white })
" call s:h("lessClass", { "fg": s:dark_yellow })

" Markdown (keep consistent with HTML, above)
" call s:h("markdownBlockquote", { "fg": s:comment_grey })
" call s:h("markdownBold", { "fg": s:dark_yellow, "gui": "bold", "cterm": "bold" })
" call s:h("markdownCode", { "fg": s:green })
" call s:h("markdownCodeBlock", { "fg": s:green })
" call s:h("markdownCodeDelimiter", { "fg": s:green })
" call s:h("markdownH1", { "fg": s:red })
" call s:h("markdownH2", { "fg": s:red })
" call s:h("markdownH3", { "fg": s:red })
" call s:h("markdownH4", { "fg": s:red })
" call s:h("markdownH5", { "fg": s:red })
" call s:h("markdownH6", { "fg": s:red })
" call s:h("markdownHeadingDelimiter", { "fg": s:red })
" call s:h("markdownHeadingRule", { "fg": s:comment_grey })
" call s:h("markdownId", { "fg": s:purple })
" call s:h("markdownIdDeclaration", { "fg": s:blue })
" call s:h("markdownIdDelimiter", { "fg": s:purple })
" call s:h("markdownItalic", { "fg": s:purple, "gui": "italic", "cterm": "italic" })
" call s:h("markdownLinkDelimiter", { "fg": s:purple })
" call s:h("markdownLinkText", { "fg": s:blue })
" call s:h("markdownListMarker", { "fg": s:red })
" call s:h("markdownOrderedListMarker", { "fg": s:red })
" call s:h("markdownRule", { "fg": s:comment_grey })
" call s:h("markdownUrl", { "fg": s:cyan, "gui": "underline", "cterm": "underline" })

" Perl
" call s:h("perlFiledescRead", { "fg": s:green })
" call s:h("perlFunction", { "fg": s:purple })
" call s:h("perlMatchStartEnd",{ "fg": s:blue })
" call s:h("perlMethod", { "fg": s:purple })
" call s:h("perlPOD", { "fg": s:comment_grey })
" call s:h("perlSharpBang", { "fg": s:comment_grey })
" call s:h("perlSpecialString",{ "fg": s:cyan })
" call s:h("perlStatementFiledesc", { "fg": s:red })
" call s:h("perlStatementFlow",{ "fg": s:red })
" call s:h("perlStatementInclude", { "fg": s:purple })
" call s:h("perlStatementScalar",{ "fg": s:purple })
" call s:h("perlStatementStorage", { "fg": s:purple })
" call s:h("perlSubName",{ "fg": s:yellow })
" call s:h("perlVarPlain",{ "fg": s:blue })

" PHP
" call s:h("phpVarSelector", { "fg": s:red })
" call s:h("phpOperator", { "fg": s:white })
" call s:h("phpParent", { "fg": s:white })
" call s:h("phpMemberSelector", { "fg": s:white })
" call s:h("phpType", { "fg": s:purple })
" call s:h("phpKeyword", { "fg": s:purple })
" call s:h("phpClass", { "fg": s:yellow })
" call s:h("phpUseClass", { "fg": s:white })
" call s:h("phpUseAlias", { "fg": s:white })
" call s:h("phpInclude", { "fg": s:purple })
" call s:h("phpClassExtends", { "fg": s:green })
" call s:h("phpDocTags", { "fg": s:white })
" call s:h("phpFunction", { "fg": s:blue })
" call s:h("phpFunctions", { "fg": s:cyan })
" call s:h("phpMethodsVar", { "fg": s:dark_yellow })
" call s:h("phpMagicConstants", { "fg": s:dark_yellow })
" call s:h("phpSuperglobals", { "fg": s:red })
" call s:h("phpConstants", { "fg": s:dark_yellow })

" Ruby
" call s:h("rubyBlockParameter", { "fg": s:red})
" call s:h("rubyBlockParameterList", { "fg": s:red })
" call s:h("rubyClass", { "fg": s:purple})
" call s:h("rubyConstant", { "fg": s:yellow})
" call s:h("rubyControl", { "fg": s:purple })
" call s:h("rubyEscape", { "fg": s:red})
" call s:h("rubyFunction", { "fg": s:blue})
" call s:h("rubyGlobalVariable", { "fg": s:red})
" call s:h("rubyInclude", { "fg": s:blue})
" call s:h("rubyIncluderubyGlobalVariable", { "fg": s:red})
" call s:h("rubyInstanceVariable", { "fg": s:red})
" call s:h("rubyInterpolation", { "fg": s:cyan })
" call s:h("rubyInterpolationDelimiter", { "fg": s:red })
" call s:h("rubyInterpolationDelimiter", { "fg": s:red})
" call s:h("rubyRegexp", { "fg": s:cyan})
" call s:h("rubyRegexpDelimiter", { "fg": s:cyan})
" call s:h("rubyStringDelimiter", { "fg": s:green})
" call s:h("rubySymbol", { "fg": s:cyan})

" Sass
" https://github.com/tpope/vim-haml
" call s:h("sassAmpersand", { "fg": s:red })
" call s:h("sassClass", { "fg": s:dark_yellow })
" call s:h("sassControl", { "fg": s:purple })
" call s:h("sassExtend", { "fg": s:purple })
" call s:h("sassFor", { "fg": s:white })
" call s:h("sassFunction", { "fg": s:cyan })
" call s:h("sassId", { "fg": s:blue })
" call s:h("sassInclude", { "fg": s:purple })
" call s:h("sassMedia", { "fg": s:purple })
" call s:h("sassMediaOperators", { "fg": s:white })
" call s:h("sassMixin", { "fg": s:purple })
" call s:h("sassMixinName", { "fg": s:blue })
" call s:h("sassMixing", { "fg": s:purple })
" call s:h("sassVariable", { "fg": s:purple })
" https://github.com/cakebaker/scss-syntax.vim
" call s:h("scssExtend", { "fg": s:purple })
" call s:h("scssImport", { "fg": s:purple })
" call s:h("scssInclude", { "fg": s:purple })
" call s:h("scssMixin", { "fg": s:purple })
" call s:h("scssSelectorName", { "fg": s:dark_yellow })
" call s:h("scssVariable", { "fg": s:purple })

" TeX
" call s:h("texStatement", { "fg": s:purple })
" call s:h("texSubscripts", { "fg": s:dark_yellow })
" call s:h("texSuperscripts", { "fg": s:dark_yellow })
" call s:h("texTodo", { "fg": s:dark_red })
" call s:h("texBeginEnd", { "fg": s:purple })
" call s:h("texBeginEndName", { "fg": s:blue })
" call s:h("texMathMatcher", { "fg": s:blue })
" call s:h("texMathDelim", { "fg": s:blue })
" call s:h("texDelimiter", { "fg": s:dark_yellow })
" call s:h("texSpecialChar", { "fg": s:dark_yellow })
" call s:h("texCite", { "fg": s:blue })
" call s:h("texRefZone", { "fg": s:blue })

" TypeScript
" call s:h("typescriptReserved", { "fg": s:purple })
" call s:h("typescriptEndColons", { "fg": s:white })
" call s:h("typescriptBraces", { "fg": s:white })

" XML
" call s:h("xmlAttrib", { "fg": s:dark_yellow })
" call s:h("xmlEndTag", { "fg": s:red })
" call s:h("xmlTag", { "fg": s:red })
" call s:h("xmlTagName", { "fg": s:red })

" }}}
" Git Highlighting {{{

" call s:h("gitcommitComment", { "fg": s:comment_grey })
" call s:h("gitcommitUnmerged", { "fg": s:green })
" call s:h("gitcommitOnBranch", {})
" call s:h("gitcommitBranch", { "fg": s:purple })
" call s:h("gitcommitDiscardedType", { "fg": s:red })
" call s:h("gitcommitSelectedType", { "fg": s:green })
" call s:h("gitcommitHeader", {})
" call s:h("gitcommitUntrackedFile", { "fg": s:cyan })
" call s:h("gitcommitDiscardedFile", { "fg": s:red })
" call s:h("gitcommitSelectedFile", { "fg": s:green })
" call s:h("gitcommitUnmergedFile", { "fg": s:yellow })
" call s:h("gitcommitFile", {})
" call s:h("gitcommitSummary", { "fg": s:white })
" call s:h("gitcommitOverflow", { "fg": s:red })
" hi link gitcommitNoBranch gitcommitBranch
" hi link gitcommitUntracked gitcommitComment
" hi link gitcommitDiscarded gitcommitComment
" hi link gitcommitSelected gitcommitComment
" hi link gitcommitDiscardedArrow gitcommitDiscardedFile
" hi link gitcommitSelectedArrow gitcommitSelectedFile
" hi link gitcommitUnmergedArrow gitcommitUnmergedFile

" }}}
" Plugin Highlighting {{{

" airblade/vim-gitgutter
hi GitGutterAdd     ctermbg=2       ctermfg=15      cterm=bold
hi GitGutterChange  ctermbg=3       ctermfg=15      cterm=bold
hi GitGutterDelete  ctermbg=1       ctermfg=15      cterm=bold

" tpope/vim-fugitive
hi diffAdded        ctermbg=2       ctermfg=15      cterm=bold
hi diffRemoved      ctermbg=1       ctermfg=7       cterm=italic

let g:limelight_conceal_ctermfg = 8

" }}}

" vim:foldmethod=marker
