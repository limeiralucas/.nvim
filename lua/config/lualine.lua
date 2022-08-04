local M = {}

function M.setup()
  vim.cmd [[ set noshowmode ]]

  require("lualine").setup {
    options = {
      globalstatus = true,
      icons_enabled = true,
      theme = "auto",
      component_separators = "|",
      section_separators = { left = "", right = " " },
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {
        { "mode", separator = { left = " " }, right_padding = 2 },
      },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = {
        { "location", separator = { right = "" }, left_padding = 2 },
      },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  }
end

return M
