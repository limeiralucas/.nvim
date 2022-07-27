local M = {}

function M.setup()
    require('nvim-tmux-navigation').setup {
        keybindings = {
            left = "<M-h>",
            down = "<M-j>",
            up = "<M-k>",
            right = "<M-l>",
        }
    }
end

return M
