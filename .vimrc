set nocompatible              " be iMproved, required
if filereadable("/usr/share/vim/google/google.vim")
  source /usr/share/vim/google/google.vim  " Initialize some basic settings.
endif
filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

if filereadable($HOME . "/.vimrc_google")
  source $HOME/.vimrc_google
endif

Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'bling/vim-airline'
Plugin 'w0ng/vim-hybrid'
Plugin 'mbbill/undotree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'phleet/vim-mercenary'
Plugin 'mileszs/ack.vim'
Plugin 'unblevable/quick-scope'
Plugin 'endel/vim-github-colorscheme'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-vinegar'
Plugin 'uplus/vim-clang-rename'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<c-x>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/UltiSnips"
let g:UltiSnipsSnippetDirectories=["UltiSnips", $HOME."/UltiSnips"]

let g:NERDSpaceDelims = 1
let g:NERDTreeWinPos = "right"
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set go-=L " Removes left hand scroll bar

syntax on
map <C-n> :NERDTreeToggle<CR>
map <C-S-p> :CtrlPBuffer<CR>
set number

let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
set background=dark
colorscheme github

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

if has('gui_running')
  set guifont=Inconsolata-g\ 9
endif

set listchars=tab:>-     " > is shown at the beginning, - throughout
