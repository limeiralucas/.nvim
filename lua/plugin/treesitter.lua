require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  ensure_installed = {
    'python',
    'javascript',
    'typescript',
    'json',
    'lua',
    'vim',
  },
})

