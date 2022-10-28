require 'lsp.typescript'
require 'lsp.fsharp'
require 'lsp.elm'
require 'lsp.cljs'

local buf_map = function(bufnr, mode, lhs, rhs, opts)
  vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or { silent = true })
end

function lsp_keymap (client)
		vim.cmd('command! LspCodeAction lua vim.lsp.buf.code_action()')
		vim.cmd('command! LspFormatting lua vim.lsp.buf.formatting()')
		vim.cmd('command! LspFormattingSync lua vim.lsp.buf.formatting_sync(nil, 1000)')
		vim.cmd('command! LspHover lua vim.lsp.buf.hover()')
		vim.cmd('command! LspRename lua vim.lsp.buf.rename()')
		vim.cmd('command! LspDiagPrev lua vim.diagnostic.goto_prev()')
		vim.cmd('command! LspDiagNext lua vim.diagnostic.goto_next()')
		vim.cmd('command! LspDiagLine lua vim.diagnostic.open_float()')

		buf_map(0, 'n', 'K', ':LspHover<CR>')
		buf_map(0, 'n', 'rn', ':LspRename<CR>')
		buf_map(0, 'n', '[a', ':LspDiagPrev<CR>')
		buf_map(0, 'n', ']a', ':LspDiagNext<CR>')
		buf_map(0, 'n', 'ga', ':LspCodeAction<CR>')
		buf_map(0, 'n', '<Leader>a', ':LspDiagLine<CR>')
		buf_map(0, 'n', 'gd', ':Telescope lsp_definitions<CR>')
		buf_map(0, 'n', 'gy', ':Telescope lsp_type_definitions<CR>')
		buf_map(0, 'n', 'gr', ':Telescope lsp_references<CR>')
end
