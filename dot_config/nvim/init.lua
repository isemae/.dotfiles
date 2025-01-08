-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

if vim.g.neovide then
  vim.o.guifont = "Iosevka Custom Nerd:h15"
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_position_animation_length = 0.00
  vim.g.neovide_scroll_animation_length = 0.00
  vim.g.neovide_cursor_animation_length = 0.00

  -- local alpha = function()
  --   return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
  -- end
  -- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
  -- vim.g.neovide_transparency = 0.0
  -- vim.g.transparency = 0.8
  -- vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.g.neovide_window_blurred = true
end
