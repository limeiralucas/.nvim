vim.g['fern#renderer'] = 'nvim-web-devicons'

vim.keymap.set('n', '<leader>e', '<cmd>Fern . -drawer -reveal=% -toggle -width=35 -right<cr>')

local fern_group = vim.api.nvim_create_augroup('ferngroup', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
  group = fern_group,
  pattern = 'fern',
  -- command = 'setlocal nornu | setlocal nonu | call glyph_palette#apply()'
  command = 'setlocal rnu | call glyph_palette#apply()'
})

vim.api.nvim_create_autocmd('FileType', {
  group = fern_group,
  pattern = 'fern',
  callback = function()
    vim.keymap.set('n', 'o', '<Plug>(fern-action-open:edit)', {buffer = true})
    vim.keymap.set('n', 'n', '<Plug>(fern-action-new-path)', {buffer = true})
    vim.keymap.set('n', 'h', '<Plug>(fern-action-hidden:toggle)', {buffer = true})
    vim.keymap.set('n', 'd', '<Plug>(fern-action-remove)', {buffer = true})
    vim.keymap.set('n', 's', '<Plug>(fern-action-mark:toggle)', {buffer = true})
    vim.keymap.set('n', 'r', '<Plug>(fern-action-reload)', {buffer = true})
    vim.keymap.set('n', 'm', '<Plug>(fern-action-move)', {buffer = true})
  end
})
