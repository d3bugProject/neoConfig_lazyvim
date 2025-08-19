-- ======================================================
-- OPTIONS NEOVIM - Configuration générale
-- ======================================================

-- Active le presse-papiers système (copier/coller entre Neovim et OS)
vim.opt.clipboard = "unnamedplus"

-- Options supplémentaires utiles pour le développement JS/TS
vim.opt.expandtab = true -- Utilise des espaces au lieu des tabs
vim.opt.shiftwidth = 2 -- Indentation de 2 espaces
vim.opt.tabstop = 2 -- Tab = 2 espaces
vim.opt.softtabstop = 2 -- Tab en mode insertion = 2 espaces
-- Numéros de ligne
vim.opt.number = true -- Numéros de ligne
vim.opt.relativenumber = false -- Numéros relatifs
-- Recherche
vim.opt.ignorecase = true -- Ignore la casse dans la recherche
vim.opt.smartcase = true -- Mais la respecte si majuscule présente
-- Affichage des indentations et espaces
vim.opt.list = true -- Active l'affichage des caractères invisibles
vim.opt.listchars = {
  tab = "  ", -- Tabs invisibles
  --space = "·",              -- Espaces avec points discrets
  trail = " ", -- Espaces en fin de ligne
  extends = "…", -- Plus discret
  precedes = "…",
}

-- ======================================================
-- AUTO-RELOAD DE LA CONFIGURATION
-- ======================================================

-- Recharge automatiquement la config après sauvegarde
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {
    "**/nvim/lua/**/*.lua", -- Tous les fichiers lua dans nvim/lua/
    "**/nvim/lua/config/*.lua", -- Spécifiquement le dossier config
    "**/nvim/lua/plugins/*.lua", -- Spécifiquement le dossier plugins
    "**/nvim/snippets/*.json", -- Fichiers snippets JSON
    "**/nvim/init.lua", -- Fichier init.lua principal
  },
  callback = function()
    -- Sauvegarde la position actuelle
    local cursor_pos = vim.api.nvim_win_get_cursor(0)

    -- Recharge la configuration
    vim.cmd("source %")

    -- Affiche un message de confirmation
    vim.notify("Configuration rechargée ! 🔄", vim.log.levels.INFO)

    -- Restaure la position du curseur
    vim.api.nvim_win_set_cursor(0, cursor_pos)
  end,
  desc = "Auto-reload Neovim config",
})
