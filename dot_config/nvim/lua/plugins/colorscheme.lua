return {
  -- add gruvbox
  {
    "rebelot/kanagawa.nvim",
    colors = {},
    --    overrides = function(colors)
    --      local theme = colors.theme
    --      return {
    --        NormalFloat = { bg = "none" },
    --        FloatBorder = { bg = "none" },
    --        FloatTitle = { bg = "none" },
    --
    --        NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
    --
    --        LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    --        MaosnNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
    --      }
    --    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
