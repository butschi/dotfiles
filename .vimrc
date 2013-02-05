call pathogen#infect()
syntax on
filetype plugin indent on
set nocompatible  " We don't want vi compatibility.

" BUTSCHIS STUFF (aka stuff I understand)

if has("gui_running")
set guioptions=aAce
endif
colorscheme slate2
" END OF BUTSCHIS STUFF

" From http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set fileencoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
hi iCursor guifg=White guibg=White
set guicursor=n-v-c:block-Cursor-blinkon0
set guicursor+=i-ci:ver25-iCursor-blinkwait1-blinkon600-blinkoff400

"set noantialias

set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

set noballooneval

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1


" Mapping some convienience window movement commands
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>a :Ack 

"Automatically source vimrc on changes
:au! BufWritePost $MYVIMRC source $MYVIMRC

" Compile LaTeX and open in Preview
nnoremap <leader>r :! rubber --pdf % ; find . -name *.pdf -exec open {} \;<cr><cr>

" Use the arrows to something usefull
"nnoremap<right> :bn<cr>
"nnoremap<left> :bp<cr>

" Use this to kill buffer leaving windows intact
nnoremap <leader>d :BD<CR>

" Escaping from Insert Mode
:inoremap kj <Esc>
:inoremap kw <Esc> :w<CR>

" Move lines around
" Funny enough the <A-j> doesn't work but the output of that combination does
nnoremap º :m+<CR>==
nnoremap ∆ :m-2<CR>==
inoremap º <Esc>:m+<CR>==gi
inoremap ∆ <Esc>:m-2<CR>==gi
vnoremap º :m'>+<CR>gv=gv
vnoremap ∆ :m-2<CR>gv=gv

au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 expandtab

if executable('coffeetags')
  let g:tagbar_type_coffee = {
        \ 'ctagsbin' : 'coffeetags',
        \ 'ctagsargs' : '',
        \ 'kinds' : [
        \ 'f:functions',
        \ 'o:object',
        \ ],
        \ 'sro' : ".",
        \ 'kind2scope' : {
        \ 'f' : 'object',
        \ 'o' : 'object',
        \ }
        \ }
endif
