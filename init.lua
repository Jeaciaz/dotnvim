require 'plugins'
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
vim.o.shiftwidth = 2
vim.o.tabstop = 2

local remap = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

remap('n', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
remap('i', 'jj', '<Esc>', opts)
remap('n', '<leader>fs', ':w<CR>', opts)

remap('i', '<D-v>', '<Esc>"+pi', opts)
remap('n', '<D-v>', '"+p', opts)
remap('n', '<D-c>', '"+yy', opts)

-- Grepping Arc merge conflicts, traversing quickfix list
remap('n', '<leader>cc', '<Cmd>vimgrep "=====" {services,packages}/**/*.{ts,tsx}<CR>', opts)
remap('n', '<leader>[', '<Cmd>cp<CR>', opts)
remap('n', '<leader>]', '<Cmd>cn<CR>', opts)

vim.cmd [[cd ~/arcadia/taxi/frontend/services/newbiz-logistics-frontend]]
