local key = vim.keymap.set
local opt = { noremap = true, silent = true }

key("n", "<A-m>", ":Copilot disable<CR>", opt)

key("n", "<A-M>", ":Copilot enable<CR>", opt)
