" get control-j back, so switch it with ctrl-n at qwerty position of j
imap <c-n> <cr>
cmap <c-n> <cr>
inoremap <c-j> <c-n>
cnoremap <c-j> <c-n>

" rotate some keys about to get qwerty "hjkl" back for movement
map n <down>
map e <up>
map i <right>

" move these keys to their qwerty positions because they are
" in the way of hjkl (and E for J)
noremap k n
noremap K N
noremap u i
noremap U I
noremap l u
noremap L U
noremap N J
noremap E K
noremap I L

" this is the only key that isn't in qwerty or colemak position
noremap j e
noremap J E

" window movement
nnoremap <c-w>n <c-w>j
nnoremap <c-w>i <c-w>l
nnoremap <c-w>e <c-w>k

" qwerty <c-w>n and <c-w>i stolen but do nothing so map back
nnoremap <c-w>k <c-w>n
nnoremap <c-w>l <c-w>i

" pentadactyl binds ctrl-h to history otherwise
map <c-h> <BS>
cmap <c-h> <BS>

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
let foldermethod="indent"
set colorcolumn=80

call plug#begin('~/.vim/plugged')
" Airline (bar below)
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" GruvBox theme
Plug 'morhetz/gruvbox'

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

" Greet screen and sessions manager
Plug 'mhinz/vim-startify'

" Icons for different plugins on vim
Plug 'ryanoasis/vim-devicons'
call plug#end()

" colorscheme gruvbox
autocmd vimenter * ++nested colorscheme gruvbox

let mapleader = " "

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

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Delete keybindings for startify
autocmd User Startified for key in ['n', 'e', 'i', 'N'] |
      \ execute 'nunmap <buffer>' key | endfor

lua <<EOF
require("which-key").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
EOF
