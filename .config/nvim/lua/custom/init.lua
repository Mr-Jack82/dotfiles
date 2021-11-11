require "custom.plugins.autocmds"

-- This is where your custom modules and plugins go.
-- See the wiki for a guide on how to extend NvChad

local hooks = require "core.hooks"

-- NOTE: To use this, make a copy with `cp example_init.lua init.lua`

--------------------------------------------------------------------

-- To modify packaged plugin configs, use the overrides functionality
-- if the override does not exist in the plugin config, make or request a PR,
-- or you can override the whole plugin config with 'chadrc' -> M.plugins.default_plugin_config_replace{}
-- this will run your config instead of the NvChad config for the given plugin

-- hooks.override("lsp", "publish_diagnostics", function(current)
--   current.virtual_text = false;
--   return current;
-- end)

-- To add new mappings, use the "setup_mappings" hook,
-- you can set one or many mappings
-- example below:

hooks.add("setup_mappings", function(map)

  map("n", "'", ",")
  map("n", "Y", "y$")
  map("v", "Y", "<Esc>y$gv")
  map("n", "J", "mzJ`z")

  -- TODO: this does't work I need to find why
  -- Quick save
--  map("n", "<leader>,", ":w<CR>")

  -- Move selected line / block of text in visual mode
  map("x", "K", ":move '<-2<CR>gv=gv")
  map("x", "J", ":move '>+1<CR>gv=gv")

  -- Packer.nvim shortcut to update all plugins
  vim.cmd[[command! PU PackerUpdate]]

  -- Select last pasted text
  map("n", "gV", "'`[' . strpart(getregtype(), 0, 1) . '`]'", { expr = true })

  -- Allows you to save files you opened without write permissions via sudo
  vim.cmd[[cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!]]

  -- Enable soft wrapping text
  vim.cmd[[command! -nargs=* Wrap set wrap linebreak nolist]]

  -- easy expansion of the active file directory
  map("c", "%%", "<C-r>=fnameescape(expand('%:h')).'/'<CR>", { silent = false })
  map("", "<leader>ew", ":e %%", { noremap = false, silent = false })
  map("", "<leader>es", ":sp %%", { noremap = false, silent = false })
  map("", "<leader>ev", ":vsp %%", { noremap = false, silent = false })
  map("", "<leader>et", ":tabe %%", { noremap = false, silent = false })

  -- Set working directory to the current buffer's directory
  map(
    "n",
    "cd",
    ":lcd %:p:h<bar>lua print('current directory is ' .. vim.fn.getcwd())<CR>",
    { silent = false }
  )
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
  map(
    "n",
    "s",
    "<cmd>HopChar1<CR>",
    { noremap = false, silent = false }
  )

  map("", "<leader>/", "<cmd>HopPattern<CR>")

  map(
    'o',
    'f',
    "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<CR>",
    { noremap = true }
  )

  map(
    'n',
    'f',
    "<cmd>lua require'hop'.hint_char1({ current_line_only = true })<CR>",
    { noremap = true }
  )

-- Fugitive
map("n", "<leader>gs", "<cmd>Git <CR>")
map("n", "<leader>gb", "<cmd>Git blame <CR>")
map("n", "<leader>gh", "<cmd>diffget //2 <CR>")
map("n", "<leader>gl", "<cmd>diffget //3 <CR>")

--   map("n", "<leader>cc", "gg0vG$d", opt) -- example to delete the buffer
--  .... many more mappings ....
end)

-- To add new plugins, use the "install_plugin" hook,
-- NOTE: we heavily suggest using Packer's lazy loading (with the 'event' field)
-- see: https://github.com/wbthomason/packer.nvim
-- examples below:

hooks.add("install_plugins", function(use)
   use "tpope/vim-surround"
   use "tpope/vim-repeat"
   use {
     "tpope/vim-unimpaired",
     keys = { '[', ']' }
   }
   use "junegunn/vim-easy-align"
   use "editorconfig/editorconfig-vim"
   use {
     "phaazon/hop.nvim",
     config = function()
       require("hop").setup()
     end,
   }
   use { "tommcdo/vim-exchange", keys = { { "n", "cx" }, { "v", "X" } } }
   use {
     "numToStr/Comment.nvim",
     keys = { "gcc", "gc", "gb" },
     config = function()
       require("Comment").setup({
         ignore = "^$",
       })
     end,
   }
   use "907th/vim-auto-save"
   use "christoomey/vim-tmux-navigator"
   use {
     "tpope/vim-fugitive",
     cmd = {
       "Git",
       "Gdiff",
       "Gdiffsplit",
       "Gvdiffsplit",
       "Gwrite",
       "Gw",
     },
   }
   use {
     "williamboman/nvim-lsp-installer",
     config = function()
       local lsp_installer = require "nvim-lsp-installer"

       lsp_installer.on_server_ready(function(server)
         local opts = {}

         server:setup(opts)
         vim.cmd [[ do User LspAttachBuffers ]]
       end)
     end,
   }
   use {
    "turbio/bracey.vim",
    opt = true,
    ft = "html",
    run = "npm install --prefix server",
   }
end)

-- alternatively, put this in a sub-folder like "lua/custom/plugins/mkdir"
-- then source it with

-- require "custom.plugins.mkdir"
