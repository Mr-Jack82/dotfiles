-- Enable syntax highlight for Lua in .vim files
vim.g.vimsyn_embed = "l"

-- String-encoding used internally and for |RPC| communication.
vim.o.encoding = 'utf-8'

-- TODO: I need to find a Lua way to write this
-- vim.o.scriptencoding = 'utf-8'
-- vim.cmd("scriptencoding = utf-8")

-- Show the line number relative to the line with the cursor in front of
-- each line.
vim.wo.number = true
vim.wo.relativenumber = true

-- Show (partial) command in the last line of the screen.
vim.o.showcmd = true

-- Yank and paste with the system clipboard
vim.o.clipboard = 'unnamedplus'

-- Set wildignore
vim.o.wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif, *.zip,**/tmp/**,*.DS_Store,**/node_modules/**"
-- Enable mouse support in all modes.
vim.o.mouse = 'a'

-- Minimal number of screen lines to keep above and below the cursor.
vim.o.scrolloff = 7

-- Making scrolling horizontally a bit more useful
vim.o.sidescroll = 5
vim.cmd('set listchars+=precedes:<,extends:>')

-- Make it obvious where 80 characters is
vim.bo.textwidth = 80
vim.wo.colorcolumn = "81"

-- Hides buffers instead of closing them
vim.o.hidden = true

-- You will have bad experience for diagnostic messages when it's default 4000.
vim.o.updatetime = 50

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appear/become resolved.
vim.wo.signcolumn = 'number'

vim.wo.numberwidth = 5

-- Set Python3 provider as of Neovim is recommend
vim.cmd[[let g:python3_host_prog = '/usr/bin/python3']]

-- =====[ TAB/Space settings ]=====

-- default indentation: 2 spaces
vim.bo.softtabstop = 2;
vim.bo.tabstop = 2; vim.o.tabstop = 2
vim.bo.shiftwidth = 2; vim.o.shiftwidth = 2
vim.bo.expandtab = true; vim.o.expandtab = true

-- do not wrap long lines by default
vim.wo.wrap = false

-- Don't highlight current cursor line
vim.wo.cursorline = false

-- Disable line/column number in status line
-- Shows up in preview window when airline is disabled if not
vim.o.ruler = false

-- Only one line for command line
vim.o.cmdheight = 2

-- Don't give completion messages like 'match 1 of 2'
-- or 'The only match'
vim.cmd('set shortmess+=c')

-- Do smart autoindenting when starting a new line.
vim.bo.smartindent = true

-- Fix spelling errors
vim.cmd('iabbrev cosnt const')

-- Set preview window to appear at bottom
vim.o.splitbelow = true

-- Don't dispay mode in command line (airilne already shows it)
vim.o.showmode = false

-- Set a WildMenu in old style
vim.o.wildoptions = ""

-- =====[ Search ]=====
-- Turning On Neovim built-in feature inccommand, to live preview the
-- :substitute command
vim.o.inccommand = "nosplit"

-- ignore case when searching
vim.o.ignorecase = true

-- if the search string has an upper case letter in it, the search will be case
-- sensitive
vim.o.smartcase = true

-- Automatically re-read file if a change was detected outside of vim
vim.bo.autoread = true

-- Set backups
vim.bo.undofile = true
vim.bo.undolevels = 3000

-- TODO: I need to find a Lua way to write this
-- vim.cmd[['set backupdir=~/.local/share/nvim/backup']]

-- TODO: `backup` it is global or what?
-- vim.o.backup = false

vim.bo.swapfile = false

-- Editor theme
vim.o.termguicolors = true
vim.cmd('colorscheme gruvbox')
-- For gruvbox specifically
vim.o.background = "dark"

-- Setting up font for Neovide
vim.o.guifont="Hack Nerd Font Mono:h16"

-- Make it more obvious where 'ColorColumn' is
vim.cmd('highlight ColorColumn guibg=SlateBlue3')

Theming = {
    -- Press <space>fc to see all available themes
    colorscheme = "edge",
    --[[ Some colorscheme have multiple styles to choose from.
      here are the available options:
      For @gruvbox = medium, soft, hard
      For @edge = default, aura, neon
      For @sonokai = default, atlantis, andromeda, shusia, maia ]]
    colorscheme_style = "aura",
    -- Choose a stulusline:
    -- Options: galaxy, airline, eviline, gruvbox, minimal, rounded
    statusline = "eviline"
}

LSP = {
    -- values: true, false
    -- Enable or disable LSP globally
    enabled = true,
    -- Choose which servers to start automatically
    bash = true,
    clangd = true,
    css = true,
    emmet = true,
    json = true,
    lua = false,
    python = true,
    tsserver = true
}

Completion = {
    -- values: true, false
    -- Enable or disable completion globally
    enabled = true,
    items = 10,
    -- Choose sources of completion
    snippets = true,
    lsp = true,
    buffer = true,
    path = true,
    calc = true,
    spell = true
}

Treesitter = {
    -- Treesitter has big performance issues, choose to enable or not
    enabled = true,
    rainbow = true,
    autotag = true
}
