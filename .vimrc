" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "
" Be iMproved
if &compatible
  set nocompatible
endif

let vimplug_exists=expand('~/.vim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable('curl')
    echoerr 'You have to install curl or first install vim-plug yourself!'
    execute 'q!'
  endif
  echo 'Installing Vim-Plug...'
  echo ""
  silent exec '!\curl -fLo ' . vimplug_exists . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  let g:not_finish_vimplug = 'yes'

augroup pluginstall
    autocmd!
    autocmd VimEnter * PlugInstall
endif
augroup END

" Initialize vim-plug.
call plug#begin('~/.vim/plugged')

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" Comment stuff out
Plug 'tpope/vim-commentary'

" A Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" Vim script for text filtering and alignment
Plug 'godlygeek/tabular'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" ghetto HTML/XML mappings (formerly allml.vim)
Plug 'tpope/vim-ragtag'

" Heuristically set buffer options
Plug 'tpope/vim-sleuth'

" Enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'

" A Vim Plugin for indicating changes as colored bars using signs.
Plug 'chrisbra/changesPlugin'

" Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" auto-close plugin
" Plug 'rstacruz/vim-closer'
Plug 'jiangmiao/auto-pairs'

" Improved motion in Vim
Plug 'easymotion/vim-easymotion'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" Tmux/Neovim movement integration
Plug 'christoomey/vim-tmux-navigator'

" The undo history visualizer for Vim
Plug 'mbbill/undotree'

" BufExplorer Plugin for Vim
" Plug 'jlanzarotta/bufexplorer'

" Helps you win at grep.
Plug 'mhinz/vim-grepper'

" Make the yanked region apparent!
Plug 'machakann/vim-highlightedyank'

" vim-searchindex: display number of search matches &
" index of a current match
Plug 'google/vim-searchindex'

" === Copmletion plugins === "
" A super simple, super minimal, super light-weight tab completion
" plugin for Vim.
" Plug 'ajh17/VimCompletesMe'

" Chained completion that works the way you want!
Plug 'lifepillar/vim-mucomplete'

" A vim plugin for communicating with a language server
Plug 'natebosch/vim-lsc'

" Check syntax in Vim asynchronously and fix files, with
" Language Server Protocol (LSP) support
Plug 'dense-analysis/ale'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'

" A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'

" Emmet for Vim
Plug 'mattn/emmet-vim'

" vim match-up: even better % fist_oncoming navigate and highlight
" matching words fist_oncoming modern matchit and matchparen replacement
Plug 'andymass/vim-matchup', { 'for':
    \  ['dart', 'eruby', 'html', 'javascript', 'json', 'xml']
    \}

" vim plugin to trace syntax highlight
" it shows syntax highlighting groups for word under cursor
" this feature is needed to make your own colorscheme
Plug 'gerw/vim-HiLinkTrace'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }

" The fancy start screen for Vim.
Plug 'mhinz/vim-startify'

" Silly game for Vim 8.2
Plug 'vim/killersheep'

" Fast file navigation for VIM
Plug 'wincent/command-t', {
  \   'do': 'cd ruby/command-t/ext/command-t && ruby extconf.rb && make'
  \ }

" Rainbow Parentheses Improved, shorter code, no level limit,
" smooth and fast, powerful configuration.
Plug 'luochen1990/rainbow'

" Colorscheme
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim'
Plug 'Badacadabra/vim-archery'
Plug 'morhetz/gruvbox'
Plug 'troyfletcher/vim-colors-synthwave'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'kaicataldo/material.vim'
Plug 'fenetikm/falcon'
Plug 'tomasr/molokai'
Plug 'Badacadabra/vim-archery'
Plug 'chriskempson/base16-vim'
Plug 'bluz71/vim-moonfly-colors'

" Customized vim status line
" Plug 'bluz71/vim-moonfly-statusline'

" lean & mean status/tabline for vim that's light as air
Plug 'vim-airline/vim-airline'

" A collection of themes for vim-airline
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" vim plugin for automatic keyboard layout switching in insert mode
" Plug 'lyokha/vim-xkbswitch'

" Finalize vim-plug.
call plug#end()

" ============================================================================= "
" ===                             BASIC OPTIONS                             === "
" ============================================================================= "

" Set encoding
if &encoding ==# 'latin1' && !exists('$LANG')
    set encoding=utf-8
endif
scriptencoding utf-8

" Remap leader key to ','
let g:mapleader=','

" Enable line numbers
set number

" Show file title in terminal tab
set title

set titlestring=%t%=%<%(\ %{&encoding},[%{&modified?'+':'-'}],%p%%%)

