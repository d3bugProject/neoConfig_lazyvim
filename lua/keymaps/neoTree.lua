local key = vim.keymap.set
-- Raccourcis clavier pour neo-tree
key(
  "n",
  "<leader>e",
  "<cmd>Neotree float reveal<CR>",
  { desc = "Ouvrir Neo-tree en fenêtre flottante", noremap = true }
)

key("n", "F", "<cmd>Neotree close<CR>", { desc = "Fermer Neo-tree" })
