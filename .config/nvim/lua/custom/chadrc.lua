-- This is an example chadrc file, its supposed to be placed in /lua/custom/

local M = {}
M.options, M.ui, M.mappings, M.plugins = {}, {}, {}, {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "gruvchad",
}
--------------------------------------------------------------------

M.options = {
  -- move 'mapleader' to init.lua because of an error that throw that script
  relativenumber = true,
  cmdheight = 2,
  textwidth = 80,
  colorcolumn = "81",
  scrolloff = 8,
  showmode = false,
}

-- That script is attempt to register every option with the available editor
-- option table (see :h vim.opt for more info) and if it can't find the right
-- place to set the option, it will display the error message.
-- taken from @Esequiel378 https://github.com/NvChad/NvChad/issues/560
for option, value in pairs(M.options) do
  local opts = { vim.opt, vim.o, vim.bo, vim.wo, vim.go }

  for index, opt in ipairs(opts) do
    local _, optError = pcall(function () opt[option] = value end)

    if index == 4 and optError then
      print(optError)
    elseif optError then
    else
      break
    end
  end
end

-- Install plugins
local userPlugins = require "custom.plugins"

-- NvChad included plugin options & overrides
M.plugins = {
  install = userPlugins,
   -- enable/disable plugins (false for disable)
   status = {
      colorizer = true, -- color RGB, HEX, CSS, NAME color codes
      alpha = true,
      snippets = true,
   },
   options = {
        lspconfig = {
          setup_lspconf = "custom.plugins.lspconfig",
        },
   },
   -- To change the Packer `config` of a plugin that comes with NvChad,
   -- add a table entry below matching the plugin github name
   --              '-' -> '_', remove any '.lua', '.nvim' extensions
   -- this string will be called in a `require`
   --              use "(custom.configs).my_func()" to call a function
   --              use "custom.blankline" to call a file
   default_plugin_config_replace = {
      nvim_tree = "custom.plugins.nvimtree",
      indent_blankline = "custom.plugins.indentLine",
      nvim_treesitter  = "custom.plugins.treesitter",
   },
}

M.mappings.plugins = {
   nvimtree = {
      toggle = "<leader>n",
      focus = "<leader>e",
   },
}

return M
