-- Fix Neovim LSP incremental sync crash
return {
  "neovim/nvim-lspconfig",
  opts = {
    handlers = {
      ["textDocument/didChange"] = function(err, method, result, client_id, bufnr, config)
        -- Force FULL sync instead of incremental sync
        result.textDocumentSyncKind = 1
        return vim.lsp.handlers["textDocument/didChange"](err, method, result, client_id, bufnr, config)
      end,
    },
  },
}
