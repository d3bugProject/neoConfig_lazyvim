-- Keymaps pour CopilotChat
vim.keymap.set("n", "<leader>cc", ":CopilotChat<CR>", { desc = "Copilot Chat" })
vim.keymap.set("v", "<leader>ce", ":CopilotChatExplain<CR>", { desc = "Explain code" })
vim.keymap.set("v", "<leader>cr", ":CopilotChatReview<CR>", { desc = "Review code" })
vim.keymap.set("v", "<leader>cf", ":CopilotChatFix<CR>", { desc = "Review code" })
