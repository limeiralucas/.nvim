local M = {}

function M.setup()
  local coq = require "coq"
  coq.Now()

  require "coq_3p" {
    { src = "nvimlua", short_name = "nLUA", conf_only = false },
  }
end

return M
