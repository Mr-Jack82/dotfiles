
-- Remember last cursor position
vim.cmd [[
    augroup cursorPosition
      autocmd!
      autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") &&
        \ &ft !~# '\%(^git\%(config\)\@!\|commit\)'
        \ | exe "normal! g'\""
        \ | endif
    augroup END
]]

vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost *
      \ silent! lua return (not vim.v.event.visual) and
      \ require 'vim.highlight'.on_yank({ higroup="IncSearch", timeout = 150 })
  augroup END
]]
