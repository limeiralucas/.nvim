local M = {}

function M.setup()
  local km = require "utils.keymapper"

  km.nnoremap("<leader>p", require("utils.finder").find_files, { silent = true })
  km.nnoremap("<C-p>", require("utils.finder").find_files, { silent = true })
end

return M
