" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

" Run PlugInstall if there are missing plugins
" Note that this may increase the startup time of Vim.
autocmd VimEnter *
      \| if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \| PlugInstall --sync | source $MYVIMRC
      \| endif

call plug#begin('~/.config/nvim/plugged')

" Minimalist Vim Plugin Manager
Plug 'junegunn/vim-plug'

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" Comment stuff out
Plug 'tpope/vim-commentary'

" A Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" Automatically save changes to disk in Vim
Plug '907th/vim-auto-save'

" Enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'

" Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" Auto close parentheses and repeat by dot dot dot...
Plug 'cohama/lexima.vim'

" Improved motion in Vim
Plug 'easymotion/vim-easymotion'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" The undo history visualizer for Vim
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }

" Easy text exchange operator for Vim
Plug 'tommcdo/vim-exchange'

" vim match-up: even better % fist_oncoming navigate and highlight
" matching words fist_oncoming modern matchit and matchparen replacement
Plug 'andymass/vim-matchup', { 'for':
    \  ['dart', 'eruby', 'html', 'javascript', 'json', 'xml']
    \}

" EditorConfig plugin for Vim
" Note: this plugin conflicts with 'vim-auto-save'
Plug 'editorconfig/editorconfig-vim'

" The fastest Neovim colorizer
Plug 'norcalli/nvim-colorizer.lua'

" === Code completion, snippets === "

" === Syntax Highlighting === "

" A solid language pack for Vim.
Plug 'sheerun/vim-polyglot'

" === UI === "
" File explorer
Plug 'preservim/nerdtree'

" Continuously updated session files
Plug 'tpope/vim-obsession'

" Tmux/Neovim movement integration
Plug 'christoomey/vim-tmux-navigator'

" fzf ♡ vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Most Recently Used (MRU) Vim Plugin
Plug 'yegappan/mru'

" Colorscheme
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'

" Customized vim status line
Plug 'glepnir/spaceline.vim'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" vim plugin for automatic keyboard layout switching in insert mode
Plug 'lyokha/vim-xkbswitch'

" Vim-Plug shortcut for update all plugins and upgrade itself
" (:PU instead of :PlugUpdate | PlugUpgrade)
command! PU PlugUpdate | PlugUpgrade

" Initialize plugin system
call plug#end()

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

" Remap leader key to ,
let g:mapleader=','

if has('vim_starting')
	set encoding=utf-8
	scriptencoding utf-8

	" Enables 24-bit RGB color in the TUI
	if has('termguicolors') && $COLORTERM =~# 'truecolor\|24bit'
		set termguicolors
	endif
endif

" Show the line number relative to the line with the cursor in front of
" each line.
set number
set relativenumber

" Show (partial) command in the last line of the screen.
set showcmd

" Yank and paste with the system clipboard
set clipboard=unnamedplus

" Remember last cursor position
augroup remember-cursor-position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") &&
        \   &ft !~# '\%(^git\%(config\)\@!\|commit\)'
        \ | exe "normal! g`\""
        \ | endif
augroup END

" Enable mouse support in all modes.
set mouse=a

" Enable loading the plugin files for specific file types and indent support
filetype plugin indent on

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Setting up vertical split separator as in Tmux.
set fillchars+=vert:│

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=7

" Making scrolling horizontally a bit more useful
set sidescroll=5
set listchars+=precedes:<,extends:>

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Hides buffers instead of closing them
set hidden

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=50

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

set numberwidth=5

" Set Python3 provider as of Neovim is recommend
let g:python3_host_prog = '/usr/bin/python3'

" =====[ TAB/Space settings ]=====

" default indentation: 2 spaces
 set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

 " Only do this part when compiled with support for autocommands
augroup tabs_and_spaces
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
endif
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

" do not wrap long lines by default
set nowrap

" Don't highlight current cursor line
set nocursorline

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" Only one line for command line
set cmdheight=2

" =====[ Completion Settings ]=====

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" Do smart autoindenting when starting a new line.
set smartindent

" Fix spelling errors
iabbrev cosnt const

" For correct appear in some terminals
if exists('+termguicolors')
 let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
 let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
 set termguicolors

 "for italic in tmux
endif
" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Set a WildMenu in old style
set wildoptions=""

" Window management in (neo)Vim
augroup ReduceNoise
    autocmd!
    " Automatically resize active split to 85 width
    autocmd WinEnter * :call ResizeSplits()
augroup END

function! ResizeSplits()
    set winwidth=60
    wincmd =
endfunction

" Unfocuse window when cursor lives
autocmd WinEnter * setlocal cursorline
autocmd WinEnter * setlocal signcolumn=auto

autocmd WinLeave * setlocal nocursorline
autocmd WinLeave * setlocal signcolumn=no

