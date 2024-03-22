local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- Get Lazy if not installed
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath
	})
end
vim.opt.rtp:prepend(lazypath)

require'lazy'.setup({
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' }},
	'neovim/nvim-lspconfig',
	'onsails/lspkind.nvim', -- pictograms for autocomplete
    -- { 'L3MON4D3/LuaSnip', version = 'v2.*', build = 'make install_jsregexp' }, -- snippet engine
    'hrsh7th/cmp-vsnip', 'hrsh7th/vim-vsnip', -- snippet engine (hopefully this one doesnt crash occasionally)
	'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for builtin LSP
	'hrsh7th/cmp-buffer', -- nvim-cmp source for buffer words
	'hrsh7th/nvim-cmp', -- completion engine
	
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },

	'windwp/nvim-ts-autotag', -- autoclose tags
	{ 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },

	'kyazdani42/nvim-web-devicons',
	'nvimdev/lspsaga.nvim',
	'ctrlpvim/ctrlp.vim',
	{ 'rose-pine/neovim', name = 'rose-pine' },
	{ 
		'rolv-apneseth/tfm.nvim', 
		options = {
			replace_netrw = true,
		},
		config = function()
			vim.api.nvim_set_keymap('n', '<C-f>', '', {
				noremap = true,
				callback = require'tfm'.open
			})
		end
	},
	'numToStr/Comment.nvim',
	'JoosepAlviste/nvim-ts-context-commentstring',

	'Wansmer/sibling-swap.nvim',
	{ 'nvim-telescope/telescope.nvim', tag = '0.1.6', dependencies = { 'nvim-lua/plenary.nvim' } }
})
