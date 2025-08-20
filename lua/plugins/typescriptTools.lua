if false then
  return {}
end
return {
  "pmizio/typescript-tools.nvim",
  enabled = true,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    settings = {
      expose_as_code_action = "all",
      tsserver_file_preferences = {
        importModuleSpecifier = "relative",
        importModuleSpecifierEnding = "auto",
        quotePreference = "auto",
        includeCompletionsForModuleExports = true,
        includeCompletionsWithInsertText = true,
      },
    },
    handlers = {
      -- Désactiver l'organisation automatique des imports
      ["textDocument/codeAction"] = function(err, result, ctx, config)
        if result then
          -- Filtrer les actions d'organisation des imports automatiques
          local filtered_actions = {}
          for _, action in ipairs(result) do
            if not (action.kind and string.find(action.kind, "source.organizeImports")) then
              table.insert(filtered_actions, action)
            end
          end
          return vim.lsp.handlers["textDocument/codeAction"](err, filtered_actions, ctx, config)
        end
      end,
    },
  },
}
