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
  {'lewis6991/gitsigns.nvim'},
  {'chentoast/marks.nvim'},
  {'akinsho/bufferline.nvim'},
  {
    'lambdalisue/fern.vim',
    cmd = 'Fern',
    dependencies = {
      'TheLeoP/fern-renderer-web-devicons.nvim',
      'andykog/fern-highlight.vim'
    }
  },
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
      statusline = {'fern'}
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

-- Git Signs
require('gitsigns').setup({})

-- Marks
require('marks').setup({})

-- Bufferline
require('bufferline').setup({
  options = {
    mode = 'buffers',
    offsets = {
      {filetype = 'fern'}
    },
  },
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
      fg = {attribute = 'fg', highlight = 'Function'},
      italic = false
    }
  }
})

-- Fern
vim.keymap.set('n', '<leader>e', '<cmd>Fern . -drawer -toggle -right<cr>')
vim.g['fern#renderer'] = 'nvim-web-devicons'

local fern_group = vim.api.nvim_create_augroup('ferngroup', {clear = true})
vim.api.nvim_create_autocmd("FileType", {
  group = fern_group,
  pattern = "fern",
  command = "setlocal nornu | setlocal nonu"
})

-- User commands
vim.api.nvim_create_user_command('ReloadConfig', 'source $MYVIMRC', {})

-- Auto commands
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

