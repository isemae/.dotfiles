---@type LazySpec
return {
  "Saghen/blink.cmp",
  enabled = true,
  version = "*",
  dependencies = {
    {
      "supermaven-inc/supermaven-nvim",
      dependencies = {
        {
          "saghen/blink.compat",
          version = "*",
          opts = {
            impersonate_nvim_cmp = true,
            debug = true,
          },
        },
      },
      opts = {
        disable_inline_completion = true, -- disables inline completion for use with cmp
        disable_keymaps = true, -- disables built in keymaps for more manual control
      },
    },
    "mikavilpas/blink-ripgrep.nvim",
    {
      "L3MON4D3/LuaSnip",
      version = "v2.*",
      build = "make install_jsregexp",
      dependencies = {
        "rafamadriz/friendly-snippets",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
          require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })

          local extends = {
            typescript = { "tsdoc" },
            javascript = { "jsdoc" },
            lua = { "luadoc" },
            python = { "pydoc" },
            rust = { "rustdoc" },
            cs = { "csharpdoc" },
            java = { "javadoc" },
            c = { "cdoc" },
            cpp = { "cppdoc" },
            php = { "phpdoc" },
            kotlin = { "kdoc" },
            ruby = { "rdoc" },
            sh = { "shelldoc" },
          }
          -- friendly-snippets - enable standardized comments snippets
          for ft, snips in pairs(extends) do
            require("luasnip").filetype_extend(ft, snips)
          end
        end,
      },
      opts = { history = true, delete_check_events = "TextChanged" },
    },
  },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    snippets = { preset = "luasnip" },
    sources = {
      default = {
        "lsp",
        "path",
        "buffer",
        "snippets",
        "ripgrep",
        "supermaven",
      },
      compat = { "avante_commands", "avante_mentions", "avante_files" },
      providers = {
        supermaven = {
          name = "supermaven",
          module = "blink.compat.source",
          score_offset = 3,
        },
        ripgrep = {
          module = "blink-ripgrep",
          name = "Ripgrep",
          ---@module "blink-ripgrep"
          ---@type blink-ripgrep.Options
          opts = {
            prefix_min_len = 4,
            score_offset = 10, -- should be lower priority
            max_filesize = "300K",
            search_casing = "--smart-case",
          },
        },
        avante_commands = {
          name = "avante_commands",
          module = "blink.compat.source",
          score_offset = 90, -- show at a higher priority than lsp
          opts = {},
        },
        avante_files = {
          name = "avante_files",
          module = "blink.compat.source",
          score_offset = 100, -- show at a higher priority than lsp
          opts = {},
        },
        avante_mentions = {
          name = "avante_mentions",
          module = "blink.compat.source",
          score_offset = 1000, -- show at a higher priority than lsp
          opts = {},
        },
      },
    },

    keymap = {
      preset = "super-tab",
    },
  },
}
