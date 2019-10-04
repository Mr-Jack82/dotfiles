
"************************************************************************
"" Vim-plug core
"************************************************************************
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

let g:vim_bootstrap_langs = "html,javascript,php,python,typescript"
let g:vim_bootstrap_editor = "vim"				" nvim or vim

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" Required:
call plug#begin(expand('~/.vim/plugged'))

"************************************************************************
"" Plug install packages
"************************************************************************
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/grep.vim'
Plug 'vim-scripts/CSApprox'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'Yggdroot/indentLine'
Plug 'avelino/vim-bootstrap-updater'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse

" My plugins
Plug 'wellle/targets.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'bronson/vim-trailing-whitespace'
Plug 'mhinz/vim-startify'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'valloric/youcompleteme'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-repeat'
" Plug 'scrooloose/syntastic'

if isdirectory('/usr/local/opt/fzf')
  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
  Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

"" Vim-Session
"Plug 'xolox/vim-misc'
"Plug 'xolox/vim-session'

"" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

"" Tabline for lightline and statusline
"Plug 'zefei/vim-wintabs'
"Plug 'zefei/vim-wintabs-powerline'

"Plug 'itchyny/lightline.vim'

"" Color
" colorschemes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim'
Plug 'troyfletcher/vim-colors-synthwave'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'kaicataldo/material.vim'
Plug 'fenetikm/falcon'
Plug 'tomasr/molokai'

"*****************************************************************************
"" Custom bundles
"*****************************************************************************

" html
"" HTML Bundle
Plug 'hail2u/vim-css3-syntax'
Plug 'gorodinskiy/vim-coloresque'
Plug 'jnurmine/Zenburn'
Plug 'tpope/vim-haml'
Plug 'mattn/emmet-vim'


" javascript
"" Javascript Bundle
Plug 'jelera/vim-javascript-syntax'


" php
"" PHP Bundle
Plug 'arnaud-lb/vim-php-namespace'


" python
"" Python Bundle
Plug 'davidhalter/jedi-vim'
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


" typescript
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'


"*****************************************************************************
"*****************************************************************************

"" Include user's extra bundle
if filereadable(expand("~/.vimrc.local.bundles"))
  source ~/.vimrc.local.bundles
endif

call plug#end()

" Required
filetype plugin indent on

" Enable loading the indent file for specific file types
filetype plugin on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"
"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bomb
set binary
set ttyfast

" NO --INSERT-- messages
set noshowmode

" When change some text delete the source without affecting the normal
" registers ("_ is a "black hole" register).
nnoremap c "_c

"" Fix backspace indent
set backspace=indent,eol,start
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

"Ivisible character colors
highlight NonText guifg=#5f5fff
highlight SpecialKey guifg=#5f5fff

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

" Repeat latest f, t, F or T in opposite direction
noremap \ ,

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

"" Directories for swp files
set nobackup
set noswapfile

set fileformats=unix,dos,mac

" This will cause Vim to treat all numerals as decimal (for ctrl-a/ctrl-x)
set nrformats=

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
"let g:session_directory = "~/.vim/session"
"let g:session_autoload = "no"
"let g:session_autosave = "no"
"let g:session_command_aliases = 1

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
" Enable syntax highlighting.
syntax on

" Show the cursor position.
set ruler

" don't redraw when don't have to.
set lazyredraw

" Remove timeout when hitting escape.
set timeoutlen=1000 ttimeoutlen=0

" Shows numbers in front of each line.
set number

" Show the line number relative to the line with the cursor in front of
" each line.
set relativenumber

" If on, Vim will wrap long lines at a character.
" set linebreak

" Show (partial) command in status line.
set showcmd

" Enable mouse support in all modes.
set mouse=a

" Shows a menu when using tab completion.
set wildmenu
set wildmode=full

" Copy indent from current line when starting a new line.
set autoindent

" Do smart autoindenting when starting a new line.
set smartindent

" Keep 1000 items in the history.
set history=1000
set termguicolors
highlight lCursor guifg=NONE guibg=Cyan

