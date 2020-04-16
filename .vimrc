""" for Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
call vundle#end()            " required
filetype plugin indent on    " required

""" for NERDTree
call vundle#begin()
Plugin 'preservim/nerdtree'
call vundle#end()
map <C-n> :NERDTreeToggle<CR>

""" for Tagbar
Plugin 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
