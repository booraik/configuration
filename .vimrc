"" for Development by booraik

" for Vundle
if filereadable(expand("~/.vim/bundle/Vundle.vim/README.md"))
    set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'preservim/nerdtree'
    Plugin 'machakann/vim-highlightedyank'
    call vundle#end()            " required

    " for NERDTree
    map <C-n> :NERDTreeToggle<CR>
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
endif

" for fzf
set rtp+=~/.fzf

" buffer navigation
nnoremap <F5> :bprevious!<Enter>
nnoremap <F6> :bnext!<Enter>

" for cscope
set csprg=/usr/bin/cscope
set nocsverb
set csverb
set csto=0
set cst
set nocscopeverbose

if filereadable("/home/src/cscope.out")
    cs add /home/src/cscope.out
endif

func! Csc()
    let name = expand("<cword>")
    new
    exe "cs find c ".name
    if getline(1) == ""
        exe "q!"
    endif
endfunc
nmap ,csc :call Csc()<cr>

func! Cse()
    let name = expand("<cword>")
    exe "cs find e ".name
endfunc
nmap ,cse :call Cse()<cr>

" for ctags.
set tags+=./tags
