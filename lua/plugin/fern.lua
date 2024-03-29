vim.g['fern#renderer'] = 'nvim-web-devicons'
vim.g['fern#disable_default_mappings'] = 1

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
    -- fern-my-open-and-stay
    local cmd = [[
      nmap <buffer> <Plug>(fern-my-open-and-stay)
      \ <Plug>(fern-action-open:select)<C-w><C-p>
    ]]
    vim.cmd(cmd)

    -- fern-my-open-expand-or-collapse
    cmd = [[
      nmap <buffer><expr>
        \ <Plug>(fern-my-open-expand-or-collapse)
        \ fern#smart#leaf(
        \   "\<Plug>(fern-my-open-and-stay)",
        \   "\<Plug>(fern-action-expand)",
        \   "\<Plug>(fern-action-collapse)",
        \ )
    ]]
    vim.cmd(cmd)

    vim.keymap.set('n', '<2-LeftMouse>', '<Plug>(fern-my-open-expand-or-collapse)', {buffer = true, nowait = true})
    vim.keymap.set('n', '<CR>', '<Plug>(fern-my-open-expand-or-collapse)', {buffer = true, nowait = true})
    vim.keymap.set('n', 'l', '<Plug>(fern-my-open-expand-or-collapse)', {buffer = true, nowait = true})
    vim.keymap.set('n', 'o', '<Plug>(fern-action-open:edit)', {buffer = true})
    vim.keymap.set('n', 'v', '<Plug>(fern-action-open:vsplit)', {buffer = true})
    vim.keymap.set('n', 'n', '<Plug>(fern-action-new-path)', {buffer = true})
    vim.keymap.set('n', 'h', '<Plug>(fern-action-hidden:toggle)', {buffer = true})
    vim.keymap.set('n', 'd', '<Plug>(fern-action-remove)', {buffer = true})
    vim.keymap.set('n', 's', '<Plug>(fern-action-mark:toggle)', {buffer = true})
    vim.keymap.set('n', 'r', '<Plug>(fern-action-reload)', {buffer = true})
    vim.keymap.set('n', 'm', '<Plug>(fern-action-move)', {buffer = true})
    vim.keymap.set('n', '<BS>', '<Plug>(fern-action-leave)', {buffer = true, nowait = true})
    vim.keymap.set('n', '<', '<Plug>(fern-action-leave)', {buffer = true, nowait = true})
    vim.keymap.set('n', '>', '<Plug>(fern-action-enter)', {buffer = true, nowait = true})

    vim.keymap.set('n', 'q', ':<C-u>quit<cr>', {buffer = true})
  end
})
