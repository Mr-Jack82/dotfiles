return {
  { "tpope/vim-surround" },
  { "tpope/vim-repeat" },

  { "tpope/vim-unimpaired",
    keys = { "[", "]" },
  },

  { "junegunn/vim-easy-align" },
  { "editorconfig/editorconfig-vim" },

  { "phaazon/hop.nvim",
    branch = 'v1',
    config = function()
      require'hop'.setup {
        uppercase_labels = true,
      }
    end,
  },

  { "tommcdo/vim-exchange", 
    keys = { { "n", "cx" }, { "v", "X" } }
  },

  { "907th/vim-auto-save" },
  { "christoomey/vim-tmux-navigator" },

  { "tpope/vim-fugitive", 
    cmd = {
      "Git",
      "Gdiff",
      "Gdiffsplit",
      "Gwrite",
      "Gw",
    },
  },

  { "williamboman/nvim-lsp-installer" },
  { "turbio/bracey.vim" },

  { "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        ignore = "^$",
      })
    end,
  },
}