" Show the line number relative to the line with the cursor in front of
" each line.
set relativenumber

" Show (partial) command in the last line of the screen.
set showcmd

" Disable bell for all events
set belloff=all

" Wrap logn lines *with* indentation
set breakindent

" No backup files
set noswapfile

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

" to change the cursor in different modes use this:
" from https://habr.com/ru/post/468265/
set ttimeoutlen=10          " Reduce the delay in entering escape sequences
let &t_SI.="\e[5 q"         " SI = INSERT mode
let &t_SR.="\e[3 q"         " SR = REPLACE mode
let &t_EI.="\e[1 q"         " EI = NORMAL mode
" Where 1 is the flashing rectangle
" 2 - regular rectangle
" 3 - flashing underline
" 4 - just underline
" 5 - flashing vertical bar
" 6 - just a vertical bar

" Change cursor shape onto vertical line in insert mode
" for Konsole in KDE 4 (from vim.fandom.com/wiki)
" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" It may be useful to run external programs from vim
" e.g. :Silent htop
command! -nargs=1 Silent
  \ | execute ':silent !'.<q-args>
  \ | execute ':redraw!'

" Enable mouse support in all modes.
set mouse=a

" Enable loading the plugin files for specific file types.
filetype plugin on

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

" Setting up vertical split separator as in Tmux.
set fillchars+=vert:│

" Minamal number of screen lines to keep above and below the cursor.
set scrolloff=5

" Hides buffers instead of closing them.
set hidden

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=150

" Always show signcolumns.
set signcolumn=yes

" Search relative to current file + directory
" Provides tab-completion for all file-related tasks
set path=.,**

" Save read-only buffer
cnoremap w!! w !sudo tee % > /dev/null

" === TAB/Space settings === "
" default indentation: 4 spaces
 set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

 " Only do this part when compiled with support for autocommands
augroup Tabs-and-spaces
    if has("autocmd")

        " Enable file type detection
        filetype on

        " Syntax of these languages is fussy over tabs Vs spaces
        autocmd FileType make setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
        autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

        " Customisations based on house-style (arbitrary)
        autocmd FileType html setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
        autocmd FileType css setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
        autocmd FileType javascript setlocal tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

        " Treat .rss files as XML
        autocmd BufNewFile,BufRead *.rss setfiletype xml

        " Treat .ejs (embedded javascript) file as HTML
        autocmd BufNewFile,BufRead *.ejs set filetype=html
augroup END

" Set tabstop, softtabstop and shiftwidth to the same value
" from vimcast.org #2 Tabs and Spaces
command! -nargs=* Stab call Stab()
function! Stab()
  let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
  if l:tabstop > 0
    let &l:sts = l:tabstop
    let &l:ts = l:tabstop
    let &l:sw = l:tabstop
  endif
  call SummarizeTabs()
endfunction

function! SummarizeTabs()
  try
    echohl ModeMsg
    echon 'tabstop='.&l:ts
    echon 'shiftwidth='.&l:sw
    echon 'softtabstop='.&l:sts
    if &l:et
      echon ' expandtab'
    else
      echon ' noexpandtab'
    endif
  finally
    echohl None
  endtry
endfunction

" Enable syntax highlight for *.log files
augroup log-messages
    autocmd!
    autocmd BufNewFile,BufReadPost *.log :set filetype=messages
  endif
augroup END

" do not wrap long lines by default
set nowrap

" Don't highlight current cursor line
set nocursorline

" Use spaces instead of tabs
set expandtab

" Be smart
set smarttab

" Do smart autoindenting when starting a new line.
set smartindent

" 256 color support
set t_Co=256

" this also helps to support 256 colors
" ©from VimWiki
" set t_AB=^[[48;5;%dm
" set t_AF=^[[38;5;%dm

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
if &ruler
    set noruler
endif

" Enable status line
set laststatus=2

" Show as much as possible of the last line.
set display=lastline

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" Only two line for command line
set cmdheight=2

" Nice command completions
set wildmenu
set wildmode=full

" === Completion Settings === "

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" Sources for term and line completions
set complete=.,w,b

" A comma separated list of options for Insert mode completion
if exists('+completeopt')
    " set completeopt+=longest  " Insert longest common substring
    set completeopt+=menu       " Use a popup menu to show the possible completions.
    set completeopt+=menuone    " Show the menu even if only one match
    set completeopt+=noinsert   " User selects a match from the menu
    set completeopt+=noselect   " No insert until the user select a match from menu
endif

" Height of complete list
set pumheight=20

