set number
set enc=utf-8
set cursorline
set mouse=a

set expandtab
set smarttab
set smartindent
set shiftwidth=2
set softtabstop=2

" buffer navigation key mappings
set hidden
nnoremap <C-N> :bnext<CR>
nnoremap <C-P> :bprev<CR>

" find files
nnoremap <S-F> :Files<CR>

set backspace=indent,eol,start
set wildignore+=*.class,*.swp

call plug#begin('~/.local/share/nvim/plugged')

" for better looks
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'ap/vim-buftabline'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'

Plug 'derekwyatt/vim-scala'
Plug 'posva/vim-vue'

call plug#end()

colorscheme dracula 
