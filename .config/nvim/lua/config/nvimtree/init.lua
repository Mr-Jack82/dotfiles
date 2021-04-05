-- empty by default
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }

-- 1 by default, disables netrw
vim.g.nvim_tree_disable_netrw = 0

-- 0 by default, opens the tree when typing `vim $DIR` or `vim`
vim.g.nvim_tree_auto_open = 1

-- 0 by default, closes the tree when it's the last window
vim.g.nvim_tree_auto_close = 0

-- 0 by default, closes the tree when open a file
vim.g.nvim_tree_quit_on_open = 1

-- 0 by default, this option allows the cursor to be updated when entering a
-- buffer
vim.g.nvim_tree_follow = 1

-- 0 by default, this option shows indent markers when folders are open
vim.g.nvim_tree_indent_markers = 1

-- 0 by default, this option hides files and folders starting with a dot `.`
vim.g.nvim_tree_hide_dotfiles = 1

-- 0 by default, will enable file highlight for git attributes (can be used
-- without the icons)
vim.g.nvim_tree_git_hl = 1

-- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_root_folder_modifier = ":~"

-- 0 by default, will open the tree when entering a new tab and the tree was
-- previously open
vim.g.nvim_tree_tab_open = 1

-- 0 by default, will not resize the tree when opening a file
vim.g.nvim_tree_allow_resize = 1

vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1
}

vim.g.nvim_tree_icons = {
    default = '',
    symlink = '',
    git = {
        unstaged = "",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "✗"
    },
    folder = {
        default = "",
        open = "",
        empty = "",
        empty_open = "",
        symlink = ""
    }
}

-- Toggle NvimTree on `,n`
vim.api.nvim_set_keymap(
    "n",
    "<Leader>n",
    "<CMD>NvimTreeToggle<CR>",
    {
        noremap = true,
        silent = true
    }
)

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
    -- mappings
    ["<CR>"] = tree_cb("edit"),
    ["l"] = tree_cb("edit"),
    ["o"] = tree_cb("edit"),
    ["<2-LeftMouse>"] = tree_cb("edit"),
    ["<2-RightMouse>"] = tree_cb("cd"),
    ["<C-]>"] = tree_cb("cd"),
    ["v"] = tree_cb("vsplit"),
    ["s"] = tree_cb("split"),
    ["<C-t>"] = tree_cb("tabnew"),
    ["h"] = tree_cb("close_node"),
    ["<BS>"] = tree_cb("close_node"),
    ["<S-CR>"] = tree_cb("close_node"),
    ["<Tab>"] = tree_cb("preview"),
    ["I"] = tree_cb("toggle_ignored"),
    ["H"] = tree_cb("toggle_dotfiles"),
    ["R"] = tree_cb("refresh"),
    ["a"] = tree_cb("create"),
    ["d"] = tree_cb("remove"),
    ["r"] = tree_cb("rename"),
    ["<C-r>"] = tree_cb("full_rename"),
    ["x"] = tree_cb("cut"),
    ["c"] = tree_cb("copy"),
    ["p"] = tree_cb("paste"),
    ["[c"] = tree_cb("prev_git_item"),
    ["]c"] = tree_cb("next_git_item"),
    ["-"] = tree_cb("dir_up"),
    ["q"] = tree_cb("close")
}
