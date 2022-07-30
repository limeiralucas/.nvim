vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")

        -- IndentLine
	use("Yggdroot/indentLine")

        -- Onedark colorscheme
	use("navarasu/onedark.nvim")

        -- lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("configs.lualine").setup()
		end,
	})

        -- nvim-tree
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("configs.nvim_tree").setup()
		end,
	})

        -- Tmux navigation
	use({
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("configs.tmux_nav").setup()
		end,
	})

        -- Telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("configs.telescope").setup()
		end,
	})
end)
