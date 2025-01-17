local status, cmp = pcall(require, 'cmp')
if (not status) then return end
local lspkind = require 'lspkind'

cmp.setup {
    snippet = {
        expand = function(args) require'luasnip'.lsp_expand(args.body) end
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<Tab>'] = cmp.mapping.confirm {
            select = true,
            behavior = cmp.ConfirmBehavior.Replace
        }
    },
    sources = cmp.config.sources {
        {name = 'luasnip'}, {name = 'nvim_lsp'}, {name = 'buffer'}
    },
    formatting = {
        format = lspkind.cmp_format {with_text = false, maxwidth = 50}
    }
}

vim.cmd [[
    set completeopt=menuone,noinsert,noselect
    highlight! default link CmpItemKind CmpItemMenuDefault
]]
