local opt = vim.opt
local api = vim.api

opt.termguicolors = true
opt.hlsearch = true
opt.number = true
opt.relativenumber = true
opt.wildmenu = true
opt.confirm = true
opt.incsearch = true
opt.title = true
opt.undofile = true
opt.expandtab = true
opt.cursorline = true
opt.updatetime = 250
opt.timeoutlen = 300
opt.shiftwidth = 4
opt.softtabstop = 4
opt.mouse = "a"
opt.signcolumn = "yes"
opt.encoding = "utf8"
opt.clipboard = "unnamedplus"
opt.syntax = "enable"
opt.bg = "dark"

function RelativeNumber(enable)
  local bufnr = api.nvim_get_current_buf()
  local ft = api.nvim_buf_get_option(bufnr, "filetype")
  local allowed = api.nvim_exec("echo &ft =~ 'alpha'", true)

  if allowed == "0" then
    if enable then
      vim.cmd("set rnu")
    else
      vim.cmd("set rnu!")
    end
  end
end

local numberToggle = api.nvim_create_augroup("relativenumber", { clear = true })
api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave" },
  { pattern = "*", command = "lua RelativeNumber(true)", group = numberToggle }
)
api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter" },
  { pattern = "*", command = "lua RelativeNumber(false)", group = numberToggle }
)
