return {
  "pmizio/typescript-tools.nvim",
  enbaled = false,
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {
    settings = {
      expose_as_code_action = "all",
      tsserver_file_preferences = {
        importModuleSpecifier = "relative", -- ou "shortest" si tu veux le chemin le plus court
        importModuleSpecifierEnding = "auto",
        quotePreference = "auto",
      },
    },
  },
}
