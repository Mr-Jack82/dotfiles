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

" =====[ Shorcuts ]=====
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

" Automaticaly close nvim if NERDTree is only thing left open
augroup close-nerdtree
  autocmd!
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
augroup END
