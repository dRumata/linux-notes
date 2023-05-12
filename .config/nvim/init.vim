:set number
:nnoremap <leader>v <cmd>CHADopen<cr>set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set expandtab
:set mouse=a

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/ms-jpq/chadtree.git'
Plug 'https://github.com/ryanoasis/vim-devicons.git'
Plug 'https://github.com/rafi/awesome-vim-colorschemes.git'

call plug#end()
nnoremap <C-n> :CHADopen<cr>
