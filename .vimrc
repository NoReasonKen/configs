"Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
"Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let mapleader='`'
"===========================================================
syntax on
filetype plugin on "detect file type
filetype plugin indent on "do indent by corresponding file type

"disable auto line break for comments for all file type
autocmd FileType * set formatoptions-=c

"fix
set backspace=indent,eol,start "fix problems that backspace do nothing during insert mode

"mode
set nocompatible "disable vi compatibe to enable some advance feature

"coding
scriptencoding utf-8
set encoding=utf-8
set fileencodings=utf-8,utf-16,big5,gbk,euc-jp,cp950

"indent
set tabstop=4 "modify width of tab
set shiftwidth=4 "affect width of >>,<<,== and autoindent
set expandtab
"set smartindent "indent once more for {  }
"set cindent "indent rules base on c syntax

"search
set ic "ignore case
set smartcase "make search case sensitive if search patterns contains capital alphabets
set hlsearch "highlight match words
set incsearch "move cursor to match words while typing

"mouse
set mouse=a "make mouse available in all mode
set mousemodel=extend "active <shift + L-mouse-click> to search patterns

"interface
set cursorline "highlight current line
set ruler "show coordinate at right bottom corner
set number "show line number
set scrolloff=5 "reserve lines while scrolling
set showmode "show mode(ex: insert, normal, visual, command...)
set showcmd "show current command
set wildmenu "show menu while activating command complete
set wildmode=list:longest,full
"set sildmenu mode, two options for first and second tab click:
"	1. complete to lingest possible and list candidates
"	2. select full command

"theme and color
"set background=dark "set theme
set t_Co=256 "set color number supported

"lists unprintable if 'set list'
set listchars=tab:⇤–⇥,space:·,trail:·,precedes:⇠,extends:⇢,nbsp:×

"===========================================================
" set color scheme
colorscheme molokai
" transparant background
hi NonText ctermbg=none
hi Normal guibg=NONE ctermbg=NONE
"===========================================================
" Vundle Setting
if filereadable(expand("~/.vim/plugins.vim"))
    source ~/.vim/plugins.vim
endif

"===========================================================
" Custom Commands
if filereadable(expand("~/.vim/commands.vim"))
    source ~/.vim/commands.vim
endif

