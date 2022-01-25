" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    Plug 'arcticicestudio/nord-vim'
    Plug 'joshdick/onedark.vim'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'gruvbox-community/gruvbox'
    Plug 'EdenEast/nightfox.nvim'

    Plug 'windwp/nvim-autopairs'
    Plug 'tpope/vim-fugitive'
    Plug 'airblade/vim-gitgutter'
    Plug 'mhinz/vim-startify'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'hrsh7th/vim-vsnip'
    Plug 'hrsh7th/vim-vsnip-integ'
    Plug 'hashivim/vim-terraform'
    Plug 'kyazdani42/nvim-web-devicons' " for file icons
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'hoob3rt/lualine.nvim'
    Plug 'pangloss/vim-javascript'
    Plug 'mxw/vim-jsx'
    Plug 'evanleck/vim-svelte', {'branch': 'main'}
    Plug 'williamboman/nvim-lsp-installer'

call plug#end()


" CONFIG
"set leader key
let g:mapleader = ' '

syntax enable                           " Enables syntax highlighing
set termguicolors
colorscheme nightfox
" let g:gruvbox_contrast_dark = "medium"
highlight Comment cterm=italic gui=italic

set backspace=indent,eol,start          " Make backspace behave like every other editor.
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=1                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set shortmess+=c                        " Don't pass messages to ins-completion-menu.
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set guioptions-=e

if !exists('g:vscode')
  set noshowmode                          " We don't need to see things like -- INSERT -- anymore
endif

hi vertsplit guifg=bg guibg=bg
autocmd BufWritePre * %s/\s\+$//e
nmap vs :vsplit<cr>
imap jj <esc>

nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC

" Find files using Telescope command-line sugar.
nnoremap <silent> <C-P> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>


" AutoComment
autocmd FileType php setlocal commentstring=//\ %s

source $HOME/.config/nvim/nvimtree.vim
source $HOME/.config/nvim/lsp-config.vim
luafile ~/.config/nvim/lsp.lua
luafile ~/.config/nvim/compe-config.lua
luafile ~/.config/nvim/treesitter.lua

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

"highlight Normal guibg=none
"highlight NonText guibg=none
"highlight Normal ctermbg=none
"highlight NonText ctermbg=none
