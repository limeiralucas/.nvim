-- User commands
-- Reload Config
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

-- Auto commands
-- Fern
local fern_group = vim.api.nvim_create_augroup('ferngroup', {clear = true})
vim.api.nvim_create_autocmd("FileType", {
  group = fern_group,
  pattern = "fern",
  command = "setlocal nornu | setlocal nonu | call glyph_palette#apply()"
})

-- Smart Number
local number_toggle_group = vim.api.nvim_create_augroup('numbertoggle', {clear = true})
vim.api.nvim_create_autocmd(
  {'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter'},
  {
    group = number_toggle_group,
    command = 'if &ft != "fern" | set rnu | endif'
  }
)
vim.api.nvim_create_autocmd(
  {'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave'},
  {
    group = number_toggle_group,
    command = 'if &ft != "fern" | set nornu | endif'
  }
)

