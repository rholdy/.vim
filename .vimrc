execute pathogen#infect()
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'othree/html5.vim'
Plugin 'ap/vim-css-color'
Plugin 'bling/vim-airline'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-ruby/vim-ruby'
Plugin 'airblade/vim-gitgutter'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'tomtom/tcomment_vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kien/ctrlp.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'ggreer/the_silver_searcher'
Plugin 'rking/ag.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'vim-scripts/closetag.vim'
Plugin 'elixir-lang/vim-elixir'

Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 "0 if you want to enable it later via :RainbowToggle"

let g:ctrlp_extensions = ['funky']

Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" ------- Mappings -------

map :Q :q
map :W :w

" cntrl+c to copy to system clipboard
map <C-c> a<C-c><ESC>
vnoremap <C-C> :w !pbcopy<CR><CR>

"leader ff to fix indents in the whole file
map <Leader>ff mfgg=G`fzz<CR>

"leader fw to remove trailing whitespace
map <Leader>fw :StripWhitespace<CR>
autocmd BufWritePre <buffer> StripWhitespace

"leader b to close open buffer without closing the window
nmap <Leader>cb <Plug>Kwbd

"leader e to spit out erb tags
map <Leader>e vS=

" Git Stuff
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>ga :Git add .<CR>
nnoremap <silent> <leader>gp :Git push<CR>

" Delete to pop open Nerd Tree
map <BS> :NERDTreeToggle<CR>

"control-h,j,k,l to switch window panes
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Random Setting stuff
set nocompatible
syntax enable
filetype plugin indent on
set autowrite
set grepprg=ack
set showcmd
set nowrap
set tabstop=2 shiftwidth=2
set expandtab
set backspace=indent,eol,start
set hlsearch
set incsearch
set ignorecase
set smartcase
set number
let NERDTreeShowHidden=1
let g:NERDTreeWinPos = "right"

"set the line number background to be something not sucky
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
:highlight clear SignColumn

augroup myfiletypes
    autocmd!
    autocmd FileType slim,coffee,ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

augroup mydelimitMate
  au!
  au FileType ruby let b:delimitMate_nesting_quotes = ["`"]
  au FileType ruby let b:delimitMate_quotes = ""
  au FileType ruby let b:delimitMate_nesting_quotes = ['"', "'"]
  au FileType ruby let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType eruby let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType eruby let b:delimitMate_nesting_quotes = ['"', "'"]
  au FileType eruby let b:delimitMate_nesting_quotes = ["`"]
  au FileType eruby let b:delimitMate_quotes = ""
augroup END

" --- ctrlp stuff to make it not slow ----
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore "**/*.pyc"
      \ -g ""'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }

" Ruby Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1

"------------- General Settings--------------
"---Buffer Stuff
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" Move to the next buffer
nmap <leader>k :bnext<CR>

" Move to the previous buffer
nmap <leader>j :bprevious<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

" Make those debugger statements painfully obvious
au BufEnter *.rb syn match error contained "\<binding.pry\>"
au BufEnter *.rb syn match error contained "\<debugger\>"


set nobackup                    " don't want no backup files
set nowritebackup               " don't make a backup before overwriting a file
set noswapfile                  " no swap files"
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
set scrolloff=0                 " keep a 5 line padding when moving the cursor
set autoindent                  " indent on enter
set smartindent                 " do smart indenting when starting a new line
set shiftround                  " indent to the closest shiftwidth"

" clear search
nnoremap <leader>h :noh<cr>

" Don't continue comment mark after press 'o' when youre on a commented line
  au VimEnter * set formatoptions -=cro

" Selection {
" Change selected letters when write
  set selectmode=mouse,key

" Select with SHIFT + ARROW for Vim-noobs
  set keymodel=startsel,stopsel

" Enable select with mouse in insert mode
  set selection=exclusive

" Can move cursor past end of line, where there are no characters, in visualblock mode
  set virtualedit=block

" Visual selection automatically copied to clipboard
  set go+=a
"}

" Allow backspacing over everything in insert mode.
  set backspace=indent,eol,start
" Automatically enable mouse usage, but don't forget to feed him sometimes.
  set mouse=a
" Hide mouse when typing.
  set mousehide

highlight Pmenu ctermbg=238 gui=bold
set runtimepath^=~/.vim/bundle/ag
