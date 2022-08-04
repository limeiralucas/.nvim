local M = {}

function M.setup()
  require("indent_blankline").setup {
    filetype_exclude = { "help", "packer" },
    buftype_exclude = { "terminal", "nofile" },
    show_trailing_blankline_indent = false,
    show_current_context = false,
  }
end

return M
