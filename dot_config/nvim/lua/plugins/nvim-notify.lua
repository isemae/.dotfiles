return {
  "rcarriga/nvim-notify",
  keys = {
    {
      "<leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss all Notifications",
    },
  },
  opts = {
    timeout = 2000,
    render = "wrapped-compact",
    background_colour = "NotifyBackground",
    stages = "fade",
    max_height = function()
      return math.floor(vim.o.lines * 0.70)
    end,
    max_width = function()
      return math.floor(vim.o.columns * 0.70)
    end,
    fps = 60,
  },
  init = function()
    -- when noice is not enabled, install notify on VeryLazy
    local Util = require("lazyvim.util")
    if not Util.has("noice.nvim") then
      Util.on_very_lazy(function()
        vim.notify = require("notify")
      end)
    end
  end,
}
