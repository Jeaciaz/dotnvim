local status, rosepine = pcall(require, 'rose-pine')
if (not status) then return end

rosepine.setup {
	variant = 'dawn',
	disable_italics = true
}

vim.cmd [[colorscheme rose-pine]]
