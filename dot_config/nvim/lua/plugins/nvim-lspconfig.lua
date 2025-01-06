return {
  "nvim-lualine/lualine.nvim",
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      scss = { "prettier" },
      less = { "prettier" },
    },
    formatters = {
      prettier = {
        prepend_args = { "--tab-width", "4" },
      },
    },
  },
}
