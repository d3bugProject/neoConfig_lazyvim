vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function()
    -- Appelle l'action "Organize Imports" de typescript-tools
    vim.cmd("TSToolsOrganizeImports")
  end,
})

-- Génération auto de jsconfig.json à l'ouverture d'un fichier JS/TS
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function()
    local jsconfig = vim.fn.getcwd() .. "/jsconfig.json"
    if vim.fn.filereadable(jsconfig) == 0 then
      local config = {
        compilerOptions = {},
        exclude = { "dist" },
      }
      local json = vim.fn.json_encode(config)
      vim.fn.writefile({ json }, jsconfig)
    end
  end,
})

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "typescript-tools" then
      client.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
        if result and result.diagnostics then
          result.diagnostics = vim.tbl_filter(function(diagnostic)
            return diagnostic.code ~= 6133 and diagnostic.code ~= 6192
          end, result.diagnostics)
        end
        vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx, config)
      end
    end
  end,
})
