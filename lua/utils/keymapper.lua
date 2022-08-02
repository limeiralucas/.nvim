local map = function(mode, lhs, rhs, opts, recursive)
  local options = { noremap = recursive }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end

  if type(rhs) == "function" then
    options = vim.tbl_extend("force", options, { callback = rhs })
    rhs = ""
  end

  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local keymapper = {
  map = map,
  nnoremap = function(lhs, rhs, ops)
    map("n", lhs, rhs, ops, true)
  end,
  inoremap = function(lhs, rhs, ops)
    map("i", lhs, rhs, ops, true)
  end,
  vnoremap = function(lhs, rhs, ops)
    map("v", lhs, rhs, ops, true)
  end,
  xnoremap = function(lhs, rhs, ops)
    map("x", lhs, rhs, ops, true)
  end,
  nmap = function(lhs, rhs, ops)
    map("n", lhs, rhs, ops)
  end,
  imap = function(lhs, rhs, ops)
    map("i", lhs, rhs, ops)
  end,
  vmap = function(lhs, rhs, ops)
    map("v", lhs, rhs, ops)
  end,
  xmap = function(lhs, rhs, ops)
    map("x", lhs, rhs, ops)
  end
}

return keymapper
