" source of this config is https://github.com/ctaylo21/jarvis
" also read his article "A guide to modern Web Development with (Neo)vim"
" https://www.freecodecamp.org/news/a-guide-to-modern-web-development-with-neo-vim-333f7efbf8e2/

" ============================================================================ "
" ===                               PLUGINS                                === "
" ============================================================================ "

" check whether vim-plug is installed and install it if necessary
let plugpath = expand('<sfile>:p:h'). '/autoload/plug.vim'
if !filereadable(plugpath)
    if executable('curl')
        let plugurl = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        call system('curl -fLo ' . shellescape(plugpath) . ' --create-dirs ' . plugurl)
        if v:shell_error
            echom "Error downloading vim-plug. Please install it manually.\n"
            exit
        endif
    else
        echom "vim-plug not installed. Please install it manually or install curl.\n"
        exit
    endif
endif

call plug#begin('~/.config/nvim/plugged')

" Minimalist Vim Plugin Manager
Plug 'junegunn/vim-plug'

" === Editing Plugins === "
" Trailing whitespace highlighting & automatic fixing
Plug 'ntpeters/vim-better-whitespace'

" Multiple cursors like in Sublime Text
Plug 'terryma/vim-multiple-cursors'

" Vim plugin for intensely orgasmic commenting
" Plug 'scrooloose/nerdcommenter'

" Comment stuff out
Plug 'tpope/vim-commentary'

" A Vim alignment plugin
Plug 'junegunn/vim-easy-align'

" Quoting/parenthesizing made simple
Plug 'tpope/vim-surround'

" ghetto HTML/XML mappings (formerly allml.vim)
Plug 'tpope/vim-ragtag'

" Heuristically set buffer options
Plug 'tpope/vim-sleuth'

" Automatically save changes to disk in Vim
Plug '907th/vim-auto-save'

" Enable repeating supported plugin maps with "."
Plug 'tpope/vim-repeat'

" A Vim Plugin for indicating changes as colored bars using signs.
Plug 'chrisbra/changesPlugin'

" Easily search for, substitute, and abbreviate multiple variants of a word
Plug 'tpope/vim-abolish'

" auto-close plugin
" Plug 'rstacruz/vim-closer'
Plug 'jiangmiao/auto-pairs'

" Improved motion in Vim
Plug 'easymotion/vim-easymotion'

" Pairs of handy bracket mappings
Plug 'tpope/vim-unimpaired'

" A vim plugin to display the indention levels with thin vertical lines
Plug 'Yggdroot/indentLine'

" The undo history visualizer for Vim
Plug 'mbbill/undotree'

" Easy text exchange operator for Vim
Plug 'tommcdo/vim-exchange'

" vim match-up: even better % fist_oncoming navigate and highlight
" matching words fist_oncoming modern matchit and matchparen replacement
Plug 'andymass/vim-matchup', { 'for':
    \  ['dart', 'eruby', 'html', 'javascript', 'json', 'xml']
    \}

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tmux/Neovim movement integration
Plug 'christoomey/vim-tmux-navigator'

" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim'

" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

" === Git Plugins === "
" Enable git changes to be shown in sign column
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "

" Syntax highlighting for nginx
Plug 'chr4/nginx.vim'

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" A better JSON for Vim: distinct highlighting of keywords
" vs values, JSON-specific (non-JS) warnings, quote concealing
Plug 'elzr/vim-json'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'

" === UI === "
" File explorer
Plug 'scrooloose/nerdtree'

" Colorscheme
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim'
Plug 'Badacadabra/vim-archery'

" Customized vim status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Icons
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" vim plugin for automatic keyboard layout switching in insert mode
Plug 'lyokha/vim-xkbswitch'

" Initialize plugin system
call plug#end()