" Source the vimrc file after saving it
augroup source-after-save
    if has("autocmd")
        autocmd bufwritepost .vimrc source $MYVIMRC
    endif
augroup END

" Match angle brackets
set matchpairs+=<:>

" Highlight completed searches; clear on reload
set hlsearch
if 1
    nohlsearch
endif

" Open vimrc file with a few key strokes
" let mapleader = ','
nmap <leader>v :tabedit $MYVIMRC<CR>

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === NERDTree === "
" Show hidden files/directories
let g:NERDTreeShowHidden = 1

" Remove bookmarks and help text from NERDTree
let g:NERDTreeMinimalUI = 1

" Custom icons for expandable/expanded directories
let g:NERDTreeDirArrowExpandable = '⬏'
let g:NERDTreeDirArrowCollapsible = '⬎'

" Hide certain files and directories from NERDTree
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']

" Automatically delete the buffer of the file you just deleted with NerdTree
let NERDTreeAutoDeleteBuffer = 1

" Automatically close NerdTree when you open a file
let NERDTreeQuitOnOpen = 1

" Wrap in try/catch to avoid errors on initial install before plugin is available
endtry

" === Vim airline === "
" Enable extensions
let g:airline#extensions#bufferline#enabled = 1
let g:airline_extensions = ['branch', 'hunks', 'ale']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common
" parts
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [
    \ [ 'a', 'b', 'c' ],
    \ [ 'x', 'z', 'error', 'warning' ]
    \ ]

let g:airline#extensions#ale#enabled = 1

" let airline#extensions#coc#stl_format_err = '%E{[%e(#%fe)]}'

" let airline#extensions#coc#stl_format_warn = '%W{[%w(#%fw)]}'

" Configure error/warining section to use coc.nvim
" let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
" let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Hide the Nerdtree status line to avoid clutter
let g:NERDTreeStatusline = ''

" Disable vim-airline in preview mode
let g:airline_exclude_preview = 1

" Enable powerline fonts
let g:airline_powerline_fonts = 1

" Enable caching of syntax highlighting groups
let g:airline_highlighting_cache = 1

" Define custom airline symbols
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '❮'
let g:airline_right_sep = '❯'

" Don't show git changes to current file in airline
let g:airline#extensions#hunks#enabled = 0

" catch
"     echo 'Airline not installed. It should work after running :PlugInstall'
" endtry

" === vim-xkbswitch === "
" let g:XkbSwitchEnabled   = 1
" let g:XkbSwitchIMappings = ['ru']
" let g:XkbSwitchLib       = '/usr/lib/libxkbswitch.so'

" === indentLine === "
let g:indentLine_char = '┊'

" === EasyAlign === "
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" === Tabular === "
" *from vimcasts №29 Aligning text with Tabular.vim
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>

function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction

" === undotree === "
let g:undotree_HighlightChangeWithSign = 0
let g:undotree_WindowLayout = 3

" === Rainbow === "
let g:rainbow_active = 1

" === vim-grepper === "
 let g:grepper = {}
 let g:grepper.tools = ["rg"]
 " runtime autoload/grepper.vim
 let g:grepper.jump = 1
 nnoremap <Leader>/ :GrepperRg<Space>
 nnoremap gs :Grepper -cword -noprompt<CR>
 xmap gs <Plug>(GrepperOperator)

