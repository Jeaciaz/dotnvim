local ok, telescope = pcall(require, 'telescope')
if not ok then return end

local actions = require'telescope.actions'
local builtin = require'telescope.builtin'

telescope.setup {
    defaults = {
        initial_mode = 'normal',
        mappings = {
            i = {
                ['<Esc>'] = actions.close
            }
        }
    },
    pickers = {
        buffers = {
            sort_mru = true,
            path_display = function(opts, path)
                local tail = require'telescope.utils'.path_tail(path)
                return string.format("[%s] %s", tail, path)
            end
        }
    }
}

vim.keymap.set('n', '<Leader>fb', '<Cmd>Telescope buffers<CR>', { silent = true })
vim.keymap.set('n', '<Leader>gg', function() builtin.live_grep({ glob_pattern = { '!test/**/*', 'pkg/**/*.js' }}) end, { silent = true })
