"" for Development by booraik

" for Vundle
if filereadable(expand("~/.vim/bundle/Vundle.vim/README.md"))
    set nocompatible              " be iMproved, required
    filetype off                  " required
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    Plugin 'preservim/nerdtree'
    Plugin 'majutsushi/tagbar'
    Plugin 'junegunn/fzf.vim'
    "Plugin 'vim-airline/vim-airline'
    "Plugin 'vim-airline/vim-airline-themes'
    "Plugin 'shougo/neocomplete.vim'
    call vundle#end()            " required
    filetype plugin indent on    " required

    " for NERDTree
    map <C-n> :NERDTreeToggle<CR>
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

    " for Tagbar
    nmap <F8> :TagbarToggle<CR>

    " for airline
    "let g:airline#extensions#tabline#enabled = 1              " vim-airline 버퍼 목록 켜기
    "let g:airline#extensions#tabline#fnamemod = ':t'          " vim-airline 버퍼 목록 파일명만 출력
    "let g:airline#extensions#tabline#buffer_nr_show = 1       " buffer number를 보여준다
    "let g:airline#extensions#tabline#buffer_nr_format = '%s:' " buffer number format

    " for neocomplete: Not work on centos 7
    "let g:acp_enableAtStartup = 0
    "let g:neocomplete#enable_at_startup = 1
    "let g:neocomplete#enable_smart_case = 1
    "let g:neocomplete#sources#syntax#min_keyword_length = 3
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
