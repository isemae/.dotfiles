return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
    { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
  },
  opts = {
    highlights = {
      fill = {
        bg = "#18171E",
      },
      offset_separator = {
        bg = "#1F1F27",
      },

      buffer_selected = { bold = true, italic = false },
      -- diagnostics_selected = { italic = false },
      -- hint_selected = { italic = false },
      -- pick_selected = { italic = false },
      -- pick_visivle = { italic = false },
      -- pick = { italic = false },
    },

    options = {
      separator_style = "underline",
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      show_tab_indicators = true,
      style_preset = default, -- or bufferline.style_preset.minimal,
      themable = false,
      color_icons = true,

      indicator = {
        style = "underline",
      },
      max_name_length = 18,
      max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
      truncate_names = true, -- whether or not tab names should be truncated
      tab_size = 18,
      close_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      -- stylua: ignore
      right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
      diagnostics = "nvim_lsp",
      diagnostics_indicator = function(_, _, diag)
        local icons = require("lazyvim.config").icons.diagnostics
        local ret = (diag.error and icons.Error .. diag.error .. " " or "")
          .. (diag.warning and icons.Warn .. diag.warning or "")
        return vim.trim(ret)
      end,
      offsets = {
        {
          filetype = "neo-tree",
          text = function()
            return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
          end,
          highlight = PanelHeading,
          text_align = "left",
          separator = "▕",
        },
      },

      hover = {
        enabled = true,
        delay = 100,
        reveal = { "close" },
      },
    },
  },
}
