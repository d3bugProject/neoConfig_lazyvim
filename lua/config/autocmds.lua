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
