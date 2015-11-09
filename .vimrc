set shell=bash\ -i            " Set vims shell to be bash for compatibility with plugins like vim-instant-markdown
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
"Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
Plugin 'bufkill.vim'
Plugin 'docunext/closetag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Raimondi/delimitMate.git'
Plugin 'docker/docker' , {'rtp': '/contrib/syntax/vim/'}
Plugin 'othree/html5.vim'
Plugin 'juvenn/mustache.vim'
Plugin 'elzr/vim-json'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'nerdtree-ack'
Plugin 'scrooloose/syntastic'
Plugin 'kchmck/vim-coffee-script'
Plugin 'bling/vim-airline'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'groenewege/vim-less'
Plugin 'nvie/vim-flake8'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'YankRing.vim'
Plugin 'godlygeek/tabular'
Plugin 'wakatime/vim-wakatime'
" Plugin 'JamshedVesuna/vim-markdown-preview'
" Plugin 'svermeulen/vim-easyclip'
" Plugin 'majutsushi/tagbar'
" Plugin 'tpope/vim-haml'
" Plugin 'tpope/vim-abolish'
" Plugin 'tpope/vim-rails'
" Plugin 'tpope/vim-markdown'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on

" BUTSCHIS STUFF (aka stuff I understand)
if has("gui_running")
    set guioptions=aAce
    set guioptions-=T
    set guicursor=n-v-c:block-Cursor-blinkon0
    set guicursor+=i-ci:ver25-iCursor-blinkwait1-blinkon600-blinkoff400
    set noballooneval

    set guifont=Meslo\ LG\ S\ for\ Powerline:h11
    
    colorscheme slate2
endif
" END OF BUTSCHIS STUFF

" From http://stevelosh.com/blog/2010/09/coming-home-to-vim/
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

set encoding=utf-8
set fileencoding=utf-8
set scrolloff=3
" Typewriter scrollmode. Cursor stays in the middle of the window
"set scrolloff=999
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
"set wildmode=list:longest
set wildmode=longest:list,full
" Ignore compiled files
set wildignore=*.o,*~,*.pyc
set visualbell
set cursorline
hi iCursor guifg=White guibg=White

"set noantialias

set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile

let mapleader = ","

" Airline
"let g:airline_theme = 'wombat'                       " Airline colorscheme
let g:airline_powerline_fonts = 1                    " Fancy symbols
let g:airline#extensions#tabline#enabled = 1         " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'     " Show just the filename
let g:airline#extensions#tabline#tab_nr_type = 1     " Show buffer #, not # of splits
let g:airline#extensions#tabline#show_tab_nr = 1     " Show buffer # in tabline
let g:airline#extensions#tabline#show_tab_type = 1   " Show the tab type
let g:airline#extensions#tabline#buffer_idx_mode = 1 " Show buffer index

" Leader mappings
" Turn of search result highlighting
nnoremap <leader><space> :noh<cr>

" Compile LaTeX and open in Preview
nnoremap <leader>r :! rubber --pdf % ; find . -name *.pdf -exec open {} \;<cr><cr>

" Open a split window
nnoremap <leader>w <C-w>v<C-w>l

nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>l <Plug>AirlineSelectNextTab
nmap <leader>h <Plug>AirlineSelectPrevTab

" Quickly edit/reload the vimrc file
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Insert ipdb python breakpoint
nnoremap <leader>i oimport ipdb; ipdb.set_trace()<esc>==:w<cr>

" Use this to kill buffer leaving windows intact
nnoremap <leader>bd :BD<CR>
nnoremap <leader>f :b#<CR>

" Ctrl
nnoremap <leader>t :CtrlPMixed <CR>

" Ack
"nnoremap <leader>a :Ack 

" Ag
nnoremap <leader>a :Ag 

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Install YAJL first
" brew install yajl
au FileType json setlocal equalprg=json_reformat

nnoremap / /\v
vnoremap / /\v
set gdefault " Always use /g flag on :s substitutions
set showmatch
nnoremap <tab> %
vnoremap <tab> %

set wrap
set linebreak
set textwidth=79
set formatoptions=qrn1

let NERDTreeIgnore = ['\.pyc$', '\~$']

" Mapping some convienience window movement commands
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" Make delete single characters not insert into default register
nnoremap x "_x


" Delete without putting it into default register
nnoremap <leader>d "_d
nnoremap <leader>D "_D
vnoremap <leader>d "_d

" Visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv 

"Automatically source vimrc on changes
":au! BufWritePost $MYVIMRC source $MYVIMRC

" Use the arrows to something usefull
"nnoremap<right> :bn<cr>
"nnoremap<left> :bp<cr>

" Butschis mappings
" -----------------
" Escaping from Insert Mode
:inoremap kj <Esc>
" Escaping from Insert Mode and save
:inoremap kw <Esc> :w<CR>
" Jumping to end of line and keep editing
:inoremap jk <Esc> A
" Return within parenthesis
:inoremap <C-CR> <CR><CR><Esc>ki<tab>
" Insert newline without entering insert mode
:nnoremap <CR> mao<Esc>`a
:nnoremap <S-CR> maO<Esc>`a


" Move lines around
" Funny enough the <A-j> doesn't work but the output of that combination does
" German keyboard layout
"nnoremap º :m+<CR>==
"nnoremap ∆ :m-2<CR>==
"inoremap º <Esc>:m+<CR>==gi
"inoremap ∆ <Esc>:m-2<CR>==gi
"vnoremap º :m'>+<CR>gv=gv
"vnoremap ∆ :m-2<CR>gv=gv

" Swedish keyboard layout
nnoremap √ :m+<CR>==
nnoremap ª :m-2<CR>==
inoremap √ <Esc>:m+<CR>==gi
inoremap ª <Esc>:m-2<CR>==gi
vnoremap √ :m'>+<CR>gv=gv
vnoremap ª :m-2<CR>gv=gv

au BufNewFile,BufReadPost *.coffee setl shiftwidth=4 expandtab

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

set noshowmode

" GitGutter
highlight link GitGutterAdd DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete

" From https://github.com/airblade/dotvim/blob/master/vimrc
set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.
"autocmd InsertEnter * :setlocal nohlsearch " Turn off search highlighting for insert mode
"autocmd InsertLeave * :setlocal hlsearch   " Turn it back on

set nobackup                      " No backups.
set nowritebackup                 " No backups.
set noswapfile                    " No swap files; more hassle than they're worth.

set autoread                      " Automatically re-read files changed outside Vim.
set updatetime=750                " Do things when I stop typing for three-quarters of a second.


" EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_keys = 'asdfghjklöqwertyuiopzxcvbnm,.' " Use nicer keys

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key binding.
 "`s{char}{label}`
"nmap s <Plug>(easymotion-s)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-s2)
vmap s <Plug>(easymotion-s2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
