return {
  "saghen/blink.cmp",
  event = "InsertEnter",
  version = "v0.*",
  opts_extend = { "sources.default", "sources.compat" },
  dependencies = {
    {
      "L3MON4D3/LuaSnip",
      lazy = true,
      dependencies = {
        {
          "rafamadriz/friendly-snippets",
          config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/lua/snippets" } })
          end,
        },
      },
      opts = { history = true, delete_check_events = "TextChanged" },
    },
  },
  opts = function()
    return {
      snippets = {
        preset = "luasnip",
      },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      cmdline = {
        enabled = false,
        -- sources = { ... } -- Si tu veux activer la complétion en ligne de commande plus tard
      },
      completion = {
        list = {
          selection = {
            auto_insert = false,
          },
        },
        accept = {
          auto_brackets = { enabled = true },
        },
        menu = {
          border = "rounded",
          winblend = 10,
          winhighlight = "Normal:CatppuccinSurface0,FloatBorder:CatppuccinSurface2,Search:None",
          draw = { treesitter = { "lsp" } },
        },
        documentation = {
          auto_show = true,
          window = {
            border = "rounded",
            winblend = 10,
            winhighlight = "Normal:CatppuccinSurface0,FloatBorder:CatppuccinSurface2,Search:None",
          },
          auto_show_delay_ms = 100,
        },
      },
      signature = {
        enabled = true,
        window = {
          border = "rounded",
          winblend = 10,
          winhighlight = "Normal:CatppuccinSurface0,FloatBorder:CatppuccinSurface2,Search:None",
        },
      },
      keymap = {
        preset = "enter",
        ["<C-space>"] = { "show", "hide" },
        ["<C-e>"] = { "show_documentation", "hide_documentation" },
      },
    }
  end,
}
