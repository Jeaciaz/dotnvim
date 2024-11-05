local ok, conform = pcall(require, 'conform')
if not ok then return end

conform.setup {
    formatters_by_ft = {
        javascript = {"eslint", "prettierd"},
        typescript = {"eslint", "prettierd"},
        typescriptreact = {"eslint", "prettierd"},
        lua = {"lua-format"}
    }
}

vim.keymap.set('n', '<Leader>ff', function()
    conform.format({
        bufnr = vim.api.nvim_get_current_buf(),
        lsp_format = "first"
    })
end, {silent = true})

