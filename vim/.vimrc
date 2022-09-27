" ///////////////////////////////////////////////////////
" TOC //////////////////////////////////////////////////
" 1. PLUGINS
" 2. VIM

" ///////////////////////////////////////////////////////
" PLUGINS //////////////////////////////////////////////

set nocompatible              " turns vi into vim
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim,~/.vim/bundle/
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/fzf' "needs FZF installed externally
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'preservim/tagbar'
Plugin 'preservim/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'ervandew/supertab'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-dispatch'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'vim-airline/vim-airline'
Plugin 'vimwiki/vimwiki'
Plugin 'frazrepo/vim-rainbow'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'dense-analysis/ale'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " require

syntax enable
let mapleader=","

" NERDTree
let NERDTreeShowFiles=1
let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore=['\.pyc$','\pycache$']
let NERDTreeMinimalUI=1
let NERDTreeDirArrows=1
autocmd vimenter * NERDTree
nnoremap <c-n> :NERDTreeToggle<cr>

" ALE
let g:ale_lint_delay = 500
let g:airline#extensions#ale#enabled = 1

" Tagbar
nnoremap <leader>t :TagbarToggle<cr>
let g:tagbar_autoclose = 1
let g:tagbar_autofocus = 1
let g:tagbar_compact = 2
let g:tagbar_position = 'rightbelow vertical'

" FZF
nnoremap <c-p> :FZF<cr>

" Vim polyglot
let g:polyglot_disabled = ['autoindent']
autocmd BufEnter * set indentexpr=

" Vimwiki
let g:vimwiki_list = [{'path': '~/id/repos/.vimwiki/',
      \ 'auto_tags': 1, 'syntax': 'markdown',
      \ 'nested_syntaxes': {
        \ 'python': 'python', 'ruby': 'ruby', 'lisp': 'lisp', 'sh': 'sh',
        \ 'sql': 'sql', 'tex': 'tex',
        \ 'javascript': 'javascript',
        \ 'json=javascript': 'javascript',
        \ 'html': 'html', 'css': 'css',
        \ }
      \ }]
let g:vimwiki_listsyms = ' =<✗✓'
cnoremap wbl VimwikiBacklinks<cr>

" Vim Rainbow
" enable for all filetypes except vimwiki (interferes with link hiding
" feature)
" adapted from https://stackoverflow.com/questions/6496778/vim-run-autocmd-on-all-filetypes-except
autocmd FileType * if index(['vimwiki'], &ft) < 0 | call rainbow#load() | endif


" ///////////////////////////////////////////////////////
" VIM //////////////////////////////////////////////////

set splitright backspace=2 regexpengine=1
set noswapfile nobackup nowritebackup
set visualbell noerrorbells
set ttyfast lazyredraw
" match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'
autocmd CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

set t_Co=256 background=dark
" make sure to set tty emulator color to match
colorscheme solarized
set cursorcolumn cursorline
hi CursorColumn ctermbg=24
set title display=lastline
set showmode showcmd
set number relativenumber
set wildmenu wildmode=longest:full,full
set list listchars=nbsp:_,trail:.

set wrap linebreak
set expandtab shiftwidth=2 tabstop=2 softtabstop=2 textwidth=72
set autoindent copyindent shiftround
set hlsearch incsearch smartcase ignorecase showmatch
set foldmethod=indent foldlevel=99 foldcolumn=3
set iskeyword+=-,_

augroup filetypes
  autocmd!
  autocmd FileType python,sh setlocal shiftwidth=4 tabstop=4 softtabstop=4 textwidth=79 fileformat=unix
  autocmd BufWritePost *.tex ! pdflatex --interaction=nonstopmode <afile>
augroup END

noremap ; :
nnoremap <tab> :ls<cr>:b
nnoremap <right> :b#<cr>
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap j gj
noremap k gk
nnoremap <leader>n :set relativenumber!<cr>
inoremap jk <esc>
inoremap <c-u> <space><esc>bvawUEa

" misc movements
nnoremap ci_ F_lvf_hc
nnoremap ci- F-lvf-hc

nnoremap ci; f;vF:bc
nnoremap di; f;vF:bd

nnoremap ca"' F"r'f"r'
nnoremap ca'" F'r"f'r"
