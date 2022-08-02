local g = vim.g
local km = require "utils.keymapper"

g.mapleader = " "
g.maplocalleader = " "

-- Escape with jk
km.imap("jk", "<Esc>", { silent = true })

-- Better indent
km.vnoremap("<", "<gv", { silent = true })
km.vnoremap(">", ">gv", { silent = true })

-- Paste over currently selected text without yaking it
km.vnoremap("p", '"_dP', { silent = true })

-- Switch buffer
km.nnoremap("<S-h>", ":bprevious<CR>", { silent = true })
km.nnoremap("<S-l>", ":bnext<CR>", { silent = true })

-- Cancel search highlighting
km.map("", "<C-h>", ":nohl<CR>", { silent = true })

-- Move selected line / block of text in visual mode
km.xnoremap("K", ":move '<-2<CR>gv-gv", { silent = true })
km.xnoremap("J", ":move '>+1<CR>gv-gv", { silent = true })

-- Exit visual mode using enter
km.xnoremap("<Enter>", "<Esc>", { silent = true })
