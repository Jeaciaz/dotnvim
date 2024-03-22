local ok, rosepine = pcall(require, 'rose-pine')
if (not ok) then return end

rosepine.setup {
    variant = 'dawn',
    disable_italics = true
}

vim.cmd [[colorscheme rose-pine]]
