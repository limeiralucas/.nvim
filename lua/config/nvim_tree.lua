local M = {}

function M.setup()
  require("nvim-tree").setup {
    disable_netrw = true,
    hijack_netrw = true,
    update_focused_file = {
      enable = true,
    },
    view = {
      side = "right",
      number = true,
      relativenumber = true
    },
    filters = {
      custom = { ".git" },
    }
  }

  -- Close Nvim Tree if it's the last buffer
  vim.api.nvim_create_autocmd("BufEnter", {
    nested = true,
    callback = function()
      if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
        vim.cmd "quit"
      end
    end
  })
end

return M
