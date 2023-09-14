-- local ok, lf = pcall(require, 'lf')
-- if not ok then return end

vim.g.lf_map_keys = 0
vim.g.lf_replace_netrw = 1
vim.g.lf_command_override = 'lf -command "set hidden"'
vim.api.nvim_set_keymap('n', '<C-f>', ':Lf<CR>', {noremap = true, silent = true})
