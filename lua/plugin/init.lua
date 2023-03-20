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
  {
    'nvim-lualine/lualine.nvim',
    event = "BufEnter",
    config = function()
      require('plugin.lualine')
    end
  },
  {
    'lukas-reineke/indent-blankline.nvim',
    event = "BufEnter",
    config = function()
      require('plugin.indent_blankline')
    end
  },
  {
    'nvim-treesitter/nvim-treesitter',
    event = "BufEnter",
    config = function()
      require('plugin.treesitter')
    end
  },
  {
    'akinsho/bufferline.nvim',
    event = "BufEnter",
    config = function()
      require('plugin.bufferline')
    end
  },
  {
    'kyazdani42/nvim-web-devicons',
    dependencies = {
      'lambdalisue/glyph-palette.vim'
    }
  },
  {
    'numToStr/Comment.nvim',
    event = "BufEnter",
    config = function()
      require('Comment').setup()
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufEnter',
    config = function()
      require('gitsigns').setup()
    end
  },
  {
    'chentoast/marks.nvim',
    event = 'BufEnter',
    config = function()
      require('marks').setup()
    end
  },
  {
    'lambdalisue/fern.vim',
    cmd = 'Fern',
    dependencies = {
      'TheLeoP/fern-renderer-web-devicons.nvim',
      'andykog/fern-highlight.vim'
    },
    config = function()
      vim.g['fern#renderer'] = 'nvim-web-devicons'
    end
  },
})
