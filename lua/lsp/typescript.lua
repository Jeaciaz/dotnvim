local null_ls = require 'null-ls'

on_attach = function ()
  lsp_keymap()
  vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>rn', ':TypescriptRenameFile<CR>', { silent = true })
end,

require'typescript'.setup {
	server = {
		on_attach = function (client)
      client.resolved_capabilities.document_formatting = false
      on_attach()
    end,
    flags = {
			update_in_insert = true,
		},
		capabilities = cmp_capabilities
	}
}

null_ls.setup {
	sources = {
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.code_actions.eslint_d,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.eslint_d,
	},
  on_attach = on_attach,
}
