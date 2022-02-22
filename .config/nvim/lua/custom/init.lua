require "custom.plugins.autocmds"

-- Please check NvChad docs if you're totally new to nvchad + dont know lua!!
-- This is an example init file in /lua/custom/
-- this init.lua can load stuffs etc too so treat it like your ~/.config/nvim/

-- Leader key is ','
vim.g.mapleader = ","

-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")
-- NOTE: the 4th argument in the map function can be a table i.e options but its most likely un-needed so dont worry about it

map("n", "'", ",")
map("n", "Y", "y$")
map("v", "Y", "<Esc>y$gv")
map("n", "J", "mzJ`z")
map("n", "<leader>", "<cmd>w<CR>")

-- TODO: this does't work I need to find why
-- Quick save
--  map("n", "<leader>,", ":w<CR>")

-- Move selected line / block of text in visual mode
map("x", "K", ":move '<-2<CR>gv=gv")
map("x", "J", ":move '>+1<CR>gv=gv")

-- Packer.nvim shortcut to update all plugins
vim.cmd [[command! PU PackerUpdate]]

-- Select last pasted text
map("n", "gV", "'`[' . strpart(getregtype(), 0, 1) . '`]'", { expr = true })

-- Allows you to save files you opened without write permissions via sudo
vim.cmd [[cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]]

-- Enable soft wrapping text
vim.cmd [[command! -nargs=* Wrap set wrap linebreak nolist]]

-- easy expansion of the active file directory
map("c", "%%", "<C-r>=fnameescape(expand('%:h')).'/'<CR>", { silent = false })
map("", "<leader>ew", ":e %%", { noremap = false, silent = false })
map("", "<leader>es", ":sp %%", { noremap = false, silent = false })
map("", "<leader>ev", ":vsp %%", { noremap = false, silent = false })
map("", "<leader>et", ":tabe %%", { noremap = false, silent = false })

-- Set working directory to the current buffer's directory
map("n", "cd", ":lcd %:p:h<bar>lua print('current directory is ' .. vim.fn.getcwd())<CR>", { silent = false })
map("n", "cu", "..<bar>pwd<CR>", { silent = false })

-- Make {motion} text uppercase in INSERT mode.
map("!", "<C-f>", "<Esc>gUiw`]a", { noremap = false })

-- Easier way to use of :ls command
map("n", "<leader>l", ":ls<CR>:b<Space>", { silent = false })

-- Automatically jump to the end of the pasted text
map("v", "y", "y`]")
map("v", "p", "p`]")
map("n", "p", "p`]")

-- Keep the flags from the previous substitute command for normal an visual mode
map("n", "&", ":&&<CR>", { silent = false })
map("x", "&", ":&&<CR>", { silent = false })

-- Search mappings: these will make it so that going to the next one in a
-- search will center on the line it's found in.
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Hop
map("n", "s", "<cmd>HopChar1<CR>", { noremap = false, silent = false })

map("", "<leader>/", "<cmd>HopPattern<CR>")

map(
  "o",
  "f",
  "<cmd>lua require'hop'.hint_char1({ current_line_only = true, inclusive_jump = true })<CR>",
  { noremap = true }
)

map("o", "t", "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<CR>", { noremap = true })

map("o", "z", "<cmd>lua require'hop'.hint_char1()<CR>", { noremap = true })

-- Fugitive
map("n", "<leader>gs", "<cmd>Git <CR>")
map("n", "<leader>gb", "<cmd>Git blame <CR>")
map("n", "<leader>gh", "<cmd>diffget //2 <CR>")
map("n", "<leader>gl", "<cmd>diffget //3 <CR>")

-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event','cmd' fields)
-- see: https://github.com/wbthomason/packer.nvim
-- https://nvchad.github.io/config/walkthrough
