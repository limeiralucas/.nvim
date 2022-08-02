local opt = vim.opt

opt.encoding = "utf8"
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
opt.shiftwidth = 4 
opt.softtabstop = 4 
opt.cursorline = true 
opt.mouse = "a"
opt.updatetime = 250
opt.clipboard = "unnamedplus"
opt.syntax = "enable"
opt.bg = "dark"

vim.cmd [[
    augroup YankHighlight
        autocmd!
        autocmd TextYankPost * silent! lua vim.highlight.on_yank()
    augroup end
]]
