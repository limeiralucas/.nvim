local r = require "utils.keymapper"

local M = {}

function M.setup()
  require("telescope").setup {
    defaults = {
      mappings = {
        i = {
          ["<esc>"] = require("telescope.actions").close,
        },
      },
    },
    pickers = {
      find_files = {
        theme = "dropdown",
      },
    },
  }
  r.nnoremap("<leader>p", require("telescope.builtin").find_files)
end

return M
