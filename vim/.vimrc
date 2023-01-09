set nocompatible              " turns vi into vim
filetype off                  " required

" {{{ PLUGINS
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim,~/.vim/bundle/
set rtp+=/usr/local/opt/fzf
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'junegunn/fzf' "needs FZF installed externally
Plugin 'junegunn/fzf.vim' "needs FZF installed externally
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'preservim/tagbar'
Plugin 'ervandew/supertab'
" Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'dense-analysis/ale'

Plugin 'vimwiki/vimwiki'
Plugin 'tpope/vim-rails'
Plugin 'slim-template/vim-slim'
Plugin 'digitaltoad/vim-pug.git'

" Plugin 'frazrepo/vim-rainbow'
" Plugin 'sheerun/vim-polyglot'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'

Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'preservim/nerdcommenter'
Plugin 'preservim/nerdtree'
Plugin 'PhilRunninger/nerdtree-visual-selection'


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
au vimenter * NERDTree
nnoremap <c-n> :NERDTreeToggle<cr>

" NERDCommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Allow commenting and inverting empty lines
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" ALE
let g:ale_lint_delay = 500

" Airline
" disable other plugins to hopefully make this faster
let g:airline#extensions#ale#enabled = 0
let g:airline#extensions#fzf#enabled = 0
let g:airline#extensions#gutentags#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#nerdtree_statusline = 0

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
au BufEnter * set indentexpr=

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

" Vim Rainbow
" enable for all filetypes except vimwiki (interferes with link hiding
" feature)
" adapted from https://stackoverflow.com/questions/6496778/vim-run-autocmd-on-all-filetypes-except
" au FileType * if index(['vimwiki'], &ft) < 0 | call rainbow#load() | endif

" }}}


" {{{ SETTINGS
function! SetTextWidthAndHi (width)
  execute ':set textwidth=' . a:width
  if exists('&colorcolumn')
    execute ':set colorcolumn=' . a:width
  endif
endfunction

set splitright backspace=2 regexpengine=1
set autoread
set noswapfile nobackup nowritebackup
set visualbell noerrorbells
set ttyfast lazyredraw
au CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif

set t_Co=256 background=dark
" make sure to set tty emulator colour to match
colorscheme solarized
" au BufEnter,InsertLeave * set cursorcolumn cursorline
" au InsertEnter * set nocursorcolumn nocursorline
hi CursorColumn ctermbg=24
set title display=lastline
set scrolloff=3
set showmode showcmd
set number relativenumber
set wildmenu wildmode=longest:full,full
set list listchars=nbsp:_,trail:.

set wrap linebreak
set expandtab shiftwidth=2 tabstop=2 softtabstop=2
set autoindent copyindent shiftround
set hlsearch incsearch smartcase ignorecase showmatch
set foldmethod=manual foldlevel=99 foldcolumn=2
set iskeyword+=-,_
call SetTextWidthAndHi(72)

set spell spelllang=en_gb
hi clear SpellBad
hi SpellBad ctermfg=red cterm=underline,bold
hi SpellLocal ctermfg=red cterm=none
hi SpellCap ctermfg=magenta cterm=underline

augroup Filetypes
  au!
  au FileType ruby :setlocal iskeyword+=!
  au FileType python,sh :setlocal shiftwidth=4 tabstop=4 softtabstop=4 fileformat=unix
  au FileType python,sh :call SetTextWidthAndHi(79)
  au FileType yaml :setlocal foldmethod=indent
  au FileType vim,sh :setlocal foldmethod=marker
  au FileType vue :setlocal foldmethod=marker foldmarker=<script>,</script>
  au BufWritePost *.tex ! pdflatex --interaction=nonstopmode <afile>
augroup end

" augroup SaveBufferSettings
  " au BufWritePost *.* :mkview
  " au BufRead *.* :loadview
" augroup end
" }}}


" {{{ MAPPINGS
" auto completion courtesy of Gary Bernhardt, can replace supertab if
" that becomes slow
" https://github.com/garybernhardt/dotfiles/blob/main/.vimrc#L159-L173

" function! InsertTabWrapper()
    " let col = col('.') - 1
    " if !col
        " return "\<tab>"
    " endif
"
    " let char = getline('.')[col - 1]
    " if char =~ '\k'
        " " There's an identifier before the cursor, so complete the identifier.
        " return "\<c-x>\<c-n>"
    " else
        " return "\<tab>"
    " endif
" endfunction
" inoremap <expr> <tab> InsertTabWrapper()

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
" }}}
