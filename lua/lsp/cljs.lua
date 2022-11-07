require'lspconfig'.clojure_lsp.setup { 
    on_attach = function (client)

      vim.api.nvim_buf_set_keymap(0, 'n', '<Leader>e', ':Eval<CR>', { silent = true })
      lsp_keymap()
    end,
}