let no_buffers_menu=1
if !exists('g:not_finish_vimplug')
  colorscheme palenight
endif
"silent! colorscheme palenight

set mousemodel=popup
set t_Co=256
set guioptions=egmrti
set guifont=Monospace\ 10

if has('gui_running')
  if has('gui_mac') || has('gui_macvim')
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  let g:indentLine_enabled = 1
  let g:indentLine_concealcursor = 0
  let g:indentLine_char = '┆'
  let g:indentLine_faster = 1

  if $COLORTERM == 'gnome-terminal'
    set term=gnome-256color
  else
    if $TERM == 'xterm'
      set term=xterm-256color
    endif
  endif
  
endif


if &term =~ '256color'
  set t_ut=
endif

"" Disable the blinking cursor.
set guicursor=a:blinkon0

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5

"" Status bar
"set laststatus=2
set cmdheight=2

"" Use modeline overrides
set modeline
set modelines=10

"" Undo - Save beyond closing Persistent undo
set undofile                        " Allow persistent undo.
set undodir=~/.vim/undodir          " Store undo files here. Make the folder.
set undoreload=10000
set undolevels=100

set title
set titleold="Terminal"
set titlestring=%F

" Change shape of Vim cursor onto vertical line in insert mode
if has('autocmd')
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists('*fugitive#statusline')
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
"let g:falcon_airline = 1
"let g:airline_theme = 'falcon'
"let g:airline_theme = 'powerlineish'
let g:airline_theme = 'kolor'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

if has('syntastic')
    let g:airline#extensions#syntastic#enabled = 1
endif

