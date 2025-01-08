return {
  "stevearc/conform.nvim",
  "nvim-lualine/lualine.nvim",
  opts = {
    require("conform").setup({
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },

      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform will run multiple formatters sequentially
        python = { "isort", "black" },
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt", lsp_format = "fallback" },
        typescript = { "prettierd" },
        -- Conform will run the first available formatter
        javascript = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettierd" },
        json = { "prettierd" },
        html = { "prettierd" },
        sql = { "sql-formatter" },
      },
    }),

    formatters = {
      prettier = {
        prepend_args = { "--tab-width", "4" },
      },
    },
  },
}
