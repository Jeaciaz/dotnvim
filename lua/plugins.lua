local status, packer = pcall(require, "packer")
if (not status) then
	print("Packer is not installed")
	return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
	use 'wbthomason/packer.nvim'
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
	use 'neovim/nvim-lspconfig' -- LSP config colletion
	use 'onsails/lspkind.nvim' -- pictograms for autocomplete
	use 'L3MON4D3/LuaSnip' -- snippet engine
	use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for builtin LSP
	use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
	use 'hrsh7th/nvim-cmp' -- completion engine

	use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
		  local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
		  ts_update()
		end
	}
  use 'windwp/nvim-ts-autotag'

	use {
		"windwp/nvim-autopairs", -- brackets
    config = function() require("nvim-autopairs").setup {} end
	}

	use 'kyazdani42/nvim-web-devicons'
	use 'glepnir/lspsaga.nvim' -- hover docs and such
	use 'jose-elias-alvarez/null-ls.nvim'
	use 'MunifTanjim/prettier.nvim'
	use 'MunifTanjim/eslint.nvim'
	use "nvim-lua/plenary.nvim"
	use "ctrlpvim/ctrlp.vim"

	use { "rose-pine/neovim", as = "rose-pine" }

  use 'ptzz/lf.vim'
  use 'voldikss/vim-floaterm'

	use 'numToStr/Comment.nvim'
	use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {
    'Wansmer/sibling-swap.nvim',
    requires = { 'nvim-treesitter' },
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
end)
