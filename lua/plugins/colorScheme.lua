return {
  -- ======================================================
  -- INTERFACE - THÈME SOLARIZED OSAKA
  -- ======================================================
  {
    "craftzdog/solarized-osaka.nvim",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("solarized-osaka")
    end,
  },
}
