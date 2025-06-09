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
"Bundle 'vim-airline/vim-airline-themes'
"Bundle 'airblade/vim-gitgutter'
"Bundle 'scrooloose/nerdtree'
"Bundle 'majutsushi/tagbar'
"Bundle 'Valloric/YouCompleteMe'
"Bundle 'mhinz/vim-startify'
Bundle 'jiangmiao/auto-pairs'
"Bundle 'tpope/vim-fugitive'
"Bundle 'ctrlpvim/ctrlp.vim' fzf is a better replacement
Bundle 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Bundle 'junegunn/fzf.vim'
Plugin 'dense-analysis/ale'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'haya14busa/vim-poweryank'
Plugin 'mtdl9/vim-log-highlighting'
Bundle 'kshenoy/vim-signature'
Bundle 'machakann/vim-highlightedyank'

"Bundle 'terryma/vim-multiple-cursors'
"Bundle 'Chiel92/vim-autoformat'
"Bundle 'tomtom/tcomment_vim'
"Bundle 'garbas/vim-snipmate'
"Bundle 'MarcWeber/vim-addon-mw-utils'  "vim-snimate lib
"Bundle 'tomtom/tlib_vim'  "vim-snimate lib
"Bundle 'honza/vim-snippets' "vim-snimate lib , support other language
"=======================================================
"easymotion settings
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_startofline = 0	"keep cursor column when JK motion
let g:EasyMotion_smartcase = 1

map <leader>f <Plug>(easymotion-s2)

" (^[OA,^[OB,^[OC,^[OD]) are escape code of arrow keys, means (up,down,left,right) respectively
" If `+f is work but not `+<arrow key>, updating vim to v9.x might fix this
noremap <Leader>OD <Plug>(easymotion-linebackward)
noremap <Leader>OC <Plug>(easymotion-lineforward)
noremap <Leader>OB <Plug>(easymotion-j)
noremap <Leader>OA <Plug>(easymotion-k)

"========================================================
"airline settings
set laststatus=2
let g:airline_focuslost_inactive=1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#vcs_checks = ['untracked', ''] "fix a bug that dirty sign garbled in fugitive line
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
"let g:airline#extensions#tabline#keymap_ignored_filetypes = ['tagbar', 'nerdtree']
"let g:airline#extensions#tabline#ignore_bufadd_pat = 'tagbar|nerd_tree'
"let g:airline#extensions#ycm#enabled = 1
"let g:airline#extensions#ycm#error_symbol = 'E:'
"let g:airline#extensions#ycm#warning_symbol = 'W:'
nnoremap <leader>1 <Plug>AirlineSelectTab1
nnoremap <leader>2 <Plug>AirlineSelectTab2
nnoremap <leader>3 <Plug>AirlineSelectTab3
nnoremap <leader>4 <Plug>AirlineSelectTab4
nnoremap <leader>5 <Plug>AirlineSelectTab5
nnoremap <leader>6 <Plug>AirlineSelectTab6
nnoremap <leader>7 <Plug>AirlineSelectTab7
nnoremap <leader>8 <Plug>AirlineSelectTab8
nnoremap <leader>9 <Plug>AirlineSelectTab9
nnoremap <leader>- <Plug>AirlineSelectPrevTab
nnoremap <leader><leader> <Plug>AirlineSelectNextTab
nnoremap <leader>q :bd<CR>
"=========================================================
"nerdtree settings
"au VimEnter * NERDTree
"let NERDTreeWinPos='left'
"let NERDTreeWinSize=40
"let NERDTreeShowHidden=1
"map <F2> :NERDTreeToggle<CR>
"==========================================================
"tagbar settings
"au VimEnter * Tagbar
"let g:tagbar_ctags_bin='ctags'
"let g:tagbar_width=30
"map <F3> :Tagbar<CR>
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
"===========================================================
" YouCompleteMe settings
"let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_max_diagnostics_to_display = 0
"let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '⚠'
"let g:syntastic_enable_balloons = 1
"===========================================================
" fzf.vim settings
nnoremap <C-p> :History<CR>
set <M-t>=t
nnoremap <M-t> :Files<CR>
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%,<70(up,40%)', 'ctrl-/']
" Re-define Rg to allow path as second argument (e.g. :Rg export ~/.zsh)
command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   "rg --column --line-number --no-heading --color=always --smart-case ".<q-args>,
    \       {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/vundle/fzf.vim/bin/preview.sh {}']},
    \       <bang>0
    \ )
"===========================================================
" ale settings
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
"===========================================================
" vim-log-highlighting settings
" Use custom level identifiers
"autocmd Syntax log syn keyword logLevelError error
" Remove highlighting for URLs
"autocmd Syntax log syn clear logUrl
"===========================================================
" vim-highlightedyank
" Use reverse color scheme instead of single color
highlight HighlightedyankRegion cterm=reverse gui=reverse
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

