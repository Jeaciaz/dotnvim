local status, lualine = require 'lualine'

if (not status) then return end

lualine.setup {
	options = {
		icons_enabled = true,
		theme = 'solarized_light',
		section_separators = { left = '', right = '' },
		component_separators = { left = '', right = '' },
		disabled_filetypes = {}
	},
	sections = {
		lualine_a = {'mode'},
		lualine_b = {{'filename', file_status = true, path = 0}}, -- 0 - just filename, 1 - relative path, 2 - absolute path
		lualine_x = {{'diagnostics', sources = {'nvim_diagnostic'}, symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' } },
			'encoding',
			'filetype'
		},
	    	lualine_y = { 'progress' },
		lualine_z = { 'location' }
	},
	tabline = {},
	extensions = {}
    }
