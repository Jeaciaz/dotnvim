local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt

-----------
-- Основные
-----------
opt.colorcolumn = '140'
opt.cursorline = true
opt.number = true
opt.relativenumber = true
-- cmd 'set clipboard+=unnamedplus'

-- Цветовая схема
opt.termguicolors = true
opt.background = 'light'
cmd 'colorscheme gruvbox'
vim.api.nvim_set_hl(0, 'BufferCurrent', { link = 'Normal', default = true }) -- Цвет активного буфера, иначе оно нечитаемо

-- Табы и отступы
opt.tabstop = 4         -- 1 tab = 4 spaces
opt.shiftwidth = 4      -- shift 4 spaces on tab
opt.expandtab = true    -- spaces instead of tabs
opt.smartindent = true  -- autoindent new lines
cmd [[
filetype indent plugin on
syntax enable
]]

cmd [[
autocmd FileType xml,html,xhtml,css,scss,javascript,typescript,typescriptreact,lua setlocal shiftwidth=2 tabstop=2 
]]

-- Подсвечивает на доли секунды скопированную часть текста
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup='IncSearch', timeout=700}
augroup end
]], false)

-- Отображать в диагностике текст ошибок перед ворнингами, писать откуда приходят
vim.diagnostic.config {
	virtual_text = {
		source = true
	},
	severity_sort = true
}
----------
-- Плагины
----------

-- nvim-cmp
opt.completeopt = 'menuone,noselect'
local cmp = require 'cmp'

cmp.setup {
	snippet = {
		expand = function(args)
			require'luasnip'.lsp_expand(args.body)
		end
	},
	mapping = {
		['<Tab>'] = cmp.mapping.confirm({ select = true }),
		['<C-e>'] = cmp.mapping.abort()
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' }
	})
}

cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' }
	})
})

local cmp_capabilities = require'cmp_nvim_lsp'.update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Rnvimr
g.rnvimr_enable_ex = 1
g.rnvimr_enable_picker = 1
g.rnvimr_enable_bw = 1
