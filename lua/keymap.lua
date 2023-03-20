vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set('x', '<Enter>', '<Esc>')

-- Open Fern
vim.keymap.set('n', '<leader>e', '<cmd>Fern . -drawer -toggle -right<cr>')
