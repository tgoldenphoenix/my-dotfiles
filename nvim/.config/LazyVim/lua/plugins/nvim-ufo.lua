return {
  'kevinhwang91/nvim-ufo', 
  dependencies = 'kevinhwang91/promise-async',
  init = function() -- always executed during startup
    vim.o.foldcolumn = '1' -- '0' is not bad
    vim.o.foldlevelstart = 99
    vim.o.foldenable = true

    vim.keymap.set('n', 'zR', require('ufo').openAllFolds)
    vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)

    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
    }
    local language_servers = vim.lsp.get_clients() -- or list servers manually like {'gopls', 'clangd'}
    for _, ls in ipairs(language_servers) do
        require('lspconfig')[ls].setup({
            capabilities = capabilities
            -- you can add other fields for setting up lsp server in this table
        })
    end

  end,
  opts = {
    
  },
  
}