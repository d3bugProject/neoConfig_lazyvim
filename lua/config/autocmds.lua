vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.ts", "*.tsx", "*.js", "*.jsx" },
  callback = function()
    -- Appelle l'action "Organize Imports" de typescript-tools
    vim.cmd("TSToolsOrganizeImports")
  end,
})
