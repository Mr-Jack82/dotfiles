scriptencoding utf-8
source ~/.config/nvim/plugins.vim

" source of this config is https://github.com/ctaylo21/jarvis
" also read his article "A guide to modern Web Development with (Neo)vim"
" https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/

" ============================================================================ "
" ===                           EDITING OPTIONS                            === "
" ============================================================================ "

" Remap leader key to ,
let g:mapleader=','

" Enable line numbers
set number

" Show the line number relative to the line with the cursor in front of
" each line.
set relativenumber

" Show (partial) command in the last line of the screen.
set showcmd

" Yank and paste with the system clipboard
set clipboard=unnamedplus

" Remember last cursor position
augroup remember-cursor-position
  autocmd!
    autocmd BufReadPost *
      \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      \ |   exe "normal! g`\""
      \ | endif
augroup END

" Enable mouse support in all modes.
set mouse=a

" Enable loading the plugin files for specific file types
filetype plugin on

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" Setting up vertical split separator as in Tmux.
set fillchars+=vert:│

" Minimal number of screen lines to keep above and below the cursor.
set scrolloff=5

" Hides buffers instead of closing them
set hidden

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=50

" always show signcolumns
set signcolumn=yes

" === TAB/Space settings === "

" default indentation: 2 spaces
 set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

 " Only do this part when compiled with support for autocommands
augroup tabs-and-spaces
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

" Disable line/column number in status line
" Shows up in preview window when airline is disabled if not
set noruler

" Only one line for command line
set cmdheight=2

" === Completion Settings === "

" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" Do smart autoindenting when starting a new line.
set smartindent

" ============================================================================ "
" ===                           PLUGIN SETUP                               === "
" ============================================================================ "

" Wrap in try/catch to avoid errors on initial install before plugin is available
try
" === Denite setup ==="
" Use ripgrep for searching current directory for files
" By default, ripgrep will respect rules in .gitignore
"   --files: Print each file that would be searched (but don't search)
"   --glob:  Include or exclues files for searching that match the given glob
"            (aka ignore .git files)
"
call denite#custom#var('file/rec', 'command', ['rg', '--files', '--glob', '!.git'])

" Use ripgrep in place of "grep"
call denite#custom#var('grep', 'command', ['rg'])

" Custom options for ripgrep
"   --vimgrep:  Show results with every match on it's own line
"   --hidden:   Search hidden directories and files
"   --heading:  Show the file name above clusters of matches from each file
"   --S:        Search case insensitively if the pattern is all lowercase
call denite#custom#var('grep', 'default_opts', ['--hidden', '--vimgrep', '--heading', '-S'])

" Recommended defaults for ripgrep via Denite docs
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" Remove date from buffer list
call denite#custom#var('buffer', 'date_format', '')

" Open file commands
call denite#custom#map('insert,normal', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert,normal', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('insert,normal', "<C-h>", '<denite:do_action:split>')

" Custom options for Denite
"   auto_resize             - Auto resize the Denite window height automatically.
"   prompt                  - Customize denite prompt
"   direction               - Specify Denite window direction as directly below current pane
"   winminheight            - Specify min height for Denite window
"   highlight_mode_insert   - Specify h1-CursorLine in insert mode
"   prompt_highlight        - Specify color of prompt
"   highlight_matched_char  - Matched characters highlight
"   highlight_matched_range - matched range highlight
let s:denite_options = {'default' : {
\ 'split': 'floating',
\ 'start_filter': 1,
\ 'auto_resize': 1,
\ 'source_names': 'short',
\ 'prompt': 'λ:',
\ 'highlight_matched_char': 'QuickFixLine',
\ 'highlight_matched_range': 'Visual',
\ 'highlight_window_background': 'Visual',
\ 'highlight_filter_background': 'DiffAdd',
\ 'winrow': 1,
\ 'vertical_preview': 1
\ }}

