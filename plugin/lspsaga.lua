local status, saga = pcall(require, 'lspsaga')
if (not status) then return end

saga.setup {
	ui = {
		winblend = 10,
		border = 'rounded'
	},
  code_action = {
    show_server_name = true,
  },
  lightbulb = {
    enable = false,
  },
}

local opts = { noremap = true, silent = true }

-- Definition
vim.keymap.set('n', '<leader>d', '<Cmd>Lspsaga goto_definition<CR>', opts)
vim.keymap.set('n', '<leader>D', '<Cmd>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', '<leader>t', '<Cmd>Lspsaga goto_type_definition<CR>', opts)
vim.keymap.set('n', '<leader>T', '<Cmd>Lspsaga peek_type_definition<CR>', opts)

-- Diagnostic
vim.keymap.set('n', '<C-j>', '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)

-- Hover
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<CR>', opts)

-- Rename
vim.keymap.set('n', '<leader>rn', '<Cmd>Lspsaga rename<CR>', opts)

-- Codeaction
local codeaction = require 'lspsaga.codeaction'
vim.keymap.set('n', '<leader>ca', function() codeaction:code_action() end, { silent = true })
vim.keymap.set('v', '<leader>ca', function()
	vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
	codeaction:range_code_action()
end, { silent = true })
