return {
  -- ======================================================
  -- NAVIGATION RAPIDE - HOP
  -- ======================================================
  {
    "smoka7/hop.nvim",
    version = "*",
    config = function()
      -- Configuration de hop
      require("hop").setup()

      -- Raccourci pour hop (m + caractères)
      local key = vim.keymap.set
      key("n", "<leader>md", "<cmd>HopChar2<CR>", { desc = "Hop vers caractère" })
      key("n", "<leader>mm", "<cmd>HopAnywhere<CR>", { desc = "Hop vers caractère" })
    end,
  },
}
