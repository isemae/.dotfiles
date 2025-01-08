return {
  "saghen/blink.cmp",
  version = "*",
  dependencies = { "L3MON4D3/LuaSnip", version = "v2.*" },

  opts = {
    snippets = { preset = "luasnip" },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
    },
    keymap = {
      preset = "enter",
      ["<Tab>"] = { "accept", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
    },
    -- completion = {
    --   list = {
    --     selection = "manual",
    --   },
    -- },
  },
}
