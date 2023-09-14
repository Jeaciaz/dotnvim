local status, ts = pcall(require, 'nvim-treesitter.configs')
if (not status) then return end

ts.setup {
	highlight = {
		enable = true,
		disable = {}
	},
	indent = {
		enable = true,
		disable = {}
	},
	ensure_installed = {
		"markdown",
		"markdown_inline",
		"lua",
		"tsx",
		"json",
		"yaml",
		"css",
		"html",
	},
	autotag = {
		enable = true
	},
	context_commentstring = {
		config = {
			javascript = {
				__default = '// %s',
				jsx_element = '{/*%s*/}',
				jsx_fragment = '{/*%s*/}',
				jsx_attribute = '// %s',
				comment = '// %s'
			},
			typescript = {
				__default = '// %s',
				__multiline = '/* %s */'
			}
		}
	}
}

local parser_config = require 'nvim-treesitter.parsers'.get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }
