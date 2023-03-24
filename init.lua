require('config')
require('keymap')
require('cmd')

if not vim.g.vscode then
  require('plugin')
  require('colorscheme')
end
