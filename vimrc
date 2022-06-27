"" added by booraik

" Custon Section.
set cindent         "C Style Auto Indentation
set smartindent     "Smart Auto Indentation
set autoindent      "Type open Brackets, close brackets automatically
set number          "Show Line Number
set showmatch       "Blink Cursor When Close Brackets
set nowrapscan      "Do Not Move When Search string
set ruler           "Show Current Position in Right Bottom
set hlsearch        "Highlighting Search String
syntax on           "Use Syntax Accent On
filetype on         "Set Syntax Accent On ( File Type )
set laststatus=2    "Set Status in Bottom
set history=100     "Set max UNDO count
set mousehide       "Set hide mouse when typing
set ignorecase      "Ignore case when search string
set textwidth=120

" for gVim.
"colors torte       "Set background color == dark
"set nobk           "No create [~] backup file
"set nobackup       "No create backup file
"set noswapfile     "No create [.swp] backup file
" Change Text Color.
"set background=dark     "Set Background Color( Comment Color )
highlight Comment term=bold cterm=bold ctermfg=4
highlight SpecialKey term=bold cterm=bold ctermfg=4
highlight Directory term=bold cterm=bold ctermfg=4
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
set encoding=utf8
set fileencodings=utf-8,cp949

"Tab Section.
set shiftwidth=4    "Auto Indentation
set tabstop=4       "Tab Count
set expandtab       "Replace Tab to Space. Do Not With softtabstop
"Tab index is 2 for web content
autocmd FileType html setlocal ts=2 sw=2 expandtab
autocmd FileType javascript setlocal ts=2 sw=2 expandtab

"Only Use Tab in Makefile, *.mk, *.mak, *.dsp, *.min.
au BufNewFile,BufRead
    \ [mM]akefile,[mM]akefile*,GNUmakefile,*.mk,*.mak,*.dsp,*.min
    \ set noexpandtab

