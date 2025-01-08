local ok, codesnap = pcall(require, 'codesnap')
if not ok then
    print("Codesnap not installed")
    return
end

codesnap.setup {watermark = '', bg_theme = 'bamboo'}

vim.keymap.set('x', '<Leader>cs', '<Esc><Cmd>CodeSnap<CR>', {})
