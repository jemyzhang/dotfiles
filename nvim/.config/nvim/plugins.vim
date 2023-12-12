call plug#begin(get(g:, 'plugins_install_path', "~/.vim/plugins"))
" themes
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'

Plug 'junegunn/fzf', { 'do': {-> fzf#install()} }
Plug 'junegunn/fzf.vim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/nvim-treesitter-refactor'
Plug 'romgrk/nvim-treesitter-context' " show context

Plug 'p00f/nvim-ts-rainbow' " match braces, require nvim-treesitter

Plug 'voldikss/vim-floaterm', {'on': ['FloatermNew', 'FloatermToggle']}

Plug 'powerman/vim-plugin-AnsiEsc'

Plug 'yazgoo/yank-history'

" c/c++
Plug 'dense-analysis/ale' " Linting
Plug 'rhysd/vim-clang-format'
Plug 'vim-scripts/a.vim'

" explorer
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" git
"Plug 'APZelos/blamer.nvim'

" auto complete
Plug 'neovim/nvim-lspconfig'
Plug 'ms-jpq/coq_nvim', {'branch': 'coq'} " python3-venv, sqlite3, universal-ctags required
Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

" misc
Plug 'simnalamburt/vim-mundo'

" doxygen
Plug 'vim-scripts/DoxygenToolkit.vim'

" Install vim-codefmt and its dependencies
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'

" Install this plugin:
Plug 'https://gn.googlesource.com/gn', { 'rtp': 'misc/vim' }

call plug#end()

" Optional: configure vim-codefmt to autoformat upon saving the buffer.
augroup CodeFmt
  autocmd!
  autocmd FileType gn AutoFormatBuffer gn
  " Other file types...
augroup END

