set number
set clipboard+=unnamed

" 80 coloum line
let &colorcolumn=join(range(81,999),",")
hi ColorColumn ctermbg=235 guibg=#2c2d27

call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
"

" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" https://github.com/neoclide/coc.nvim
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" https://github.com/nvim-treesitter/nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" https://github.com/EdenEast/nightfox.nvim
Plug 'EdenEast/nightfox.nvim'

" https://github.com/Mofiqul/dracula.nvim
Plug 'Mofiqul/dracula.nvim'

" https://github.com/nathanaelkane/vim-indent-guides
" Plug 'nathanaelkane/vim-indent-guides'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting

" 気分で変える
"colorscheme nightfox
colorscheme dracula

