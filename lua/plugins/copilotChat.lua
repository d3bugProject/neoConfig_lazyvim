return {
  "CopilotC-Nvim/CopilotChat.nvim",
  branch = "canary",
  dependencies = {
    { "github/copilot.vim" }, -- ou zbirenbaum/copilot.lua
    { "nvim-lua/plenary.nvim" }, -- pour curl, log wrapper
  },
  config = function()
    require("CopilotChat").setup({
      debug = true, -- Enable debugging
    })
  end,
}