" Loop through denite options and enable them
function! s:profile(opts) abort
  for l:fname in keys(a:opts)
    for l:dopt in keys(a:opts[l:fname])
      call denite#custom#option(l:fname, l:dopt, a:opts[l:fname][l:dopt])
    endfor
  endfor
endfunction

call s:profile(s:denite_options)
catch
  echo 'Denite not installed. It should work after running :PlugInstall'
endtry

" === Coc.nvim === "
" Use <tab> for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

function! HasEslintConfig()
  for name in ['.eslintrc.js', '.eslintrc.json', '.eslintrc']
    if globpath('.', name) != ''
      return 1
    endif
  endfor
endfunction

" Turn off eslint when cannot find eslintrc
call coc#config('eslint.enable', HasEslintConfig())

" Essentially avoid turning on typescript in a flow project
call coc#config('tsserver.enableJavascript', globpath('.', '.flowconfig') == '')

" lookup local flow executable
" and turn on flow for coc in executable exists
function! SetFlow()
  let s:flow_in_project = findfile('.nvm/versions/node/v10.19.0/lib/node_modules/flow-bin/flow-linux64-v0.123.0/flow')
  let s:flow_exe = empty(s:flow_in_project) ? '' : getcwd() . '/' . s:flow_in_project
  let s:flow_config = {
    \    'command': s:flow_exe,
    \    'args': ['lsp'],
    \    'filetypes': ['javascript', 'javascriptreact'],
    \    'initializationOptions': {},
    \    'requireRootPattern': 1,
    \    'settings': {},
    \    'rootPatterns': ['.flowconfig']
    \}

" Turn on flow when flow executable exists
  if !empty(s:flow_exe)
    call coc#config('languageserver', { 'flow': s:flow_config })
  endif
endfunction

call SetFlow()

let g:coc_global_extensions=[
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-css',
    \ 'coc-json',
    \ 'coc-emmet',
    \ 'coc-eslint',
    \ 'coc-highlight',
    \ 'coc-vimlsp',
    \ 'coc-sh',
    \ 'coc-tslint-plugin',
    \ 'coc-neosnippet'
    \ ]

" === NeoSnippet === "
" Map <C-j> as shortcut to activate snippet if available
imap <C-j> <Plug>(neosnippet_expand_or_jump)
smap <C-j> <Plug>(neosnippet_expand_or_jump)
xmap <C-j> <Plug>(neosnippet_expand_target)

" Fix for jumping over placeholders for neosnippet
smap <expr><TAB> neosnippet#jumpable() ?
\ "\<Plug>(neosnippet_jump)"
\: "\<TAB>"

" Load custom snippets from snippets folder
let g:neosnippet#snippets_directory='~/.config/nvim/snippets'

" For conceal markers
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

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

" Synchronizing nerdtree with the currently opened file
" from reddit post (https://www.reddit.com/r/vim/comments/g47z4f/synchronizing_nerdtree_with_the_currently_opened/?%24deep_link=true&correlation_id=8c881181-a7d4-4e11-94dc-f125f7daaa68&ref=email_digest&ref_campaign=email_digest&ref_source=email&utm_content=post_title&utm_medium=digest&utm_name=top_posts&utm_source=email&utm_term=day&%243p=e_as&%24original_url=https%3A%2F%2Fwww.reddit.com%2Fr%2Fvim%2Fcomments%2Fg47z4f%2Fsynchronizing_nerdtree_with_the_currently_opened%2F%3F%24deep_link%3Dtrue%26correlation_id%3D8c881181-a7d4-4e11-94dc-f125f7daaa68%26ref%3Demail_digest%26ref_campaign%3Demail_digest%26ref_source%3Demail%26utm_content%3Dpost_title%26utm_medium%3Ddigest%26utm_name%3Dtop_posts%26utm_source%3Demail%26utm_term%3Dday&_branch_match_id=699372985519899548)
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a
" modifiable file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()

" Wrap in try/catch to avoid errors on initial install before plugin is available
try

