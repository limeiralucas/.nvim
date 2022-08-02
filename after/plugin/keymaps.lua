local g = vim.g
local r = require "utils.keymapper"

g.mapleader = " "
g.maplocalleader = " "

r.imap("jk", "<Esc>")
