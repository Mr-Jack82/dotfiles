-- Leader key to ','
vim.g.mapleader = ','

-- Install packer
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

execute 'packadd packer.nvim'

vim.api.nvim_exec([[
  augroup Packer
    autocmd!
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]],
  false
)

-- Autoloading Lua modules as of 24.03.2021 is still work in progress
-- https://github.com/neovim/neovim/issues/12670
-- So I need to require this modules manually

-- Install plugins
require("plugins")

-- Basic options
require("options")

-- Load plugins settings
require("config")

-- Load LSP related settings
require("lsp")

-- Reload icons after init source
if vim.fn.exists('g:loaded_webdevicons') == 1 then
  vim.call ['webdevicons#refresh']()
end

-- Prevent Neovim from nesting inside of a terminal buffer
--if has('nvim') && executable('nvr')
 -- let $VISUAL="nvr -cc split --remote-wait + 'set bufhidden=wipe'"
--endif
