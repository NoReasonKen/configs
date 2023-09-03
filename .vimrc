"Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
"Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

let mapleader='`'
"===========================================================
syntax on
filetype plugin on "detect file type
filetype plugin indent on "do indent by corresponding file type

"fix
set backspace=indent,eol,start "fix problems that backspace do nothing during insert mode

"mode
set nocompatible "disable vi compatibe to enable some advance feature

"coding
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
set background=dark "set theme
set t_Co=256 "set color number supported

"fold
autocmd FileType json setlocal foldmethod=syntax

"===========================================================
" set color scheme
colorscheme molokai
"===========================================================
" Vundle Setting 
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/vundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/vundle
  let iCanHazVundle=0
endif

set rtp+=~/.vim/vundle
call vundle#rc('~/.vim/vundle')
"===========================================================
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
"===========================================================
" original repos on github
Bundle 'Lokaltog/vim-easymotion'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'airblade/vim-gitgutter'
Bundle 'scrooloose/nerdtree'
Bundle 'majutsushi/tagbar'
Bundle 'Valloric/YouCompleteMe'
Bundle 'mhinz/vim-startify'
Bundle 'jiangmiao/auto-pairs'
Bundle 'tpope/vim-fugitive'
Bundle 'ctrlpvim/ctrlp.vim'

"Bundle 'terryma/vim-multiple-cursors'
"Bundle 'Chiel92/vim-autoformat'
"Bundle 'tomtom/tcomment_vim'
"Bundle 'garbas/vim-snipmate'
"Bundle 'MarcWeber/vim-addon-mw-utils'  "vim-snimate lib
"Bundle 'tomtom/tlib_vim'  "vim-snimate lib
"Bundle 'honza/vim-snippets' "vim-snimate lib , support other language
"=======================================================
"easymotion setting
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_leader_key = ','
let g:EasyMotion_startofline = 0	"keep cursor column when JK motion
let g:EasyMotion_smartcase = 1
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

"========================================================
"airline setting
set laststatus=2
let g:airline_focuslost_inactive=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['tagbar', 'nerdtree']
let g:airline#extensions#tabline#ignore_bufadd_pat = 'tagbar|nerd_tree'
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#branch#vcs_checks = ['untracked', ''] "fix a bug that dirty sign garbled in fugitive line
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#ycm#error_symbol = 'E:'
let g:airline#extensions#ycm#warning_symbol = 'W:'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline_theme='dark'
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader><leader> <Plug>AirlineSelectNextTab
nmap <leader>q :bd<CR>
"=========================================================
"nerdtree setting
"au VimEnter * NERDTree
let NERDTreeWinPos='left'
let NERDTreeWinSize=30
map <F2> :NERDTreeToggle<CR>
"==========================================================
"tagbar setting
"au VimEnter * Tagbar
let g:tagbar_ctags_bin='ctags'
let g:tagbar_width=30
map <F3> :Tagbar<CR>
" autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen() 
"===========================================================
" YouCompleteMe setting
let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_max_diagnostics_to_display = 0
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_balloons = 1
"===========================================================
" ctrlp setting
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMRU'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip 

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"===========================================================
" numberpad mapping
inoremap <Esc>Oq 1
inoremap <Esc>Or 2
inoremap <Esc>Os 3
inoremap <Esc>Ot 4
inoremap <Esc>Ou 5
inoremap <Esc>Ov 6
inoremap <Esc>Ow 7
inoremap <Esc>Ox 8
inoremap <Esc>Oy 9
inoremap <Esc>Op 0
inoremap <Esc>On .
inoremap <Esc>OQ /
inoremap <Esc>OR *
inoremap <Esc>Ol +
inoremap <Esc>OS -
inoremap <Esc>OM <Enter>
