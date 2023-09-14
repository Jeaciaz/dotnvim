local ok, ss = pcall(require, 'sibling-swap')
if not ok then return end

vim.api.nvim_set_keymap('n', '<C-.>', '<Nop>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-,>', '<Nop>', {noremap = true, silent = true})

ss.setup {
  interline_swaps_witout_separator = true,
  keymaps = {
    ['<C-.>'] = 'swap_with_right_with_opp',
    ['<C-,>'] = 'swap_with_left_with_opp',
  }
}

