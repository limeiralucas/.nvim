local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config

lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = {'vim'},
      }
    },
  },
})

vim.diagnostic.config({
  virtual_text = false,
  severity_sort = true,
  update_in_insert = true,
  float = {
    source = 'always',
  },
})

vim.api.nvim_create_autocmd(
  {'CursorHold', 'CursorHoldI'},
  {
    callback = function()
      vim.diagnostic.open_float({focusable = false})
    end
  }
)
