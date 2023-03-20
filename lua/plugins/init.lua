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
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)
  require('lazy').setup(plugins, lazy.opts)
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  {'joshdick/onedark.vim'},
  {'nvim-lualine/lualine.nvim'},
  {
    'kyazdani42/nvim-web-devicons',
    dependencies = {
      'lambdalisue/glyph-palette.vim'
    }
  },
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
