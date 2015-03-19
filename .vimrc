execute pathogen#infect()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'othree/html5.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-ruby/vim-ruby'
Plugin 'airblade/vim-gitgutter'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'tomtom/tcomment_vim'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'kien/ctrlp.vim'
Plugin 'gcmt/wildfire.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-scripts/HTML-AutoCloseTag'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'ggreer/the_silver_searcher'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'kien/rainbow_parentheses.vim'

let g:ctrlp_extensions = ['funky']

Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" ------ EasyTags stuff
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" ------- Mappings -------

map :Q :q
map :W :w

map <SPACE> <Plug>(wildfire-fuel)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}"]
    \ }

cal wildfire#triggers#Add("<ENTER>", {
    \ "html,xml" : ["at", "it"],
    \ })")"']}

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>ga :Git add .<CR>
nnoremap <silent> <leader>gp :Git push<CR>
map <F3> :NERDTree<CR>
map <C-h> ^
map <C-j> GG
map <C-k> gg
map <C-l> $
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Ruby stuff
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

" ----- Rainbow Parens stuff
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)

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
" Automatically jump to end of text thats pasted/yanked, feels inuitively.
  noremap <silent> y y`]
  noremap <silent> p p`]

highlight Pmenu ctermbg=238 gui=bold
