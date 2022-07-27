require'mapx'.setup{ global = "skip" }

local M = {}

function M.setup()
    require('telescope').setup{
        defaults = {
            mappings = {
                i = {
                    ["<esc>"] = require'telescope.actions'.close
                }
            }
        },
        pickers = {
            find_files = {
                theme = "dropdown",
            }
        }
    }
    nnoremap("<leader>p", function() require'telescope.builtin'.find_files{} end)
end

return M
