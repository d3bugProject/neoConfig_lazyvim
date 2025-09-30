local key = vim.keymap.set
local opt = { noremap = true, silent = true }

-----------------------------------------------------------------
-- controle de fichier
------------------------------------------------------------------
-- enregitrer tout les fichiers
key("n", "f", ':%s/{" "}//<CR>', opt)
