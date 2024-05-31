" ============
" = SETTINGS =
" ============

set nocompatible " be iMproved

filetype plugin indent on

set tabstop=4 " tab displayed as 4 spaces
set expandtab " and is 4 spaces

set autoindent   " automatically indent
set shiftwidth=4 " by 4 spaces

syntax on " syntax highlighting

set mouse-=a " no mouse

set number " show line numbers

cnoremap <Down> <Nop>
cnoremap <Left> <Nop>
cnoremap <Right> <Nop>
cnoremap <Up> <Nop>

inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <Up> <Nop>

nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>
nnoremap <Up> <Nop>

vnoremap <Down> <Nop>
vnoremap <Left> <Nop>
vnoremap <Right> <Nop>
vnoremap <Up> <Nop>

" ==========
" = VUNDLE =
" ==========

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " vundle
Plugin 'tpope/vim-fugitive' " git
Plugin 'dense-analysis/ale'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'lervag/vimtex'

call vundle#end()
filetype plugin indent on

let g:vimtex_view_method = 'mupdf'
