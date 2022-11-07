-- vim.cmd 'packadd packer.nvim'

return require'packer'.startup(function (use)
	use 'wbthomason/packer.nvim'
  use 'ThePrimeagen/vim-be-good'



	-- Внешний вид
	use 'ellisonleao/gruvbox.nvim' -- Цветовая схема
	use 'romgrk/barbar.nvim' -- Buffer bar
	use 'kyazdani42/nvim-web-devicons' -- Иконки файлов



	-- Навигация
	use 'kevinhwang91/rnvimr' -- Ranger file picker
	use {
		'nvim-telescope/telescope-fzf-native.nvim', 
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' 
	}
	use {
		'nvim-telescope/telescope.nvim', branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } },
		config = function ()
			require'telescope'.setup {
				defaults = {
					file_ignore_patterns = { 'node_modules', 'lock%.json', 'dist' },
					scroll_strategy = limit,
				},
				pickers = {
					find_files = {
						theme = 'dropdown',
					},
					live_grep = {
						theme = 'dropdown',
					}
				},
				extensions = {
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
					}
				}
			}

			require'telescope'.load_extension 'fzf'
		end
	}



	-- LSP/Autocomplete
	use 'nvim-treesitter/nvim-treesitter' -- Treesitter
	use 'neovim/nvim-lspconfig' -- Collection of configs for built-in LSP client
	use 'hrsh7th/nvim-cmp' -- Autocomplete, utils below
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip' -- Snippet engine

	-- TypeScript
	
  use 'jose-elias-alvarez/typescript.nvim' -- Typescript LSP setup
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } },
  }

  -- F#
  use 'ionide/Ionide-vim' -- Ionide

  -- HTML/CSS
  use 'mattn/emmet-vim' -- Emmet: <C-y>,

  -- Лиспы
  use 'gpanders/nvim-parinfer'
  
  -- Clojure(script)
  use 'Olical/conjure' -- nREPL

	
	-- Разное
	use 'tpope/vim-surround' -- Скобки
	use 'JoosepAlviste/nvim-ts-context-commentstring' -- Комментарии в зависимости от контекста в jsx
	use { -- Комментарии везде по gc
		'numToStr/Comment.nvim',
		config = function ()
			require'Comment'.setup {
				pre_hook = function(ctx)
					local U = require 'Comment.utils'

					local location = nil
					if ctx.ctype == U.ctype.block then
						location = require('ts_context_commentstring.utils').get_cursor_location()
					elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
						location = require('ts_context_commentstring.utils').get_visual_start_location()
					end

					return require('ts_context_commentstring.internal').calculate_commentstring {
						key = ctx.ctype == U.ctype.line and '__default' or '__multiline',
						location = location,
					}
				end,
			}
		end
	}
	use 'cohama/lexima.vim' -- Автозакрытие скобочек
end)
