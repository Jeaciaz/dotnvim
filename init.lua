vim.g.neovide_fullscreen = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.title = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.hlsearch = true
vim.o.ignorecase = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4

local remap = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

vim.g.mapleader = ' '
remap('n', '<Space>', '<Nop>', opts)

remap('n', '<Leader>fs', ':w<CR>', opts)

remap('i', '<C-v>', '<Esc>"+pi', opts)
remap('n', '<C-v>', '"+p', opts)
remap('n', '<C-c>', '"+yy', opts)
remap('v', '<C-c>', '"+y', opts)

remap('n', '<Leader>[', '<Cmd>cp<CR>', opts)
remap('n', '<Leader>]', '<Cmd>cn<CR>', opts)

require 'plugins'
