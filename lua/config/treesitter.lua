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
    indent = {
      enable = true,
    },
    
    -- nvim-treesitter-textobjects
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner"
        },
      },

      swap = {
        enable = true,
        swap_next = {
          ["<leader>rx"] = "@parameter.inner",
        },
        swap_previous = {
          ["<leader>rX"] = "@parameter.inner"
        }
      },

      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]M"] = "@function.outer",
          ["]["] = "@class.outer"
        },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer"
        },
        goto_previous_end = {
          ["[M"] = "@function.outer",
          ["[]"] = "@class.outer"
        },
      },

      lsp_interop = {
        enable = true,
        border = "none",
        peek_definition_code = {
          ["<leader>df"] = "@function.outer",
          ["<leader>dF"] = "@class.outer",
        }
      }
    }
  }
end

return M
