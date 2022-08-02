local r = require "utils.keymapper"

local M = {}

function M.setup()
  require("nvim-tree").setup {
    hijack_netrw = true,
    hijack_cursor = true,
    update_focused_file = {
      enable = true,
    },
    view = {
      adaptive_size = true,
    },
  }

  r.nnoremap("<leader>o", function()
    require("nvim-tree").toggle()
  end)

  vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
      if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match "NvimTree_" ~= nil then
        vim.cmd "quit"
      end
    end,
  })
end

return M
