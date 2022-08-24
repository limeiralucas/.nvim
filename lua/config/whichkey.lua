local M = {}

function M.setup()
  local whichkey = require "which-key"

  local conf = {
    window = {
      border = "single",
      position = "bottom",
    },
  }

  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = false,
  }

  local mappings = {
    ["w"] = { "<cmd>update!<CR>", "Save" },
    ["q"] = { "<cmd>q!<CR>", "Quit" },
    ["o"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
    ["<Tab>"] = { "<cmd>FzfLua buffers<cr>", "Buffers" },

    b = {
      name = "Buffer",
      c = { "<cmd>bd!<CR>", "Close current buffer" },
      D = { "<cmd>%bd|e#|bd#<CR>", "Delete all buffers" },
      l = { "<cmd>BufferLineMoveNext<CR>", "Move buffer right" },
      h = { "<cmd>BufferLineMovePrev<CR>", "Move buffer left" },
    },

    f = {
      name = "Find",
      f = { "<cmd>lua require('utils.finder').find_files()<cr>", "Files" },
      b = { "<cmd>FzfLua buffers<cr>", "Buffers" },
      c = { "<cmd>FzfLua commands<cr>", "Commands" },
      e = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
    },

    z = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
    },
  }

  whichkey.setup(conf)
  whichkey.register(mappings, opts)
end

return M
