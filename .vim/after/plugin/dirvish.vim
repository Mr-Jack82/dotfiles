let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1

" nmap <silent><leader>d :wincmd v<bar> :Dirvish <bar> :vertical resize 30<CR>
nmap <leader>d <plug>(dirvish_vsplit_up)

function! OpenTree(flags)
  let flags = ( a:flags != '' ? ('-'.a:flags) : '' )
  let target = trim(getline('.'), '\') " Remove the ending separator or tree won't work with double quotes
  let filename = fnamemodify(target,':t')
  vnew | set buftype=nofile nowrap
  set conceallevel=3 concealcursor=n | syn match Todo /\v(\a|\:|\\|\/|\.)*(\/|\\)/ conceal
  nnoremap <buffer> yy $"by$

  let cmd = printf('silent read !tree --noreport -I "bin|obj" "%s" %s', target, flags)
  exec(cmd)
  %s,\\,/,ge
  normal! gg"_dd
endfunction

augroup dirvish_config
  autocmd!

  let g:dirvish_mode = ':sort ,^.*[\/],'
	set splitright                     " to control dirvish preview option
  " Map `t` to open in new tab.
  autocmd FileType dirvish
        \  nnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>
        \ |xnoremap <silent><buffer> t :call dirvish#open('tabedit', 0)<CR>

  " Map `gr` to reload.
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gr :<C-U>Dirvish %<CR>

  " Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
  autocmd FileType dirvish nnoremap <silent><buffer>
        \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>


  autocmd FileType dirvish nnoremap <silent> <buffer> t :call OpenTree('')<CR>
  autocmd FileType dirvish nnoremap <buffer> T :call OpenTree('df')<left><left><left>
augroup END

autocmd FileType sh nmap <buffer> <leader> <leader>Z Z!
