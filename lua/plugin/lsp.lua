local status, lspconfig = pcall(require, 'lspconfig')
if (not status) then return end

local lsp_defaults = lspconfig.util.default_config

local on_attach = function(client, bufnr)
  -- format on save
  if client.supports_method('textDocument/formatting') then
    vim.api.nvim_create_autocmd('BufWritePre', {
      group = vim.api.nvim_create_augroup('LspFormat', { clear = true }),
      buffer = bufnr,
      callback = function ()
        vim.lsp.buf.format()
      end
    })
  end
end

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

lspconfig.pyright.setup({
  on_attach = on_attach,
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  filetypes = { 'typescript', 'typescriptreact', 'typescript.tsx' },
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

function SetPython()
  local results = {}
  local cachePath = "~/Library/Caches/"

  if vim.loop.os_uname().sysname == "Linux" then
    cachePath = "~/.cache/"
  end

  local poetryPath = cachePath.."/pypoetry/virtualenvs"

  vim.fn.jobstart(
    'ls --color=never -ad '..poetryPath..'/*/',
    {
      on_stdout = function(_, data, _)
        for _, line in ipairs(data) do
          if (line ~= nil and line ~= "") then
            table.insert(results, line)
          end
        end
      end,
      on_exit = function()
        vim.ui.select(
          results,
          {
            prompt = "Choose env:",
            format_item = function(item)
              return item
            end,
          },
          function (envPath, _)
            if envPath then
              local pythonPath = envPath.."/bin/python"

              lspconfig.pyright.setup({
                before_init = function(_, config)
                  config.settings.python.pythonPath = pythonPath
                end
              })
            end
          end
        )
      end
    }
  )
end

vim.api.nvim_create_user_command("SetPython", SetPython, { desc = "Select Python interpreter" })

