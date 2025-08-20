return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      json = { "prettier" },
      jsonc = { "prettier" },
      markdown = { "prettier" },
      lua = { "stylua" },
    },
    formatters = {
      organize_imports = {
        command = "npx",
        args = { "organize-imports-cli", "$FILENAME" },
        stdin = false,
      },
    },
  },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      desc = "Formater le fichier",
    },
    {
      "<leader>tf",
      function()
        vim.g.disable_autoformat = not vim.g.disable_autoformat
        if vim.g.disable_autoformat then
          print("Format-on-save désactivé")
        else
          print("Format-on-save activé")
        end
      end,
      desc = "Toggle format-on-save",
    },
  },
}
