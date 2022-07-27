vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	use("wbthomason/packer.nvim")
	use("Yggdroot/indentLine")
	use("b0o/mapx.nvim")
	use("navarasu/onedark.nvim")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
		config = function()
			require("configs.lualine").setup()
		end,
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		config = function()
			require("configs.nvim_tree").setup()
		end,
	})
	use({
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("configs.tmux_nav").setup()
		end,
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("configs.telescope").setup()
		end,
	})
end)
