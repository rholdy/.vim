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
Plugin 'garbas/vim-snipmate'
Plugin 'airblade/vim-gitgutter'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}
Plugin 'tomtom/tcomment_vim'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'kien/ctrlp.vim'
Plugin 'gcmt/wildfire.vim'
let g:ctrlp_extensions = ['funky']

Plugin 'tacahiroy/ctrlp-funky'

Plugin 'Lokaltog/vim-easymotion'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1
map <SPACE> <Plug>(wildfire-fuel)
let g:wildfire_objects = {
    \ "*" : ["i'", 'i"', "i)", "i]", "i}"]
    \ }

nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gd :Gdiff<CR>
nnoremap <silent> <leader>gc :Gcommit<CR>
nnoremap <silent> <leader>gb :Gblame<CR>
nnoremap <silent> <leader>ga :Git add .<CR>
nnoremap <silent> <leader>gp :Git push<CR>

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

" Keybindings
map <F3> :NERDTree

augroup myfiletypes
    autocmd!
    autocmd FileType slim,coffee,ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

" Ruby Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
highlight Pmenu ctermbg=238 gui=bold
