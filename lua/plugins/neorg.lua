return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers", -- Installe/met à jour les parsers
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  lazy = false, -- Important pour que Neorg soit chargé au démarrage
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {}, -- Charge les paramètres par défaut
        ["core.concealer"] = {}, -- Pour les icônes et le rendu visuel
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/notes", -- Adaptez ce chemin selon vos besoins
            },
            default_workspace = "notes",
          },
        },
        ["core.keybinds"] = {
          config = {
            default_keybinds = true,
            neorg_leader = ",",
          },
        },
      },
    })

    -- Configuration importante
    vim.wo.conceallevel = 2
    vim.wo.foldenable = false
    vim.wo.foldlevel = 99
  end,
}