" ============================================================================ "
" ===                      CUSTOM COLORSCHEME CHANGES                      === "
" ============================================================================ "
"
" Add custom highlights in method that is executed every time a
" colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for
" details
function! TrailingSpaceHighlights() abort
  " Hightlight trailing whitespace
  highlight Trail ctermbg=red guibg=red
  call matchadd('Trail', '\s\+$', 100)
endfunction

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

" Editor theme
colorscheme gruvbox
" For gruvbox specifically
set background=dark

" Make it more obvious where 'ColorColumn' is
highlight ColorColumn guibg=SlateBlue3
" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" =====[ Search shorcuts ]=====
"   <leader>h - Find and replace
"   <leader>/ - Clear highlighted search terms while preserving history
map <leader>h :%s///<left><left>

" =====[ Little usability improvements ]=====

" Allows you to save files you opened without write permissions via sudo
cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" cmap w!! w !sudo tee %

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

"" Clean search (highlight)
nnoremap <silent> <esc> :nohlsearch<cr>

" Make {motion} text uppercase in INSERT mode.
map! <C-F> <Esc>gUiw`]a

" When change some text delete the source without affecting the normal
" registers ("_ is a "black hole" register).
" nnoreMap c "_c

" Repeat latest f, t, F or T in opposite direction
nnoremap ' ,

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Easy expansion of the active file directory
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

" Keep the flags from the previous substitute command for normal
" and visual mode
nnoremap & :&&<CR>
xnoremap & :&&<CR>

" Automaticaly jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Enable soft wraping text
command! -nargs=* Wrap set wrap linebreak nolist

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

" Shortcut to save
nmap <Leader>, :w<CR>

" Switching between Terminal Mode and Normal Mode
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  tnoremap <C-v><Esc> <Esc>
endif

" Distinguishing the Terminal Cursor from the Normal Cursor
if has('nvim')
  highlight! link TermCursor Cursor
  highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

" Easy window switching for Terminal mode
if has('nvim')
  tnoremap <M-h> <C-\><C-n><C-w>h
  tnoremap <M-j> <C-\><C-n><C-w>j
  tnoremap <M-k> <C-\><C-n><C-w>k
  tnoremap <M-l> <C-\><C-n><C-w>l
endif

" When in terminal buffer -> Insert Mode
augroup insert_in_term
  autocmd!
  if has('nvim')
    autocmd!
    autocmd TermOpen,BufEnter term://* startinsert
  endif
augroup END

" Insert blank lines
nnoremap <cr> o<esc>

" Yank to end of line
nnoremap Y y$

" Making things easier a little bit
" Hacked from Steeve Losh
" https://bitbucket.org/sjl/dotfiles/src/default/vim/vimrc
nnoremap H ^
nnoremap L $
vnoremap L g_

" Move through visual line normally only if they exists
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
xnoremap <expr> j (v:count == 0 && mode() !=# 'V') ? 'gj' : 'j'
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
xnoremap <expr> k (v:count == 0 && mode() !=# 'V') ? 'gk' : 'k'

" Set working directory to the current buffer's directory
nnoremap cd :lcd %:p:h<bar>pwd<cr>
nnoremap cu :lcd ..<bar>pwd<cr>

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" =====[ Search ]=====
" Turning On Neovim built-in feature inccommand, to live preview the
" :substitute command
if has("nvim")
  set inccommand=nosplit
endif

" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case
" sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
endif
set backupdir=~/.local/share/nvim/backup " Don't put backups in current dir
set backup
set noswapfile

" Reload icons after init source
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif

" Clear all registers with :WipeReg command
command! WipeReg for i in range(34,122) | silent!
      \ call setreg(nr2char(i), []) | endfor

" Resize splits when the window is resized
augroup on_vim_resized
  autocmd!
  autocmd VimResized * wincmd =
augroup END

" Prevent Neovim from nesting inside of a terminal buffer
if has('nvim') && executable('nvr')
  let $VISUAL="nvr -cc split --remote-wait + 'set bufhidden=wipe'"
endif

" Disable persistent undo for temporary files
augroup vimrc
  autocmd!
  autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

" Turn off line number and relativenumber for term buffer
augroup termBuffer
  autocmd!
  autocmd TermOpen * setlocal nonumber norelativenumber
augroup END

" Highlight on yank
augroup highlight_yank
  if exists('##TextYankPost')
    autocmd!
    autocmd TextYankPost *
          \ silent! lua return (not vim.v.event.visual) and
          \ require'vim.highlight'.on_yank({higroup="IncSearch", timeout = 150})
  endif
augroup END

" Autosave
" from:
" https://github.com/junegunn/dotfiles/blob/18e886d73eac4866724cfcb00ef168dffd5be0d4/vimrc#L904
" function! s:autosave(enable)
"   augroup autosave
"     autocmd!
"     if a:enable
"       autocmd TextChanged,InsertLeave <buffer>
"             \  if empty(&buftype) && !empty(bufname(''))
"             \|   silent! update
"             \| endif
"     endif
"   augroup END
" endfunction

" command! -bang AutoSave call s:autosave(<bang>1)
