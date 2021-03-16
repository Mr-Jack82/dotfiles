" This is an example from Github page and needed to edit properly
" from Vimcast #61
nnoremap <silent> <Plug>TransposeCharacters xp
      \:call repeat#set("\<Plug>TransposeCharacters")<CR>
nmap cp <Plug>TransposeCharacters
