local use = require('packer').use
return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- Lua Guide for Neovim
  use 'nanotee/nvim-lua-guide'

  -- Editing plugins
  use 'junegunn/vim-easy-align'
  use 'ntpeters/vim-better-whitespace'
  use '907th/vim-auto-save'
  use 'b3nj5m1n/kommentary'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-abolish'
  use 'windwp/nvim-autopairs'
  use 'tommcdo/vim-exchange'
  use 'editorconfig/editorconfig-vim'
  use { 'mbbill/undotree', opt = true, cmd = 'UndotreeToggle' }
  use 'tpope/vim-obsession'

  -- Code completion, snippets
  use 'hrsh7th/nvim-compe'
  use 'hrsh7th/vim-vsnip'
  use "rafamadriz/friendly-snippets"
  use 'mattn/emmet-vim'

  -- Syntax highlighting
  -- this one may conflict with treesitter
  use 'sheerun/vim-polyglot'

  -- Searching and moving
  -- use 'easymotion/vim-easymotion'
  use 'phaazon/hop.nvim'
  use 'tpope/vim-unimpaired'
  use {
    'andymass/vim-matchup',
    ft = { 'html', 'javascript', 'json', 'xml'}
  }
  use 'christoomey/vim-tmux-navigator'
  use {'nvim-telescope/telescope.nvim',
  requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  use 'kyazdani42/nvim-tree.lua'

  -- UI, colorscheme, icons
  use 'morhetz/gruvbox'
  use { 'dracula/vim', as = 'dracula' }
  use 'mhartington/oceanic-next'
  use 'glepnir/spaceline.vim'
  use 'norcalli/nvim-colorizer.lua'

  use 'kyazdani42/nvim-web-devicons'
  use 'ryanoasis/vim-devicons'
  use 'onsails/lspkind-nvim'
  use { 'lukas-reineke/indent-blankline.nvim', branch = 'lua'}

  -- LSP
  use 'neovim/nvim-lspconfig'
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use 'nvim-treesitter/nvim-treesitter-refactor'
  use 'nvim-treesitter/playground'
end)
