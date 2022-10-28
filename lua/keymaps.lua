local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Выкл подсветки поиска
map('n', '<C-h>', ':noh<CR>', opts)

-- Выход из i
map('i', 'jk', '<Esc>', opts)
map('i', 'kj', '<Esc>', opts)
map('i', 'ло', '<Esc>', opts)
map('i', 'ол', '<Esc>', opts)

-- Автоформат и сохранение по Ctrl-s
map('n', '<Leader><Leader>', ':LspFormatting<CR>', opts)
map('n', '<C-s>', ':w<CR>', opts)
map('i', '<C-s>', '<Esc>:w<CR>', opts)

-- Quickfix навигация
map('n', '<F7>', ':cp<CR>', { noremap = true })
map('n', '<F8>', ':cn<CR>', { noremap = true })

-- Иногда не сразу вспоминаю что кидает в начало файла, а что - в конец
map('n', 'gG', 'G', opts)

-- Переключение по вкладкам и закрытие
map('n', '<C-j>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<C-k>', '<Cmd>BufferNext<CR>', opts)
map('n', '<C-c>', '<Cmd>BufferClose<CR>', opts)

-- fzf
local function telescope_arc_status() 
	require'telescope'.extensions.arc.status {
		preview_cmd = {
			staged = "arc diff --git --cached %s | delta --pager='less -SR'",
		  unstaged = "arc diff --git %s | delta --pager='less -SR'",
			untracked = "cat"
		}
	}
end

map('n', '<Leader>f', [[ <Cmd>lua require'telescope.builtin'.find_files({ path_display = { 'truncate' } })<CR> ]], opts)
map('n', '<Leader>g', [[ <Cmd>lua require'telescope.builtin'.live_grep({ type_filter = 'ts', path_display = { 'truncate' } })<CR> ]], opts)
map('n', '<Leader>as', '', { callback = telescope_arc_status })

-- rnvimr
map('n', '<C-g>', ':RnvimrToggle<CR>', opts)
map('t', '<C-g>', ':RnvimrToggle<CR>', opts)