"*****************************************************************************
"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"" ALE
let g:ale_sign_warning = '⚠'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
nmap ]w :ALENextWrap<CR>
nmap [w :ALEPreviousWrap<CR>
nmap <Leader>f <Plug>(ale_fix)
augroup VimDiff
  autocmd!
  autocmd VimEnter,FilterWritePre * if &diff | ALEDisable | endif
augroup END

"*****************************************************************************
"" ALE integration for statusline
"*****************************************************************************
"function! LinterStatus() abort
    "let l:counts = ale#statusline#Count(bufnr(''))

    "let l:all_errors = l:counts.error + l:counts.style_error
    "let l:all_non_errors = l:counts.total - l:all_errors

    "return l:counts.total == 0 ? 'OK' : printf(
    "\   '%dW %dE',
    "\   all_non_errors,
    "\   all_errors
    "\)
"endfunction

"set statusline=%{LinterStatus()}
"*****************************************************************************

"*****************************************************************************
"" ALE integration for lightline
"*****************************************************************************
"let g:lightline = {
      "\ 'colorscheme': 'PaperColor light',
      "\ 'active': {
"\   'left': [['mode', 'paste'], ['filename', 'modified']],
"\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
"\ },
"\ 'component_expand': {
"\   'linter_warnings': 'LightlineLinterWarnings',
"\   'linter_errors': 'LightlineLinterErrors',
"\   'linter_ok': 'LightlineLinterOK'
"\ },
"\ 'component_type': {
"\   'readonly': 'error',
"\   'linter_warnings': 'warning',
"\   'linter_errors': 'error'
"\ },
"\ }

" function! LightlineLinterWarnings() abort
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
" endfunction

" function! LightlineLinterErrors() abort
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
" endfunction

" function! LightlineLinterOK() abort
"   let l:counts = ale#statusline#Count(bufnr(''))
"   let l:all_errors = l:counts.error + l:counts.style_error
"   let l:all_non_errors = l:counts.total - l:all_errors
"   return l:counts.total == 0 ? '✓ ' : ''
" endfunction

" autocmd User ALELint call s:MaybeUpdateLightline()

" " Update and show lightline but only if it's visible (e.g., not in Goyo)
" function! s:MaybeUpdateLightline()
"   if exists('#lightline')
"     call lightline#update()
"   end
" endfunction
"*****************************************************************************

"" NERDTree configuration
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
nnoremap <silent> <F2> :NERDTreeFind<CR>
map <C-y> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1     " Show hidden files in NERDTree

" Youcompleteme global config file
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" grep.vim
nnoremap <silent> <leader>f :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

" vimshell.vim
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt =  '$ '

" Enable matchit plugin
packadd! matchit

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wrapmargin=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"" Autocmd Rules
"*****************************************************************************
"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Automatically cd into the directory that the file is in
augroup vimrc-autocd-into-directory
    autocmd!
autocmd BufEnter * execute "chdir ".escape(expand("%:p:h"), ' ')
augroup END

" Change directory to the file being edited.
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

"" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

"" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

set autoread

"*****************************************************************************
"" Mappings
"*****************************************************************************

"" EasyAlign
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Lunch easymotion
map <Leader> <Plug>(easymotion-prefix)
" When SaveSession is active use this
"map l <Plug>(easymotion-s)

"" EMMET config
" redefine trigger key from '<c-y>,'
let g:user_emmet_leader_key=','

" Exiting from Insert mode to Normal mode quick and ease
"inoremap kj <Esc>

"" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
"nnoremap <leader>so :OpenSession<Space>
"nnoremap <leader>ss :SaveSession<Space>
"nnoremap <leader>sd :DeleteSession<CR>
"nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"" Opens an edit command with the path of the currently edited file filled in
noremap <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

"" Opens a tab edit command with the path of the currently edited file filled
noremap <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

"" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>

"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

" snippets
let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger='<tab>'
let g:UltiSnipsJumpBackwardTrigger='<c-b>'
let g:UltiSnipsEditSplit='vertical'

" ale
let g:ale_linters = {}

" Dev icons
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1 " Turn on folder icons
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" syntastic
if has('syntastic')
        let g:syntastic_always_populate_loc_list=1
        let g:syntastic_error_symbol='✗'
        let g:syntastic_warning_symbol='⚠'
        let g:syntastic_style_error_symbol = '✗'
        let g:syntastic_style_warning_symbol = '⚠'
        let g:syntastic_auto_loc_list=1
        let g:syntastic_aggregate_errors = 1
endif

" Make {motion} text uppercase in INSERT mode.
map! <C-F> <Esc>gUiw`]a

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

"" Copy/Paste/Cut
if has ('unnamedplus')
	set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

if has('macunix')
  " pbcopy for OSX copy/paste
  vmap <C-x> :!pbcopy<CR>
  vmap <C-c> :w !pbcopy<CR><CR>
endif

"" Buffer nav
" noremap <leader>z :bp<CR>
" noremap <leader>q :bp<CR>
" noremap <leader>x :bn<CR>
" noremap <leader>w :bn<CR>

"" Close buffer
" noremap <leader>c :bd<CR>

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

"" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"" Vmap for maintain Visual Mode after shifting > and <
vmap < <gv
vmap > >gv

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Absolute movement for word-wrapped lines.
nnoremap j gj
nnoremap k gk

"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

" UltiSnips: Compatibility with YouCompleteMe via SuperTab.
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" Select suggestion with <CR> not <C-Y>
inoremap <expr> <CR> pumvisible() ? "\<C-Y>" : "\<CR>"

" === NERD Commenter === "
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

"*****************************************************************************
"" Custom configs
"*****************************************************************************

" html
" for html files, 2 spaces
augroup vimrc-html
    autocmd!
autocmd Filetype html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
augroup END


" javascript
let g:javascript_enable_domhtmlcss = 1

" vim-javascript
augroup vimrc-javascript
  autocmd!
  autocmd FileType javascript setl tabstop=4|setl shiftwidth=4|setl expandtab softtabstop=4
augroup END


" php


" python
" vim-python
augroup vimrc-python
  autocmd!
  autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8 colorcolumn=79
      \ formatoptions+=croq softtabstop=4
      \ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
augroup END

" jedi-vim
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = '<leader>g'
let g:jedi#goto_definitions_command = '<leader>d'
let g:jedi#documentation_command = 'K'
let g:jedi#usages_command = '<leader>n'
let g:jedi#rename_command = '<leader>r'
let g:jedi#show_call_signatures = '0'
let g:jedi#completions_command = '<C-Space>'
let g:jedi#smart_auto_mappings = 0

" ale
:call extend(g:ale_linters, {
    \'python': ['flake8'], })

" vim-airline
let g:airline#extensions#virtualenv#enabled = 1

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1


" typescript
let g:yats_host_keyword = 1



"*****************************************************************************
"*****************************************************************************

"" Include user's local vim config
if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

"*****************************************************************************
"" Convenience variables
"*****************************************************************************

" Force Airline to refresh after setup so settings work
":autocmd!
":autocmd VimEnter * :AirlineRefresh

"" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#bufferline#enabled = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = '⊘'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''


"" Statusline

"" :h mode() to see all modes

"let g:currentmode={
    "\ 'n'      : 'NORMAL ',
    "\ 'no'     : 'N·Operator Pending ',
    "\ 'v'      : 'V ',
    "\ 'V'      : 'V·Line ',
    "\ '\<C-V>' : 'V·Block ',
    "\ 's'      : 'Select ',
    "\ 'S'      : 'S·Line ',
    "\ '\<C-S>' : 'S·Block ',
    "\ 'i'      : 'INSERT ',
    "\ 'R'      : 'R ',
    "\ 'Rv'     : 'V·Replace ',
    "\ 'c'      : 'Command ',
    "\ 'cv'     : 'Vim Ex ',
    "\ 'ce'     : 'Ex ',
    "\ 'r'      : 'Prompt ',
    "\ 'rm'     : 'More ',
    "\ 'r?'     : 'Confirm ',
    "\ '!'      : 'Shell ',
    "\ 't'      : 'Terminal '
    "\}

"" Automatically change the statusline color depending on mode

"function! ChangeStatuslineColor()
  "if (mode() =~# '\v(n|no)')
    "exe 'hi! StatusLine ctermfg=008'
  "elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    "exe 'hi! StatusLine ctermfg=005'
  "elseif (mode() ==# 'i')
    "exe 'hi! StatusLine ctermfg=004'
  "else
    "exe 'hi! StatusLine ctermfg=006'
  "endif
  "return ''
"endfunction
"" Find out current buffer's size and output it.
"function! FileSize()
  "let bytes = getfsize(expand('%:p'))
  "if (bytes >= 1024)
    "let kbytes = bytes / 1024
  "endif
  "if (exists('kbytes') && kbytes >= 1000)
    "let mbytes = kbytes / 1000
  "endif
  "if bytes <= 0
    "return '0'
  "endif
  "if (exists('mbytes'))
    "return mbytes . 'MB '
  "elseif (exists('kbytes'))
    "return kbytes . 'KB '
  "else
    "return bytes . 'B '
  "endif
"endfunction
"function! ReadOnly()
  "if &readonly || !&modifiable
    "return ''
  "else
    "return ''
"endfunction
"function! GitInfo()
  "let git = fugitive#head()
  "if git != ''
    "return ' '.fugitive#head()
  "else
    "return ''
"endfunction
"set laststatus=2
"set statusline=
"set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
"set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
"set statusline+=%8*\ [%n]                                " buffernr
"set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
"set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
"set statusline+=%#warningmsg#

""set statusline+=%{SyntasticStatuslineFlag()}             " Syntastic errors
"set statusline+=%*
"set statusline+=%9*\ %=                                  " Space
"set statusline+=%8*\ %y\                                 " FileType
"set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
"set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
"set statusline+=%0*\ %3p%%\ \ %l:\ %3c\                 " Rownumber/total (%)
"hi User1 ctermfg=007
"hi User2 ctermfg=008
"hi User3 ctermfg=008
"hi User4 ctermfg=008
"hi User5 ctermfg=008
"hi User7 ctermfg=008
"hi User8 ctermfg=008
"hi User9 ctermfg=007
