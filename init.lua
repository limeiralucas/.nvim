-- General nvim settings
require("configs.settings")

-- Mappings
require("configs.mappings")

-- Plugins/Packer
require("plugins").setup()

-- Theme settings (after colorscheme is required in plugins)
-- require("configs.theme")
