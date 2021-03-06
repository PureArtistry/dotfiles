" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" lots of stuff in here was copied from https://github.com/amix/vimrc
" thanks for the handy comments, I learned a lot from them

" configure the environment {{{

" plugin management {{{

" auto install plugged, if needed
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

call plug#begin('~/.config/nvim/plugged')

    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-surround'
    Plug 'airblade/vim-gitgutter'
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/vim-slash'
    Plug 'junegunn/limelight.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'honza/vim-snippets'
    Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
    Plug 'vim-scripts/restore_view.vim'
    Plug 'mhinz/vim-startify'

call plug#end()

" }}}

" Don't redraw while executing macros (good performance config)
" set lazyredraw

" Set to auto read when a file is changed from the outside
au FocusGained,BufEnter * checktime
" auto reload config on edits
augroup myconfighooks
    au!
    autocmd bufwritepost init.vim source ~/.config/nvim/init.vim
    autocmd bufwritepost mood.vim source ~/.config/nvim/init.vim
augroup END

set viewoptions=cursor,folds,slash,unix
" let g:skipview_files = ['*\.vim']

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
" set noswapfile

" turn on persistent undo
if has("persistent_undo")
  set undodir=$XDG_DATA_HOME/nvim/undo
  set undofile
endif

set hidden
set history=1000
set shell=/bin/sh
set ttimeoutlen=10
set clipboard+=unnamedplus
set mouse=a

set wildmode=longest,list,full " Enable autocompletion
set complete-=i
set magic " For regular expressions turn magic on

" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set tabstop=4
set shiftwidth=4 "default indent

autocmd InsertEnter * norm zz " Vertically center document when entering insert mode
set so=15 " Set x lines to the cursor - when moving vertically using j/k
set nowrap " Line wrapping
set whichwrap+=<,>,h,l
set showmatch " Show matching brackets when text indicator is over them
set mat=2 " How many tenths of a second to blink when matching brackets

set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
set ignorecase " Ignore case when searching
set smartcase " When searching try to be smart about cases

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" leader key mappings {{{

let mapleader = ";" " With a map leader it's possible to do extra key combinations

nmap <leader>q :q<cr> " swift exit
nmap <leader>r :wq<cr> " save first
nmap <leader>w :w!<cr> " Fast saving
nmap <leader>e :e<cr> " quick reload
nmap <leader>g :Goyo 110x85%<cr> " goyo mode
nmap <leader>h :set spell spelllang=en_gb<cr> " enable spellcheck
nmap <leader>p <Plug>MarkdownPreviewToggle " toggle markdown preview
nmap <Leader>c <Plug>(Prettier) " tidy my code
map <silent> <leader><cr> :noh<cr> " Disable highlight when <leader><cr> is pressed

" }}}

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

let g:mkdp_browser = 'qute_markdown' " markdown preview options

" prettier config
let g:prettier#exec_cmd_path = "~/.local/share/npm/bin/prettier"
let g:prettier#exec_cmd_async = 1
let g:prettier#config#tab_width = '4'
let g:prettier#config#use_tabs = 'false'

" }}}

" theme config {{{

colorscheme mood
set noshowmode
set cursorline
set number
set cmdheight=1 " Height of the command bar

" goyo stuff
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" airline config
let g:airline_theme='mood'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

" }}}

" handy shit {{{

let g:sh_fold_enabled= 5 " fold controls

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
" if has("autocmd")
"     autocmd BufWritePre * :call CleanExtraSpaces()
" endif

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" better block indentation
vmap < <gv
vmap > >gv

" focus on search result
noremap <plug>(slash-after) zz
if has('timers')
  " Blink 2 times with 50ms interval
  noremap <expr> <plug>(slash-after) slash#blink(2, 50)
endif

" CoC options/settings {{{

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-cmake',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-python',
  \ 'coc-rls',
  \ 'coc-sh',
  \ 'coc-tsserver'
  \ ]

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" if has('patch8.1.1068')
"   " Use `complete_info` if your (Neo)Vim version supports it.
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>cr <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ca  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>cf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.

" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" }}}

" }}}
