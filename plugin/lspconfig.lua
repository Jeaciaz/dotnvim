local ok, nvim_lsp = pcall(require, 'lspconfig')
if (not ok) then return end

require'mason'.setup()
require'mason-lspconfig'.setup {
    ensure_installed = {'css-lsp', 'typescript-language-server', 'eslint'}
}

local protocol = require 'vim.lsp.protocol'

local on_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end

    -- mappings
    local opts = {noremap = true, silent = true}

    buf_set_keymap('n', 'gr', '<Cmd>lua vim.lsp.buf.references()<CR>', opts)
end

protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '﬌', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '' -- TypeParameter
}

local capabilities = require'cmp_nvim_lsp'.default_capabilities()

nvim_lsp.tsserver.setup {
    on_attach = on_attach,
    filetypes = {
        "typescript", "typescriptreact", "javascript", "typescript.tsx"
    },
    cmd = {"typescript-language-server", "--stdio"},
    capabilities = capabilities
}

nvim_lsp.eslint.setup {on_attach = on_attach, capabilities = capabilities}

nvim_lsp.cssls.setup {on_attach = on_attach, capabilities = capabilities}

local signs = {Error = " ", Warn = " ", Hint = " ", Info = " "}

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, {text = icon, texthl = hl, numhl = ""})
end

vim.diagnostic.config {
    virtual_text = {prefix = '●'},
    update_in_insert = true,
    severity_sort = true,
    underline = true,
    float = {
        source = "always" -- or "if_many"
    }
}

vim.keymap.set('n', '<Leader>r',
               function() require'live-rename'.rename({insert = true}) end,
               {desc = 'LSP rename'})
