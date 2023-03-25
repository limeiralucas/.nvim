vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set('x', '<Enter>', '<Esc>')

vim.keymap.set('n', '<Tab>', ':bnext<cr>')
vim.keymap.set('n', '<S-Tab>', ':bprev<cr>')
vim.keymap.set('n', '<leader>w', ':bd<cr>')
