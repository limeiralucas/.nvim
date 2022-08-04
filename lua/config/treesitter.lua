local M = {}

function M.setup()
  require("nvim-treesitter.configs").setup {
    ensure_installed = {
      "lua",
      "python",
      "go",
      "javascript",
      "typescript",
      "vim",
      "html",
      "markdown",
      "json",
      "c",
      "cpp",
      "make",
    },
    sync_install = false,
    highlight = {
      enable = true,
    },
  }
end

return M
