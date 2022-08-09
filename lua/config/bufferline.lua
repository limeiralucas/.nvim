local M = {}

function M.setup()
  local km = require("utils.keymapper")

  require("bufferline").setup {
    options = {
      numbers = "none",
      diagnostics = "nvim_lsp",
      separator_style = "slant" or "padded_slant",
      show_tab_indicators = true,
      show_buffer_close_icons = true,
      show_close_icon = true
    }
  }

  km.nnoremap("<Tab>", "<cmd>BufferLineCycleNext<CR>")
  km.nnoremap("<S-Tab>", "<cmd>BufferLineCyclePrev<CR>")
end

return M