" === vim-lsc === "
let g:lsc_server_commands = {
 \  'ruby': {
 \    'command': 'solargraph stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  },
 \  'javascript': {
 \    'command': 'typescript-language-server --stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  }
 \}
let g:lsc_auto_map = {
 \  'GoToDefinition': 'gd',
 \  'FindReferences': 'gr',
 \  'Rename': 'gR',
 \  'ShowHover': 'K',
 \  'Completion': 'omnifunc',
 \}
let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'


" === ale === "
let g:ale_fixers = {
\  'css':        ['prettier'],
\  'javascript': ['prettier-standard'],
\  'json':       ['prettier'],
\  'ruby':       ['standardrb'],
\  'scss':       ['prettier'],
\  'yml':        ['prettier']
\}
let g:ale_linters = {
\  'css':        ['csslint'],
\  'javascript': ['standard'],
\  'json':       ['jsonlint'],
\  'markdown':   ['mdl'],
\  'ruby':       ['standardrb'],
\  'scss':       ['sasslint'],
\  'yaml':       ['yamllint']
\}
let g:ale_linters_explicit   = 1
let g:ale_open_list          = 1
let g:ale_sign_error         = '❯❯'
let g:ale_sign_info          = '❯❯'
let g:ale_sign_warning       = '❯❯'
let g:ale_sign_priority      = 50
let g:ale_virtualtext_cursor = 0
let g:ale_virtualtext_prefix = '● '

" === vim-mucomplete === "
let g:mucomplete#enable_auto_at_startup = 1
let g:mucomplete#buffer_relative_paths  = 1

" === vim-matchup === "
let g:matchup_delim_noskips        = 2
let g:matchup_matchparen_deferred  = 1
let g:matchup_matchparen_nomode    = 'i'
let g:matchup_matchparen_offscreen = { 'method': 'popup', 'scrolloff': 1 }
let g:matchup_matchpref            = {
 \  'html':  { 'tagnameonly': 1, 'nolists': 1 },
 \  'eruby': { 'tagnameonly': 1, 'nolists': 1 },
 \  'xml':   { 'tagnameonly': 1, 'nolists': 1 },
 \}

" === emmet-vim === "
" ↓↓↓ Conflicting with MUcomplete ↓↓↓
" let g:user_emmet_expandabbr_key = '<Tab>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

" ↓↓↓ This is conflicting too ↓↓↓
" let g:user_emmet_leader_key = '<C-e>'
" let g:user_emmet_expandabbr_key = '<C-x><C-e>'
" imap <silent><expr> <Tab> <SID>expand()

" function! s:expand()
"     if pumvisible()
"         return "\<C-y>"
"     endif
"     let col = col('.') - 1
"     if !col || getline('.')[col - 1] =~# '\s'
"         return "\<Tab>"
"     endif
"     return "\<C-x>\<C-e>"
" endfunction

" === vim-startify === "
let g:startify_commands = [
        \   { 'up': [ 'Update Plugins', ':PlugUpdate' ] },
        \   { 'ug': [ 'Upgrade Plugin Manager', ':PlugUpgrade' ] },
        \ ]

" === command-t === "
" Brings up the Command-T buffer window, except that matches
" are shown in MRU (most recently used) order.
nmap <silent> <Leader>r <Plug>(CommandTMRU)
" bring up the Command-T jumplist window
nmap <silent> <Bslash>j <Plug>(CommandTJump)

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Enable true color support
" for more details see :h xterm-true-color
" NOTE: the "^[" is a single character. You enter it by pressing
" Ctrl+v and then ESC or use \<Esc> instead
if exists('+termguicolors')
  let &t_8f = "[38;2;%lu;%lu;%lum"
  let &t_8b = "[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Editor theme
set background=dark
try
  colorscheme moonfly
catch
  colorscheme slate
endtry

" Vim airline theme
let g:airline_theme='space'


" Add custom highlights in method that is executed every time a
" colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for
" details
function! MyHighlights() abort
  " Hightlight trailing whitespace
  highlight Trail ctermbg=red guibg=red
  call matchadd('Trail', '\s\+$', 100)
endfunction

augroup MyColors
  autocmd!
  autocmd ColorScheme * call MyHighlights()
augroup END

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" coc.nvim color changes
hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" Make background transparent for many things
hi! Normal ctermbg=NONE guibg=NONE
hi! NonText ctermbg=NONE guibg=NONE
hi! LineNr ctermfg=NONE guibg=NONE
hi! SignColumn ctermfg=NONE guibg=NONE
hi! StatusLine guifg=#16252b guibg=#6699CC
hi! StatusLineNC guifg=#16252b guibg=#16252b

" Try to hide vertical spit and end of buffer symbol
hi! VertSplit gui=NONE guifg=#17252c guibg=#17252c
hi! EndOfBuffer ctermbg=NONE ctermfg=NONE guibg=#17252c guifg=#17252c

" Customize NERDTree directory
hi! NERDTreeCWD guifg=#99c794

" Make background color transparent for git changes
hi! SignifySignAdd guibg=NONE
hi! SignifySignDelete guibg=NONE
hi! SignifySignChange guibg=NONE

" Highlight git change signs
hi! SignifySignAdd guifg=#99c794
hi! SignifySignDelete guifg=#ec5f67
hi! SignifySignChange guifg=#c594c5

" Call method on window enter
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END

" Change highlight group of preview window when open
function! Handle_Win_Enter()
  if &previewwindow
    setlocal winhighlight=Normal:MarkdownError
  endif
endfunction

" ============================================================================= "
" ===                               KEY MAPPINGS                            === "
" ============================================================================= "

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Clear highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

" === Easy-motion shortcuts ==="
" <leader>s - Easy-motion highlights {char} to bidirection (forward and
" backward at the same time.)
map <Leader> <Plug>(easymotion-prefix)

" === undotree ==="
nnoremap <Leader>u :UndotreeToggle<cr>

" === vim-matchup ==="
noremap <Leader>m :MatchupWhereAmI?<CR>

" === Little usability improvements ==="

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Make {motion} text uppercase in INSERT mode.
map! <C-F> <Esc>gUiw`]a

" Repeat latest f, t, F or T in opposite direction
noremap \ ,

"   <Space> - PageDown
"   -       - PageUp
noremap <Space> <PageDown>
noremap - <PageUp>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Allows you to save files you opened without write permissions via sudo
cmap w!! w !sudo tee %

" Easy expansion of the active file directory
" from vimcasts
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Search for the Current Selection (Redux)
" from Practical Vim, 2nd edition book by Drew Neil
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
endfunction

" Remap normal/visual & to preserve substitution flags
nnoremap <silent> & :&&<CR>
if exists(':xnoremap')
    xnoremap <silent> & :&&<CR>
endif

" Automaticaly jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Enable soft wrapping text
command! -nargs=* Wrap set wrap linebreak nolist

" Moving around through wrapped lines
vmap <M-j> gj
vmap <M-k> gk
vmap <M-4> g$
vmap <M-6> g^
vmap <M-0> g^
nmap <M-j> gj
nmap <M-k> gk
nmap <M-4> g$
nmap <M-6> g^
nmap <M-0> g^

" Visually select the text that was last edited/pasted
nmap gV `[v`]

" Move selected text Up and Down
" from Vimcast #26 Bubbling text
" >>>Note that "[e, ]e" and other work only if vim-unimpaired is installed<<<
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" Easier way to use of :ls command
nnoremap <Leader>l :ls<cr>:b<Space>

" \R reloads ~/.vimrc
nnoremap <Bslash>R :<C-U>source $MYVIMRC<CR>

" Shortcut to save
nmap <Leader>, :w<CR>

" Custom text objects
" inner-line
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" Automaticaly close nvim if NERDTree is only thing left open
augroup close-Nerdtree
    autocmd!
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" === Search === "
" Highlight search results
set hlsearch
" Go to search results immediately
set incsearch
" Search in case-insensitively
set ignorecase
" Smart casing when completing
set infercase
" Always do global subsitutes
set gdefault
" if the search string has an upper case letter in it, the search will be case
" sensitive
set smartcase

" === Find & Replace Helpers for Vim === "
" original post on:
" https://bluz71.github.io/2019/03/11/find-replace-helpers-for-vim.html

" Nearby Find & Replace
nnoremap <silent> <Leader>c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> <Leader>c "sy:let @/=@s<CR>cgn
nnoremap <Enter> gnzz
xmap <Enter> .<Esc>gnzz
xnoremap ! <Esc>ngnzz
augroup quickfix
  autocmd! BufReadPost quickfix nnoremap <buffer> <CR> <CR>
  autocmd! CmdwinEnter *        nnoremap <buffer> <CR> <CR>
augroup END

" Find & Replace in the Current File
nnoremap <Bslash>s :let @s='\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//<Left>
xnoremap <Bslash>s "sy:%s/<C-r>s//<Left>

" Project-wide Find & Replace
nnoremap <Bslash>S
    \ :let @s='\<'.expand('<cword>').'\>'<CR>
    \ :Grepper -cword -noprompt<CR>
    \ :cfdo %s/<C-r>s// \| update
    \ <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
xmap <Bslash>S
    \ "sy \|
    \ :GrepperRg <C-r>s<CR>
    \ :cfdo %s/<C-r>s// \| update
    \ <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>

" Don't page long listings
set nomore

" Automaticaly re-read file if a change was detected outside of vim
set autoread

" Save buffer automatically when changing files
set autowrite

" Treat all numbers with a leading zero as decimal, not octal (for <C-A>/<C-X>)
set nrformats-=octal

" Faster redrawing.
set ttyfast

" Only redraw when necessary.
set lazyredraw

" Give some time for multi-key mappings
" Don't set ttimeoutlen to zero otherwise it will break terminal
" cursor block to I-beam and back functionality set by the t_SI and t_EI
" variables.
set timeoutlen=1500 ttimeoutlen=50

" Set the persistent undo directory on temporary private fast storage.
if exists('+undofile')
    set undofile
endif

if exists('+undofile')
    setglobal undodir=~/.cache/vim/undo
    if !isdirectory(&undodir)
        call mkdir(&undodir, 'p')
    endif
endif

" Maintain undo history
set undofile

" Keep 1000 items in the history
set history=1000

" Clear all registers with :WipeReg command
command! WipeReg for i in range(34,122) | silent!
      \ call setreg(nr2char(i), []) | endfor
