nnoremap <leader>p           :Files<cr>
nnoremap <leader>.           :Tags<cr>
nnoremap <leader>b           :Buffers<cr>
nnoremap <silent> <leader>'  :Marks<cr>
nnoremap <silent> <Leader>L  :Lines<cr>

" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
let g:fzf_preview_window = ['right:50%', 'ctrl-/']


" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '40%' }

" Hide statusline.
" It's a good combo with `{ 'down': '40%' }` layout
if has('nvim') && !exists('g:fzf_layout')
  autocmd! FileType fzf
  autocmd  FileType fzf set laststatus=0 noshowmode noruler
    \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
endif

" Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)
