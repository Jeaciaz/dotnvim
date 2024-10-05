local ok, saga = pcall(require, 'lspsaga')
if not ok then return end

saga.setup {
    ui = {
        winblend = 10,
        border = 'rounded',
    },
    code_action = {
        show_server_name = true,
    },
    lightbulb = {
        enable = false,
        enable_in_insert = false,
    }
}

local opts = { noremap = true, silent = true }
local remap = vim.keymap.set

-- Definition
remap('n', '<Leader>d', '<Cmd>Lspsaga goto_definition<CR>', opts)
remap('n', '<Leader>D', '<Cmd>Lspsaga peek_definition<CR>', opts)
remap('n', '<Leader>t', '<Cmd>Lspsaga goto_type_definition<CR>', opts)
remap('n', '<Leader>T', '<Cmd>Lspsaga peek_type_definition<CR>', opts)

-- Diagnostic
remap('n', '<C-j>',     '<Cmd>Lspsaga diagnostic_jump_next<CR>', opts)

-- Hover
remap('n', 'K',         '<Cmd>Lspsaga hover_doc<CR>', opts)

-- Code action
local codeaction = require'lspsaga.codeaction'
remap('n', '<Leader>ca', function() codeaction:code_action() end, opts)
remap('v', '<Leader>ca', function()
    vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-U>", true, false, true))
    codeaction:range_code_action()
end, opts)
