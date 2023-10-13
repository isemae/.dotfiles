local field_format = {
  name = {
    guibg = "#1F1F27",
  },
  modified = {
    guibg = "#ffffff",
  },
  num = {
    guibg = "#000000",
  },
  blocks = {
    gui = "bold",
    guifg = "#000000",
  },
}

return {
  "b0o/incline.nvim",
  enabled = true,
  config = function()
    require("incline").setup({
      debounce_threshold = {
        falling = 50,
        rising = 10,
      },
      hide = {
        cursorline = false,
        focused_win = false,
        only_win = false,
      },
      highlight = {
        groups = {
          InclineNormal = {
            default = true,
            group = "NormalFloat",
          },
          InclineNormalNC = {
            default = true,
            group = "NormalFloat",
          },
        },
      },
      ignore = {
        buftypes = "special",
        filetypes = {},
        floating_wins = true,
        unlisted_buffers = true,
        wintypes = "special",
      },
      render = "basic",
      window = {
        margin = {
          horizontal = 0,
          vertical = 0,
        },
        options = {
          signcolumn = "no",
          wrap = false,
        },
        padding = 1,
        padding_char = " ",
        placement = {
          horizontal = "right",
          vertical = "top",
        },
        width = "fit",
        winhighlight = {
          active = {
            EndOfBuffer = "None",
            Normal = "InclineNormal",
            Search = "None",
          },
          inactive = {
            EndOfBuffer = "None",
            Normal = "InclineNormalNC",
            Search = "None",
          },
        },
        zindex = 50,
      },
    })
  end,
}
