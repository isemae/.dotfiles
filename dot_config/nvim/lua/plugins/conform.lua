return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    {
      default_format_opts = {
        lsp_format = "fallback",
      },
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },

      formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofumpt" },
        python = { "isort", "black" },
        rust = { "rustfmt", lsp_format = "fallback" },
        javascript = { "prettierd", "prettier" },
        typescript = { "prettierd", "eslint_d" },
        javascriptreact = { "prettierd", "eslint_d" },
        typescriptreact = { "prettierd", "eslint_d" },
        sql = { "sql-formatter" },
        css = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        json = { "prettierd" },
        yaml = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
        graphql = { "prettierd", "prettier" },
        ["_"] = { "trim_whitespace" },
      },
    },
    config = function(_, opts)
      local util = require("conform.util")
      vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"

      -- running eslint fix
      util.add_formatter_args(require("conform.formatters.eslint_d"), { "--fix" })
      require("conform").setup(opts)
    end,

    formatters = {
      prettier = {
        prepend_args = { "--tab-width", "4" },
      },
    },
  },
}
