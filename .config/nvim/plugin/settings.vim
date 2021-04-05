" Program interface for autocmd and augroup are under development:
" https://github.com/neovim/neovim/pull/12378

" Remember last cursor position
augroup remember-cursor-position
  autocmd!
  autocmd BufReadPost *
        \ if line("'\"") > 1 && line("'\"") <= line("$") &&
        \   &ft !~# '\%(^git\%(config\)\@!\|commit\)'
        \ | exe "normal! g`\""
        \ | endif
augroup END


" Setting up directory for the backup
" TODO: need to rewrite this on Lua when I find a right way
set backupdir=~/.local/share/nvim/backup

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

" Add custom highlights in method that is executed every time a
" colorscheme is sourced
" See https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f for
" details
function! TrailingSpaceHighlights() abort
  " Hightlight trailing whitespace
  highlight Trail ctermbg=red guibg=red
  call matchadd('Trail', '\s\+$', 100)
endfunction

function! s:custom_colors()
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
  autocmd! ColorScheme OceanicNext call s:custom_colors()
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

" When in terminal buffer -> Insert Mode
augroup insert_in_term
  autocmd!
  if has('nvim')
    autocmd!
    autocmd TermOpen,BufEnter term://* startinsert
  endif
augroup END

" Resize splits when the window is resized
augroup on_vim_resized
  autocmd!
  autocmd VimResized * wincmd =
augroup END

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

" Clear all registers with :WipeReg command
command! WipeReg for i in range(34,122) | silent!
      \ call setreg(nr2char(i), []) | endfor

" Highlight on yank
augroup highlight_yank
  if exists('##TextYankPost')
    autocmd!
    autocmd TextYankPost *
          \ silent! lua return (not vim.v.event.visual) and
          \ require'vim.highlight'.on_yank({higroup="IncSearch", timeout = 150})
  endif
augroup END
