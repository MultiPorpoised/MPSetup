" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
if isdirectory(expand('$HOME/.vim/bundle/Vundle.vim'))
  call vundle#begin()
  " alternatively, pass a path where Vundle should install plugins
  "call vundle#begin('~/some/path/here')

  " let Vundle manage Vundle, required
  Plugin 'VundleVim/Vundle.vim'

  " Extra plugins, which can be configured with Vundle commands
  " like :PluginInstall
  Plugin 'tpope/vim-sensible'
  Plugin 'altercation/vim-colors-solarized'
  Plugin 'vim-airline/vim-airline'
  Plugin 'vim-airline/vim-airline-themes'
  Plugin 'scrooloose/nerdcommenter'
  Plugin 'google/vim-maktaba'
  Plugin 'google/vim-codefmt'

  " All of your Plugins must be added before the following line
  call vundle#end()
else
  echomsg 'Vundle is not installed. You can install Vundle from'
      \ 'https://github.com/VundleVim/Vundle.vim'
endif
filetype plugin indent on    " required
" End Vundle

" Basic configs
set tabstop=4
set shiftwidth=4
set expandtab

set background=dark
set number
set cursorline
set hlsearch

set belloff=all

set encoding=utf-8
set ignorecase
set smartcase

set list listchars=tab:»\ ,trail:°

syntax enable

" Solarized config
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

" Set leader to comma
let mapleader=','
set timeoutlen=300

" Move based on screen
function! ScreenMovement(movement)
   if &wrap
      return "g" . a:movement
   else
      return a:movement
   endif
endfunction
onoremap <silent> <expr> j ScreenMovement("j")
onoremap <silent> <expr> k ScreenMovement("k")
onoremap <silent> <expr> 0 ScreenMovement("0")
onoremap <silent> <expr> ^ ScreenMovement("^")
onoremap <silent> <expr> $ ScreenMovement("$")
nnoremap <silent> <expr> j ScreenMovement("j")
nnoremap <silent> <expr> k ScreenMovement("k")
nnoremap <silent> <expr> 0 ScreenMovement("0")
nnoremap <silent> <expr> ^ ScreenMovement("^")
nnoremap <silent> <expr> $ ScreenMovement("$")

" write and quit
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

" find/replace selected word
nnoremap <Leader>s :%s/\<<C-r><C-w>\>//g<Left><Left>

" clear highlighting
nnoremap <Ctrl-l> :noh<CR><C-l>

" Don't jump on *
nnoremap * :keepjumps normal! mi*`i<CR>

" misc
inoremap jk <Esc>
vnoremap q <Esc>
cnoremap jk <C-C>
nnoremap ; :
vnoremap ; :
