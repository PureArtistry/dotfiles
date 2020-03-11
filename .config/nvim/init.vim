" vim:fileencoding=utf-8:ft=vim:foldmethod=marker

" lots of stuff in here was copied from https://github.com/amix/vimrc
" thanks for the handy comments, I learned a lot from them

" configure the environment {{{
"

" plugin management {{{
"

" auto install plugged, if needed
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
      silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
      autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif

call plug#begin('~/.config/nvim/plugged')

    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-commentary'
    Plug 'tpope/vim-endwise'
    Plug 'tpope/vim-sleuth'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-fugitive'
    Plug 'junegunn/fzf', { 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/vim-slash'
    Plug 'junegunn/limelight.vim'
    Plug 'vim-airline/vim-airline'
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

call plug#end()

" }}}

" Don't redraw while executing macros (good performance config)
" set lazyredraw

" Set to auto read when a file is changed from the outside
au FocusGained,BufEnter * checktime
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" auto reload config on edits
augroup myconfighooks
    au!
    autocmd bufwritepost init.vim source ~/.config/nvim/init.vim
    autocmd bufwritepost mood.vim source ~/.config/nvim/init.vim
augroup END

" Turn backup off, since most stuff is in SVN, git etc. anyway...
" set nobackup
" set nowb
" set noswapfile

set hidden
set history=1000

set shell=/bin/sh

set ttimeoutlen=10
set clipboard+=unnamedplus
set mouse=a

" Enable autocompletion:
set wildmode=longest,list,full
" Disables automatic commenting on newline:
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set wrap "Wrap lines
" Set x lines to the cursor - when moving vertically using j/k
set so=10
set whichwrap+=<,>,h,l
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Ignore case when searching
set ignorecase
" When searching try to be smart about cases
set smartcase
" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" leader key mappings {{{

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" swift exit
nmap <leader>q :q<cr>
" save first
nmap <leader>r :wq<cr>

" Fast saving
nmap <leader>w :w!<cr>

" quick reload
nmap <leader>e :e<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" goyo mode
nmap <leader>g :Goyo<cr>

" enable spellcheck
nmap <leader>h :set spell spelllang=en_gb<cr>

" toggle markdown preview
nmap <leader>p <Plug>MarkdownPreviewToggle

" quick script start
nmap <leader>s i#!/bin/sh<cr><cr>#<Esc>:w! /tmp/new_script<cr>:e<cr><End>a<Space>

" }}}

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" markdown preview options
let g:mkdp_browser = 'qute_markdown'

" }}}

" theme config {{{
"
colorscheme mood
set noshowmode
set cursorline

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

set number
" Add a bit extra margin to the left
set foldcolumn=1

" airline config
let g:airline_theme='mood'
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

" Height of the command bar
set cmdheight=1

" }}}

" handy shit {{{
"

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre * :call CleanExtraSpaces()
endif

set complete-=i

" Move a line of text using ALT+[jk]
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

" focus on search result
noremap <plug>(slash-after) zz
if has('timers')
  " Blink 2 times with 50ms interval
  noremap <expr> <plug>(slash-after) slash#blink(2, 50)
endif

" }}}