" === Vim airline ==== "
" Enable extensions
let g:airline#extensions#bufferline#enabled = 1
let g:airline_extensions = ['branch', 'hunks', 'coc']

" Update section z to just have line number
let g:airline_section_z = airline#section#create(['linenr'])

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1

" Smartly uniquify buffers names with similar filename, suppressing common parts of paths.
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Custom setup that removes filetype/whitespace from default vim airline bar
let g:airline#extensions#default#layout = [
  \ ['a', 'b', 'c'],
  \ ['x', 'z', 'error', 'warning',]
  \ ]

" Customize vim airline per filetype
" 'nerdtree'  - Hide nerdtree status line
" 'list'      - Only show file type plus current line number out of total
let g:airline_filetype_overrides = {
  \ 'nerdtree': [ get(g:, 'NERDTreeStatusline', ''), '' ],
  \ 'list': [ '%y', '%l/%L' ],
  \ }

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
let g:airline#extensions#hunks#enabled=0

catch
  echo 'Airline not installed. It should work after running :PlugInstall'
endtry

" === echodoc === "
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1

" === vim-javascript === "
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1

" === vim-jsx === "
" Highlight jsx syntax even in non .jsx files
let g:jsx_ext_required = 0

" === javascript-libraries-syntax === "
let g:used_javascript_libs = 'underscore,requirejs,chai,jquery'

" === Signify === "
let g:signify_sign_delete = '-'

" === EasyAlign === "
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" === NERD Commenter === "
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1

" === vim-auto-save === "
let g:auto_save        = 1
let g:auto_save_silent = 1
let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]

" Disable auto save for javascript and json files
augroup ft_javascript
  au!
  au FileType javascript,json let b:auto_save = 0
augroup END


" === vim-repeat === "
" This is an example from Github page and needed to edit properly
" from Vimcast #61
nnoremap <silent> <Plug>TransposeCharacters xp
      \:call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap cp <Plug>TransposeCharacters

" === vim-xkbswitch === "
let g:XkbSwitchEnabled   = 1
let g:XkbSwitchIMappings = ['ru']
" let g:XkbSwitchLib       = '/usr/lib/libxkbswitch.so'

" === indentLine === "
let g:indentLine_char = '┊'
let g:vim_json_syntax_conceal = 0
" TODO: the code below does not work, need to figure out why
" let g:indentLine_fileTypeExclude = ['help', 'text']

" This option works fine for .json file
" let g:indentLine_concealcursor = ""

" === undotree === "
let g:undotree_WindowLayout = 3

" === fugitive === "
" Auto-clean fugitive buffers
augroup auto-clean-fugitive
  autocmd!
  autocmd BufReadPost fugitive://* set bufhidden=delete
augroup END

" Use '..' to go up the history of Git commits, but only for buffers
" containing a git blob or tree
augroup go-up-fugitive
  autocmd!
  autocmd User fugitive
        \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
        \     nnoremap <buffer> .. :edit %:h<cr> |
        \ endif
augroup END

" Vim-Plug shortcut for update all plugins and upgrade itself
" (:PU instead of :PlugUpdate | PlugUpgrade)
command! PU PlugUpdate | PlugUpgrade

" === vim-matchup === "
let g:matchup_surround_enabled     = 1
let g:matchup_transmute_enabled    = 1
let g:matchup_delim_noskip         = 2
let g:matchup_matchparen_deferred  = 1
let g:matchup_matchparen_nomode    = 'i'
let g:matchup_matchparen_offscreen = { 'method': 'popup', 'scrolloff': 1 }
let g:matchup_matchpref            = {
 \  'html':  { 'tagnameonly': 1, 'nolists': 1 },
 \  'eruby': { 'tagnameonly': 1, 'nolists': 1 },
 \  'xml':   { 'tagnameonly': 1, 'nolists': 1 },
 \}

" === ctrlp.vim === "
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = "CtrlP"

