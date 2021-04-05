" Automatically generated packer.nvim plugin loader code

if !has('nvim-0.5')
  echohl WarningMsg
  echom "Invalid Neovim version for packer.nvim!"
  echohl None
  finish
endif

packadd packer.nvim

try

lua << END
local package_path_str = "/home/leeroy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/leeroy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/leeroy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/leeroy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/leeroy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    print('Error running ' .. component .. ' for ' .. name)
    error(result)
  end
  return result
end

_G.packer_plugins = {
  dracula = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/dracula"
  },
  ["editorconfig-vim"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/editorconfig-vim"
  },
  ["emmet-vim"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/emmet-vim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  gruvbox = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["hop.nvim"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/hop.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
  },
  kommentary = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["nvim-autopairs"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lua-guide"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/nvim-lua-guide"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-treesitter-refactor"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/nvim-treesitter-refactor"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["oceanic-next"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/oceanic-next"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  playground = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/playground"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["spaceline.vim"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/spaceline.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    loaded = false,
    needs_bufread = false,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-abolish"
  },
  ["vim-auto-save"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-auto-save"
  },
  ["vim-better-whitespace"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-better-whitespace"
  },
  ["vim-devicons"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-devicons"
  },
  ["vim-easy-align"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-easy-align"
  },
  ["vim-exchange"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-exchange"
  },
  ["vim-matchup"] = {
    after_files = { "/home/leeroy/.local/share/nvim/site/pack/packer/opt/vim-matchup/after/plugin/matchit.vim" },
    loaded = false,
    needs_bufread = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/opt/vim-matchup"
  },
  ["vim-obsession"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-obsession"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-unimpaired"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-unimpaired"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/home/leeroy/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  }
}


-- Command lazy-loads
vim.cmd [[command! -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
vim.cmd [[au FileType json ++once lua require("packer.load")({'vim-matchup'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType xml ++once lua require("packer.load")({'vim-matchup'}, { ft = "xml" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'vim-matchup'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'vim-matchup'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd("augroup END")
END

catch
  echohl ErrorMsg
  echom "Error in packer_compiled: " .. v:exception
  echom "Please check your config for correctness"
  echohl None
endtry
