local overrides = function(colors)
  local p = colors.palette
  return {
    CursorLine = {
      bold = true,
      italic = false,
      bg = p.sumiInk5,
    },
    Visual = {
      bold = true,
    },
    TreesitterContextBottom = {
      link = "Visual",
    },
    IlluminatedCurWord = {
      italic = true,
    },
    IlluminatedWordText = {
      link = "CursorLine",
      italic = true,
    },
    IlluminatedWordRead = {
      link = "CursorLine",
      italic = true,
    },
    IlluminatedWordWrite = {
      link = "CursorLine",
      italic = true,
    },
    Folded = {
      bg = p.sumiInk3,
    },
    StatusColumnFoldClosed = {
      fg = p.springViolet1,
      bold = false,
    },
    Pmenu = {
      fg = p.fujiWhite,
      bg = p.waveBlue1,
    },
    PmenuSel = {
      fg = p.waveBlue1,
      bg = p.springViolet2,
      bold = true,
    },
    UfoFoldedBg = {
      bg = p.waveBlue1,
      bold = true,
    },
    IdentScope = {
      fg = p.oniViolet2,
    },
    TelescopeNormal = {
      bg = "none",
    },
    TelescopeBorder = {
      bg = "none",
    },
    TelescopePromptBorder = {
      bg = "none",
    },
    TelescopeResultsBorder = {
      bg = "none",
    },
    TelescopePreviewBorder = {
      bg = "none",
    },
  }
end

local config = function()
  require("kanagawa").setup({
    compile = true,
    overrides = overrides,
    undercurl = true,
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = { bold = false, italic = false },
    typeStyle = {},
    transparent = false,
    dimInactive = false,
    terminalColors = true,
    theme = "wave",
    colors = {
      palette = {},
      theme = {
        wave = {},
        lotus = {},
        dragon = {},
        all = {
          ui = {
            bg_gutter = "none",
          },
        },
      },
    },
  })
  vim.cmd.colorscheme("kanagawa-wave")
end

return {
  "rebelot/kanagawa.nvim",
  config = config,
  lazy = false,
  priority = 1000,
  opts = {},
}