" Use rg to search instead
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

" Ignore files to completion
set wildignore+=*/.git/*,*/tmp/*,*.so,*.swp,*.zip,*.epub,*.pdf,*.jpg

" show hidden files
let g:ctrlp_show_hidden = 1

" Lets us change the working directory during a Vim session and make CtrlP
" respect that change.
let g:ctrlp_working_path_mode = 0

" ============================================================================ "
" ===                                UI                                    === "
" ============================================================================ "

" Enable true color support
set termguicolors

" Vim airline theme
let g:airline_theme='space'
" silent! colorscheme kolor

" Change vertical split character to be a space (essentially hide it)
set fillchars+=vert:.

" Set preview window to appear at bottom
set splitbelow

" Don't dispay mode in command line (airilne already shows it)
set noshowmode

" Set floating window to be slightly transparent
" From denite.vim docs: To use "floating", you need to use neovim 0.4.0+
" (|nvim_open_win()|). neovim 0.3(includes 0.3.7) does not work.
set winblend=10

" Set a WildMenu in old style
set wildoptions=""

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

function! s:custom_jarvis_colors()
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
endfunction

augroup trailing-space-highlight
  autocmd! ColorScheme * call TrailingSpaceHighlights()
  autocmd! ColorScheme OceanicNext call s:custom_jarvis_colors()
augroup END

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
set background=dark
try
  colorscheme OceanicNext
catch
  colorscheme slate
endtry
" ============================================================================ "
" ===                             KEY MAPPINGS                             === "
" ============================================================================ "

" === Denite shorcuts === "
"   ;         - Browser currently open buffers
"   <leader>t - Browse list of files in current directory
"   <leader>g - Search current directory for occurences of given term and close
"   window if no results
"   <leader>j - Search current directory for occurences of word under cursor
nmap <Leader>b :Denite buffer<CR>
nmap <leader>t :DeniteProjectDir file/rec<CR>
nnoremap <leader>g :<C-u>Denite grep:. -no-empty<CR>
nnoremap <Bslash>j :<C-u>DeniteCursorWord grep:.<CR>

" Define mappings while in 'filter' mode
"   <C-o>         - Switch to normal mode inside of search results
"   <Esc>         - Exit denite window in any mode
"   <CR>          - Open currently selected file in any mode
"   <C-t>         - Open currently selected file in a new tab
"   <C-v>         - Open currently selected file a vertical split
"   <C-h>         - Open currently selected file in a horizontal split
augroup denite-filter
  autocmd!
  autocmd FileType denite-filter call s:denite_filter_my_settings()
augroup END
function! s:denite_filter_my_settings() abort
  imap <silent><buffer> <C-o>
  \ <Plug>(denite_filter_quit)
  inoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  inoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  inoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  inoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  inoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" Define mappings while in denite window
"   <CR>        - Opens currently selected file
"   q or <Esc>  - Quit Denite window
"   d           - Delete currenly selected file
"   p           - Preview currently selected file
"   <C-o> or i  - Switch to insert mode inside of filter prompt
"   <C-t>       - Open currently selected file in a new tab
"   <C-v>       - Open currently selected file a vertical split
"   <C-h>       - Open currently selected file in a horizontal split
augroup denite-settings
  autocmd!
  autocmd FileType denite call s:denite_my_settings()
augroup END
function! s:denite_my_settings() abort
  nnoremap <silent><buffer><expr> <CR>
  \ denite#do_map('do_action')
  nnoremap <silent><buffer><expr> q
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> <Esc>
  \ denite#do_map('quit')
  nnoremap <silent><buffer><expr> d
  \ denite#do_map('do_action', 'delete')
  nnoremap <silent><buffer><expr> p
  \ denite#do_map('do_action', 'preview')
  nnoremap <silent><buffer><expr> i
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-o>
  \ denite#do_map('open_filter_buffer')
  nnoremap <silent><buffer><expr> <C-t>
  \ denite#do_map('do_action', 'tabopen')
  nnoremap <silent><buffer><expr> <C-v>
  \ denite#do_map('do_action', 'vsplit')
  nnoremap <silent><buffer><expr> <C-h>
  \ denite#do_map('do_action', 'split')
endfunction

" === Nerdtree shorcuts === "
"  <leader>n - Toggle NERDTree on/off
"  <leader>f - Opens current file location in NERDTree
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>

"   <Space> - PageDown
"   -       - PageUp
noremap <Space> <PageDown>
noremap - <PageUp>

" Quick window switching
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" === coc.nvim === "
"   <leader>dd    - Jump to definition of current symbol
"   <leader>dr    - Jump to references of current symbol
"   <leader>dj    - Jump to implementation of current symbol
"   <leader>ds    - Fuzzy search current project symbols
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)
nnoremap <silent> <leader>ds :<C-u>CocList -I -N --top symbols<CR>

" === vim-better-whitespace === "
"   <leader>y - Automatically remove trailing whitespace
nmap <leader>y :StripWhitespace<CR>

" === Search shorcuts === "
"   <leader>h - Find and replace
"   <leader>/ - Clear highlighted search terms while preserving history
map <leader>h :%s///<left><left>
nmap <silent> <leader>/ :nohlsearch<CR>

" === Easy-motion shortcuts ==="
" Disable default mappings
" let g:EasyMotion_do_mapping = 0

" Setting up <Leader> key for easymotion
map <Leader> <Plug>(easymotion-prefix)

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding. `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)

" Enable 'dot' repeat feature
omap z <Plug>(easymotion-t)
let g:EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf;'

" Lazy targeting
let g:EasyMotion_smartcase = 1

" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ;'

" === vim-jsdoc shortcuts ==="
" Generate jsdoc for function under cursor
nmap <leader>z :JsDoc<CR>

" === undotree ==="
nnoremap <Leader>u :UndotreeToggle<cr>

" === Little usability improvements ==="

" Allows you to save files you opened without write permissions via sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!
" cmap w!! w !sudo tee %

" Delete current visual selection and dump in black hole buffer before pasting
" Used when you want to paste over something without it getting copied to
" Vim's default buffer
vnoremap <leader>p "_dP

"" Clean search (highlight)
nnoremap <silent> <leader><space> :noh<cr>

" Make {motion} text uppercase in INSERT mode.
map! <C-F> <Esc>gUiw`]a

" When change some text delete the source without affecting the normal
" registers ("_ is a "black hole" register).
" nnoreMap c "_c

" Repeat latest f, t, F or T in opposite direction
noremap \ ,

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

" >>> Instead of that use a dot '.' command <<<
"" Vmap for maintain Visual Mode after shifting > and <
" vmap < <gv
" vmap > >gv

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

" >>> Use unimpaired.vim keybindings <<<
" nnoremap <silent> [b :bprevious<CR>
" nnoremap <silent> ]b :bnext<CR>
" nnoremap <silent> [B :bfirst<CR>
" nnoremap <silent> ]B :blast<CR>

" Automaticaly jump to end of pasted text
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Enable soft wraping text
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

" ============================================================================ "
" ===                                 MISC.                                === "
" ============================================================================ "

" Automaticaly close nvim if NERDTree is only thing left open
augroup close-nerdtree
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END

" Automaticaly open NERDTree when you're starting vim/nvim with no command
" line arguments
augroup open-nerdtree
  autocmd!
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
augroup END

" === Search === "
" Turning On Neovim built-in feature inccommand, to live preview the
" :substitute command
if has("nvim")
  set inccommand=nosplit
endif

" ignore case when searching
set ignorecase

" if the search string has an upper case letter in it, the search will be case sensitive
set smartcase

" Automatically re-read file if a change was detected outside of vim
set autoread

" Set backups
if has('persistent_undo')
  set undofile
  set undolevels=3000
  set undoreload=10000
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
