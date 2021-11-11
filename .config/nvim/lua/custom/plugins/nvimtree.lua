local tree_cb = require("nvim-tree.config").nvim_tree_callback
local present, nvimtree = pcall(require, "nvim-tree")
local git_status = require("core.utils").load_config().plugins.options.nvimtree.enable_git

if not present then
   return
end

local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_add_trailing = 1 -- append a trailing slash to folder names
g.nvim_tree_git_hl = git_status
g.nvim_tree_gitignore = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_highlight_opened_files = 0
g.nvim_tree_indent_markers = 1
g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
g.nvim_tree_quit_on_open = 1 -- closes tree when file's opened
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }
--
g.nvim_tree_show_icons = {
   folders = 1,
   -- folder_arrows= 1
   files = 1,
   git = git_status,
}

g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★",
      ignored = "◌",
   },
   folder = {
      -- disable indent_markers option to get arrows working or if you want both arrows and indent then just add the arrow icons in front            ofthe default and opened folders below!
      -- arrow_open = "",
      -- arrow_closed = "",
      arrow_open = "",
      arrow_closed = "",
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
   },
}

nvimtree.setup {
   diagnostics = {
      enable = false,
      icons = {
         hint = "",
         info = "",
         warning = "",
         error = "",
      },
   },
   -- disables netrw completely
   disable_netrw = true,
   -- hijack netrw window on startup
   hijack_netrw = true,
   -- will not open on setup if the filetype is in this list
   ignore_ft_on_setup = { "dashboard" },
   -- closes neovim automatically when the tree is the last **WINDOW** in the view
   auto_close = true,
   -- opens the tree when changing/opening a new tab if the tree wasn't 
   -- previously opend
   open_on_tab = false,
   -- open the tree when running this setup function
   open_on_setup = true,
   -- hijack the cursor in the tree to put it at the start of the filename
   hijack_cursor = true,
   -- updates the root directory of the tree on `DirChanged` 
   -- (when you run `:cd` usually)
   update_cwd = true,
   -- update the focused file on `BufEnter`, un-collapses the folder recursively
   -- until it finds the file
   update_focused_file = {
      -- enable the feature
      enable = true,
      -- update the root directory of the tree to the one of the folder 
      -- containing the file if the file is not under the current root directory
      -- only relevant when `update_focused_file.enable` is true
      update_cwd = false,
      -- list of buffer names / filetypes that will not update the cwd if the
      -- file isn't found under the current root directory
      -- only relevant when `update_focused_file.update_cwd` is true and `
      -- update_focused_file.enable` is true
      ignore_list = {},
   },
   -- configuration options for the system open command (`s` in the tree by default)
   system_open = {
     -- the command to run this, leaving nil should work in most cases
     cmd = nil,
     -- the command arguments as a list
     args  = {},
   },
   view = {
      -- if true the tree will resize itself after opening a file
      allow_resize = false,
      -- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
      side = "left",
      -- width of the window, can be either a number (columns) or a string in `%`
      width = 30,
      mappings = {
        -- custom only false will merge the list with the default mappings
        -- if true, it will only use your list to set the mappings
        custom_only = false,
        -- list of mappings to set on the tree manually
        list = {
          { key = { "<CR>", "o", "l", "<2-LeftMouse>" }, cb = tree_cb "edit" },
          { key = { "<2-RightMouse>", "C" }, cb = tree_cb "cd" },
          { key = { "<C-v>", "v" }, cb = tree_cb "vsplit" },
          { key = "<C-s>", cb = tree_cb "split" },
          { key = "<C-t>", cb = tree_cb "tabnew" },
          { key = "<", cb = tree_cb "prev_sibling" },
          { key = ">", cb = tree_cb "next_sibling" },
          { key = "P", cb = tree_cb "parent_node" },
          { key = { "<BS>", "h" }, cb = tree_cb "close_node" },
          { key = "<S-CR>", cb = tree_cb "close_node" },
          { key = "<Tab>", cb = tree_cb "preview" },
          { key = "K", cb = tree_cb "first_sibling" },
          { key = "J", cb = tree_cb "last_sibling" },
          { key = "I", cb = tree_cb "toggle_ignored" },
          { key = "H", cb = tree_cb "toggle_dotfiles" },
          { key = "R", cb = tree_cb "refresh" },
          { key = "a", cb = tree_cb "create" },
          { key = "d", cb = tree_cb "remove" },
          { key = "r", cb = tree_cb "rename" },
          { key = "<C-r>", cb = tree_cb "full_rename" },
          { key = "x", cb = tree_cb "cut" },
          { key = "c", cb = tree_cb "copy" },
          { key = "p", cb = tree_cb "paste" },
          { key = "y", cb = tree_cb "copy_name" },
          { key = "Y", cb = tree_cb "copy_path" },
          { key = "gy", cb = tree_cb "copy_absolute_path" },
          { key = "[g", cb = tree_cb "prev_git_item" },
          { key = "]g", cb = tree_cb "next_git_item" },
          { key = "-", cb = tree_cb "dir_up" },
          { key = "q", cb = tree_cb "close" },
          { key = "g?", cb = tree_cb "toggle_help" },
        }
      }
   },
}
