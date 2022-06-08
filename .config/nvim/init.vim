" Map Colemak keys in alphabetical order.
noremap d g
noremap e k
noremap f e
noremap g t
noremap i l
noremap j y
noremap k n
noremap l u
noremap n j
noremap o p
noremap p r
noremap r s
noremap s d
noremap t f
noremap u i
noremap y o
noremap D G
noremap E K
noremap F E
noremap G T
noremap I L
noremap J Y
noremap K N
noremap L U
noremap N J
noremap O P
noremap P R
noremap R S
noremap S D
noremap T F
noremap U I
noremap Y O

" For exiting easily from a terminal
tnoremap <Esc> <C-\><C-n>

set exrc
set relativenumber                 " Allow relative numbers on the left
set nohlsearch                     " Disable the search highlighting 
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set hidden 
set nu
set incsearch
set scrolloff=5                    " Set 8 lines before moving with the bottom and top part
set signcolumn=yes
set wildmenu
set encoding=utf8                  " Set the encoding for the files
set nobackup
set nowb
set noswapfile
set clipboard=unnamedplus          " Changes clipboard memory for the same with the system
set mouse=a                        " Allow usage of mouse for selecting text.
set showcmd                        " Show commands I'm using
set ruler                          " Allow number of lines for vim
set showmatch                      " Allow parenthesis matching for vim
set laststatus=2                   " The bar bellow is always visbible on vim
set cursorline                     " Highlight current cursorline
set termguicolors
set timeoutlen=500
set shell=fish                     " Sets fish as nvim shell for terminals

call plug#begin('~/.vim/plugged')

" Telescope Stuff
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
Plug 'kyazdani42/nvim-web-devicons'

" coc for autocompletition. Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Airline (bar below)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Nerdtree
Plug 'preservim/nerdtree'
" Git for nerdtree
Plug 'preservim/nerdtree' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

" Dracula theme
Plug 'dracula/vim', { 'as': 'dracula' }

" GruvBox theme
Plug 'morhetz/gruvbox'

" Nord theme
Plug 'arcticicestudio/nord-vim'

" Another Nord theme
" Plug 'shaunsingh/nord.nvim'

" EasyMotion
Plug 'easymotion/vim-easymotion'

" Auto close () {} [] 
Plug 'jiangmiao/auto-pairs'

" For commenting easily with gcc
Plug 'tpope/vim-commentary'

" Seeing which keys can I use with the leader key
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" Shows which key can be preesed after certain keys
Plug 'folke/which-key.nvim'

" Toggling a useful terminal
Plug 'akinsho/toggleterm.nvim'

" Greet screen and sessions manager
Plug 'mhinz/vim-startify'

" Icons for different plugins on vim
Plug 'ryanoasis/vim-devicons'
call plug#end()

" colorscheme dracula
autocmd vimenter * ++nested colorscheme gruvbox

" set Vim-specific sequences for RGB colors
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" let g:nord_italic = 1
" let g:nord_italic_comments = 1
" let g:nord_underline = 1
" let g:nord_cursor_line_number_background = 1

" colorscheme nord

let mapleader = " "

" Telescope maps
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Nerdtree  
map <leader>nt :NERDTreeToggle<cr>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

let NERDTreeMapOpenExpl='x'
let NERDTreeMenuDown="e"

let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }

" EasyMotion
nmap <leader>s <Plug>(easymotion-s2)

" Save fast
nmap <leader>w :w!<cr>

" For spawning the new split how they should be
set splitbelow splitright

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)

" Changing sizes with the arrow keys
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" Jumping around
noremap N <C-d>
noremap E <C-u>

" Open manpages
noremap <silent> <leader>m K

" Close the current buffer
map <silent> <leader>bd :bd<cr>

map <silent> <leader>i :bnext<cr>
map <silent> <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>th :-tabnext<cr>
map <leader>ti :+tabnext<cr>

" Toogle terminal
nmap <silent> <leader>tt :ToggleTerm size=5 direction=~/Desktop direction=horizontal<CR>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


lua <<EOF
require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "lua", "rust", "python" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}

require("toggleterm").setup{
    -- size can be a number or function which is passed the current terminal
    -- size = 20 | function(term)
    --     if term.direction == "horizontal" then
    --         return 15
    --     elseif term.direction == "vertical" then
    --         return vim.o.columns * 0.4
    --     end
    --end,
    close_on_exit = true,
}
EOF
