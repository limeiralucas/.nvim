-- Options
vim.opt.number = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.showmode = false
vim.opt.updatetime = 750

-- Keybindings
vim.keymap.set('i', 'jk', '<Esc>')
vim.keymap.set({'n', 'x'}, 'cp', '"+y')
vim.keymap.set({'n', 'x'}, 'cv', '"+p')
vim.keymap.set({'n', 'x'}, 'x', '"_x')
vim.keymap.set('x', '<Enter>', '<Esc>')

-- Leader
vim.g.mapleader = ' '

-- Lazy.nvim
local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  -- You can "comment out" the line below after lazy.nvim is installed
  -- lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  {'joshdick/onedark.vim'},
  {'nvim-lualine/lualine.nvim'},
  {'kyazdani42/nvim-web-devicons'},
  {'lukas-reineke/indent-blankline.nvim'},
  {'nvim-treesitter/nvim-treesitter'},
  {'numToStr/Comment.nvim'},
  {'kyazdani42/nvim-tree.lua'},
})

-- Colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme('onedark')

-- Lualine
require('lualine').setup({
  options = {
    theme = 'onedark',
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
    disabled_filetypes = {
      statusline = {'NvimTree'}
    }
  }
})

-- Indent blankline
require('indent_blankline').setup({
  show_trailing_blankline_indent = true,
  show_first_indent_level = false,
  use_treesitter = true,
  show_current_context = false
})

-- Treesitter
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
  },
})

-- Comment
require('Comment').setup({})

-- Nvim-tree
require('nvim-tree').setup({
  hijack_cursor = false,
  view = {
    side = 'right',
  },
  on_attach = function(bufnr)
    local bufmap = function(lhs, rhs, desc)
      vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
    end

    local api = require('nvim-tree.api')

    bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
  end
})

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')

-- User commands
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

