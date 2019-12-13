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

" ==========
" = VUNDLE =
" ==========

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim' " vundle
Plugin 'vimwiki/vimwiki' " vimwiki

call vundle#end()
filetype plugin indent on

" ===========
" = VIMWIKI =
" ===========

" use markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
