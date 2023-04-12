-- User commands
-- Reload Config
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

-- Set Directory
vim.api.nvim_create_user_command('SetDir', 'cd %:h', {})

-- Auto commands
-- Fern
local fern_group = vim.api.nvim_create_augroup('ferngroup', {clear = true})
vim.api.nvim_create_autocmd("FileType", {
  group = fern_group,
  pattern = "fern",
  command = "setlocal nornu | setlocal nonu | call glyph_palette#apply()"
})

local general = vim.api.nvim_create_augroup('general', {clear = true})

-- Smart Number
vim.api.nvim_create_autocmd(
  {'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter'},
  {
    group = general,
    command = 'if &ft != "fern" | set rnu | endif'
  }
)
vim.api.nvim_create_autocmd(
  {'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave'},
  {
    group = general,
    command = 'if &ft != "fern" | set nornu | endif'
  }
)

-- Disable newline comment
vim.api.nvim_create_autocmd(
  "BufEnter",
  {
    callback = function()
      vim.opt.formatoptions:remove { "c", "r", "o" }
    end,
    group = general,
  }
)
