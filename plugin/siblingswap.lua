local ok, ss = pcall(require, 'sibling-swap')
if not ok then return end

local opts = {noremap = true, silent = true}

vim.api.nvim_set_keymap('n', '<C-.>', '<Nop>', opts)
vim.api.nvim_set_keymap('n', '<C-,>', '<Nop>', opts)

ss.setup {
    interline_swaps_without_separator = true,
    keymaps = {
        ['<C-.>'] = 'swap_with_right_with_opp',
        ['<C-,>'] = 'swap_with_left_with_opp'
    }
}
