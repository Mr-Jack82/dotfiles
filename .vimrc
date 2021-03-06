if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Minimalist Vim Plugin Manager
Plug 'junegunn/vim-plug'

" === Editing Plugins === "

" Automatically save changes to disk in Vim
Plug '907th/vim-auto-save'

" Enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Comment stuff out
Plug 'tpope/vim-commentary'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" A Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" auto-close plugin
Plug 'jiangmiao/auto-pairs'

" vim match-up: even better % fist_oncoming navigate and highlight
" matching words fist_oncoming modern matchit and matchparen replacement
Plug 'andymass/vim-matchup', { 'for':
    \  ['dart', 'eruby', 'html', 'javascript', 'json', 'xml']
    \}

" === Code completion, snippets === "

" Chained completion that works the way you want!
Plug 'lifepillar/vim-mucomplete'

" emmet for vim: https://emmet.io/
Plug 'mattn/emmet-vim', {'for': ['html', 'css']}

" Snippet plugin for vim/nvim that supports LSP/VSCode's snippet format.
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" A vim plugin for communicating with a language server
Plug 'natebosch/vim-lsc'

" === Seaching and Moving === "

" fzf ♡ vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Improved motion in Vim
Plug 'easymotion/vim-easymotion'

" Most Recently Used (MRU) Vim Plugin
Plug 'yegappan/mru'

" Tmux/Neovim movement integration
Plug 'christoomey/vim-tmux-navigator'

" General purpose asynchronous tree viewer written in Pure Vim script
Plug 'lambdalisue/fern.vim'

" === UI === "

" Colorschemes
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'

" Status line
Plug 'glepnir/spaceline.vim'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

" =============================================================
" ==> General
" =============================================================

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
" Avoid side effects when it was already reset.
if &compatible
  set nocompatible
endif

" Syntax highlighting
syntax on

" Set encoding
if &encoding ==# 'latin1' && !exists('$LANG')
    set encoding=utf-8
endif

scriptencoding utf-8

" Remap leader key to ','
let g:mapleader=','

" Enable line numbers
set number

" Show the line number relative to the line with the cursor in front of
" each line.
set relativenumber

" Show file title in terminal tab
set title

" Show (partial) command in the last line of the screen.
set showcmd

" Set show matching parenthesis
set showmatch

" ignore case if search pattern is all lowercase
set smartcase

" ignore case when searching
set ignorecase

" highlight search terms
set hlsearch

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" make <C-a> and <C-x> play well with zero-padded numbers (i.e. don't cosider
" them octal or hex)
set nrformats-=octal

" Disable bell for all events
set belloff=all

" Yank and paste with the system clipboard
if has ('unnamedplus')
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif

" Remember last cursor position.
augroup remember-cursor-position
  autocmd!
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
augroup END

" Make keyboard fast and reduce the delay in entering escape sequences
set ttyfast
set timeout timeoutlen=1000 ttimeoutlen=50

" Don't update the display while executing macros
set lazyredraw

" to change the cursor in different modes use this:
" from https://habr.com/ru/post/468265/
let &t_SI.="\e[5 q"         " SI = INSERT mode
let &t_SR.="\e[3 q"         " SR = REPLACE mode
let &t_EI.="\e[1 q"         " EI = NORMAL mode
" Where:
" 1 - is the flashing rectangle
" 2 - regular rectangle
" 3 - flashing underline
" 4 - just underline
" 5 - flashing vertical bar
" 6 - just a vertical bar

" Enable mouse support in all modes.
set mouse=a

" Enable loading the plugin files for specific file types.
filetype plugin indent on

" remember more commands and history
set history=1000

set undolevels=1000
if v:version >= 730
  set undofile
  set undodir=~/.vim/undodir
endif

" don't keep backup files
set nobackup

" do not write out changes via backup files
set nowritebackup

" No backup files
set noswapfile

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

" Setting up vertical split separator as in Tmux.
set fillchars+=vert:│

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=7

" Hides buffers instead of closing them.
set hidden

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=50

" Always show signcolumns.
set signcolumn=yes

" Search relative to current file + directory
" Provides tab-completion for all file-related tasks
set path+=**

" === TAB/Space settings === "
" default indentation: 4 spaces
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" Be smart
set smarttab

" Do smart autoindenting when starting a new line.
set smartindent

" do not wrap long lines by default
set nowrap

" Move through visual line normally only if they exists
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
xnoremap <expr> j (v:count == 0 && mode() !=# 'V') ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
xnoremap <expr> k (v:count == 0 && mode() !=# 'V') ? 'gk' : 'k'

" Don't highlight current cursor line
set nocursorline

" Enable true color support
" for more details see :h xterm-true-color
" NOTE: the "^[" is a single character. To insert it, press
" "Ctrl+v" and then "ESC" or use "\<Esc>" instead
if exists('+termguicolors')
  let &t_8f = "[38;2;%lu;%lu;%lum"
  let &t_8b = "[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" 256 color support
set t_Co=256

" Enable status line
set laststatus=2

" Show as much as possible of the last line.
set display=lastline

" Only two line for command line
set cmdheight=2

" Nice command completions
set wildmenu
set wildmode=full

" === Completion Settings === "

" A comma separated list of options for Insert mode completion
if exists('+completeopt')
  set completeopt=noinsert,menuone,noselect
endif

" Height of complete list
set pumheight=20

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Setting up ignores
set wildignore+=*.o,*.obj,*.pyc                " output objects
set wildignore+=*.png,*.jpg,*.gif,*.ico        " image format
set wildignore+=*.swf,*.fla                    " image format
set wildignore+=*.mp3,*.mp4,*.avi,*.mkv        " media format
set wildignore+=*.git*,*.hg*,*.svn*            " version control system
set wildignore+=*sass-cache*
set wildignore+=*.DS_Store
set wildignore+=log/**
set wildignore+=tmp/**

" Color Theme
colorscheme gruvbox
" For gruvbox specifically
set background=dark

" =============================================================
" ==> Moving around, tabs, windows and buffers
" =============================================================

" Open vimrc file with a few key strokes
nmap <leader>v :tabedit $MYVIMRC<CR>

" Allows you to save files you opened without write permissions via sudo
cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Easy expansion of the active file directory
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%
