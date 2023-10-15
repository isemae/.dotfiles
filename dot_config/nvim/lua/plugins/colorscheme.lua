-- local get_color = function(name)
-- 	local color = vim.api.nvim_get_color_by_name(name)
-- 	if color == -1 then
-- 		color = vim.opt.background:get() == "dark" and 000 or 255255255
-- 	end
-- 	local byte = function(value, offset)
-- 		return bit.band(bit.rshift(value, offset), 0xFF)
-- 	end
-- 	return { byte(color, 16), byte(color, 8), byte(color, 0) }
-- end

-- local blend = function(fg, bg, alpha)
-- 	local bg_color = get_color(bg)
-- 	local fg_color = get_color(fg)
-- 	local channel = function(i)
-- 		local ret = (alpha * fg_color[i] + ((1 - alpha) * bg_color[i]))
-- 		return math.floor(math.min(math.max(0, ret), 255) + 0.5)
-- 	end
-- 	return string.format("#%02X%02X%02X", channel(1), channel(2), channel(3))
-- end

local overrides = function(colors)
  local p = colors.palette
  -- local t = colors.theme
  return {
    CursorLine = {
      bold = true,
      italic = true,
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
    -- DashboardHeader = {
    --   fg = p.peachRed,
    --   bg = p.sumiInk3,
    -- },
    -- DashboardIcon = {
    --   fg = p.springBlue,
    --   bg = p.sumiInk3,
    -- },
    -- DashboardDesc = {
    --   fg = p.fujiWhite,
    --   bg = p.sumiInk3,
    --   italic = true,
    -- },
    -- DashboardKey = {
    --   fg = p.lightBlue,
    --   bg = p.sumiInk3,
    --   bold = true,
    -- },
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
  }
end

local config = function()
  require("kanagawa").setup({
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,
    dimInactive = false,
    terminalColors = true,
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
    overrides = overrides,
  })
  vim.cmd.colorscheme("kanagawa-wave")
end

return {
  "rebelot/kanagawa.nvim",
  config = config,
  lazy = false,
  priority = 1000,
  opts = {

    transparent = true,
  },
  overrides = function(colors)
    local colors = require("kanagawa.colors").setup()
    local theme = colors.theme
    local palette = colors.palette
    return {
      --   -- leap.nvim
      --   LeapLabelPrimary = { bold = true, fg = palette.sumiInk3, bg = palette.crystalBlue },
      --   LeapLabelSecondary = { bold = true, fg = palette.sumiInk3, bg = palette.oniViolet },
      --   LeapMatch = { bold = true, fg = palette.sumiInk3, bg = palette.springGreen },
      -- cmp
      -- CmpCompletion = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
      -- CmpCompletionSel = { fg = "none", bg = theme.ui.bg_p2 },
      -- CmpCompletionThumb = { bg = theme.ui.bg_p2 },
      -- CmpCompletionSbar = { bg = theme.ui.bg_m1 },
      --
      NormalFloat = { bg = "none" },
      FloatBorder = { bg = "none" },
      FloatTitle = { bg = "none" },
      NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
      LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
      MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },

      -- telescope
      TelescopeTitle = { fg = theme.ui.special, bold = true },
      TelescopePromptNormal = { bg = theme.ui.bg_p1 },
      TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
      TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
      TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
      TelescopePreviewNormal = { bg = theme.ui.bg_dim },
      TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },

      -- dark completion popup
      Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
      PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
      PmenuSbar = { bg = theme.ui.bg_m1 },
      PmenuThumb = { bg = theme.ui.bg_p2 },

      -- navic
      NavicIconsFile = { link = "Directory" },
      NavicIconsModule = { link = "TSInclude" },
      NavicIconsNamespace = { link = "TSInclude" },
      NavicIconsPackage = { link = "TSInclude" },
      NavicIconsClass = { link = "Structure" },
      NavicIconsMethod = { link = "Function" },
      NavicIconsProperty = { link = "TSProperty" },
      NavicIconsField = { link = "TSField" },
      NavicIconsConstructor = { link = "@constructor" },
      NavicIconsEnum = { link = "Identifier" },
      NavicIconsInterface = { link = "Type" },
      NavicIconsFunction = { link = "Function" },
      NavicIconsVariable = { link = "@variable" },
      NavicIconsConstant = { link = "Constant" },
      NavicIconsString = { link = "String" },
      NavicIconsNumber = { link = "Number" },
      NavicIconsBoolean = { link = "Boolean" },
      NavicIconsArray = { link = "Type" },
      NavicIconsObject = { link = "Type" },
      NavicIconsKey = { link = "Keyword" },
      NavicIconsNull = { link = "Type" },
      NavicIconsEnumMember = { link = "TSField" },
      NavicIconsStruct = { link = "Structure" },
      NavicIconsEvent = { link = "Structure" },
      NavicIconsOperator = { link = "Operator" },
      NavicIconsTypeParameter = { link = "Identifier" },
      NavicText = { fg = theme.ui.fg, bg = theme.ui.bg },
      NavicSeparator = { fg = theme.ui.fg },
    }
  end,
},
{
  "loctvl842/monokai-pro.nvim",
  opts = {

    transparent_background = true,
    terminal_colors = true,
    devicons = true, -- highlight the icons of `nvim-web-devicons`
    styles = {
      comment = { italic = true },
      keyword = { italic = true }, -- any other keyword
      type = { italic = true }, -- (preferred) int, long, char, etc
      storageclass = { italic = true }, -- static, register, volatile, etc
      structure = { italic = true }, -- struct, union, enum, etc
      parameter = { italic = true }, -- parameter pass in function
      annotation = { italic = true },
      tag_attribute = { italic = true }, -- attribute of tag in reactjs
    },
    filter = "octagon", -- classic | octagon | pro | machine | ristretto | spectrum
    -- Enable this will disable filter option
    day_night = {
      enable = false, -- turn off by default
      day_filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
      night_filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
    },
    inc_search = "background", -- underline | background
    background_clear = {
      -- "float_win",
      "toggleterm",
      "telescope",
      -- "which-key",
      "renamer",
      "notify",
      -- "nvim-tree",
      -- "neo-tree",
      -- "bufferline", -- better used if background of `neo-tree` or `nvim-tree` is cleared
    }, -- "float_win", "toggleterm", "telescope", "which-key", "renamer", "neo-tree", "nvim-tree", "bufferline"
    plugins = {
      bufferline = {
        underline_selected = false,
        underline_visible = false,
      },
      indent_blankline = {
        context_highlight = "default", -- default | pro
        context_start_underline = false,
      },
    },
    ---@param c Colorscheme
    override = function(c) end,
  },
},
{
  "sainnhe/sonokai",
  opts = {},
},
{
  "DeviusVim/deviuspro.nvim",
},
-- Configure LazyVim to load gruvbox
{
  "LazyVim/LazyVim",
  opts = {
    colorscheme = "kanagawa",
  },
}
