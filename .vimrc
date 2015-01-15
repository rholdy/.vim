execute pathogen#infect()

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'othree/html5.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'ap/vim-css-color'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'vim-ruby/vim-ruby'

Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}

" Ruby stuff
set nocompatible
syntax enable
filetype plugin indent on
set autowrite

augroup myfiletypes
    autocmd!
    autocmd FileType slim,coffee,ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

" Ruby Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
highlight Pmenu ctermbg=238 gui=bold