vim.cmd([[ set encoding=utf8 ]])
vim.cmd([[ set nu! ]])
vim.cmd([[ set wildmenu ]])
vim.cmd([[ set confirm ]])
vim.cmd([[ set incsearch ]])
vim.cmd([[ set title ]])
vim.cmd([[ set t_Co=256 ]])
vim.cmd([[ set expandtab ]])
vim.cmd([[ set shiftwidth=4 ]])
vim.cmd([[ set softtabstop=4 ]])
vim.cmd([[ set cursorline ]])
vim.cmd([[ syntax enable ]])

vim.cmd([[ set bg=dark ]])
vim.cmd([[ set termguicolors ]])

require('onedark').setup {
    style = 'deep'
}
require('onedark').load()
