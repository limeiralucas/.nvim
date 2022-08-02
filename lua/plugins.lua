local M = {}

function M.setup()
  local packer_bootstrap = false

  -- packer.nvim config
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  local function plugins(use)
    use "wbthomason/packer.nvim"

    -- Colorscheme
    use {
      "navarasu/onedark.nvim",
      config = function()
        vim.cmd "colorscheme onedark"
      end,
    }

    -- Startup screen
    use {
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    }

    -- IndentLine
    use "Yggdroot/indentLine"

    -- lualine
    use {
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons", opt = true },
      config = function()
        require("config.lualine").setup()
      end,
    }

    --[[ nvim-tree
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {
        "kyazdani42/nvim-web-devicons",
      },
      config = function()
        require("config.nvim_tree").setup()
      end,
    }
    ]]

    --[[ Tmux navigation
    use {
      "alexghergh/nvim-tmux-navigation",
      config = function()
        require("config.tmux_nav").setup()
      end,
    }
    ]]

    --[[ Telescope
    use {
      "nvim-telescope/telescope.nvim",
      requires = { { "nvim-lua/plenary.nvim" } },
      config = function()
        require("config.telescope").setup()
      end,
    }
    ]]

    -- WhichKey
    use {
      "folke/which-key.nvim",
      config = function()
        require("config.whichkey").setup()
      end,
    }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
