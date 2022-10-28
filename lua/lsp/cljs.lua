require'lspconfig'.clojure_lsp.setup { 
    on_attach = function (client)

      vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>e', ':Eval<CR>', { silent = true })
      vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>scljs', ':FireplaceConnect localhost:8777<CR>', { silent = true })
      lsp_keymap()
    end,
}

