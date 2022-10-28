require'lspconfig'.elmls.setup { 
    on_attach = function (client)
      lsp_keymap()
    end,
}

