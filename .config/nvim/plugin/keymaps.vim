 " I don't see much sence in rewriting key mappings to Lua intil program
 " interface were build:
 " https://github.com/neovim/neovim/pull/13823

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

" Switch buffers with <Tab>
nnoremap <Tab> :bnext<cr>
nnoremap <C-p> :bprev<cr>

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
