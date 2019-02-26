set nocompatible              " be iMproved, required
if filereadable($HOME . "/.vimrc_google_early")
  source $HOME/.vimrc_google_early  " Initialize some basic settings.
endif
filetype plugin indent on
syntax on

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

if filereadable($HOME . "/.vimrc_google")
  source $HOME/.vimrc_google
endif

Bundle 'machakann/vim-swap'
Bundle 'tommcdo/vim-exchange'
Plugin 'gmarik/vundle'
Plugin 'kien/ctrlp.vim'
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
Plugin 'majutsushi/tagbar'
Plugin 'uplus/vim-clang-rename'
Plugin 'travisjeffery/vim-gotosymbol'
Plugin 'ericcurtin/CurtineIncSw.vim'
Bundle "vim-scripts/argtextobj.vim"
Bundle 'kana/vim-textobj-user'
Bundle "kana/vim-textobj-function"

Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'pdavydov108/vim-lsp-cquery'
Plugin 'ajh17/vimcompletesme'

Plugin 'nightsense/rusticated'
Plugin 'nightsense/stellarized'
Plugin 'nightsense/snow'
Plugin 'soft-aesthetic/soft-era-vim'

if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': "/home/fmayer/cquery_cache" },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
      autocmd FileType c setlocal omnifunc=lsp#complete
      autocmd FileType cpp setlocal omnifunc=lsp#complete
      autocmd FileType objc setlocal omnifunc=lsp#complete
      autocmd FileType objcpp setlocal omnifunc=lsp#complete
elseif executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_follow_symlinks = 1

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
" map <C-n> :NERDTreeToggle<CR>
map <C-S-p> :CtrlPBuffer<CR>
nmap <F8> :TagbarToggle<CR>
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
"    set guifont=Inconsolata-g\ 9
    set guifont=Hack\ 9
"    set guifont=FiraMono\ 9
endif

set listchars=tab:>-     " > is shown at the beginning, - throughout
set incsearch

" On pressing tab, insert 2 spaces
set expandtab
" show existing tab with 2 spaces width
set tabstop=2
set softtabstop=2
" when indenting with '>', use 2 spaces width
set shiftwidth=2

map <F6> :call CurtineIncSw()<CR>
nnoremap <silent> "" :registers "0123456789abcdefghijklmnopqrstuvwxyz*+.<CR>
