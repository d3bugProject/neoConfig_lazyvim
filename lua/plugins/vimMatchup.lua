-- ======================================================
-- match parentheses
-- ======================================================
return {
  {
    "andymass/vim-matchup",
    event = "VeryLazy",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
      vim.schedule(function()
        vim.cmd("NoMatchParen")
      end)
    end,
  },
}
