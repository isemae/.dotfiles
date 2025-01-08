return {
  "codota/tabnine-nvim",
  build = "./dl_binaries.sh",

  ---  integration with Tabnine and LuaSnip; falling back to inserting tab if neither has a completion
  vim.keymap.set("i", "<tab>", function()
    if require("tabnine.keymaps").has_suggestion() then
      return require("tabnine.keymaps").accept_suggestion()
    elseif require("luasnip").jumpable(1) then
      return require("luasnip").jump(1)
    else
      return "<tab>"
    end
  end, { expr = true }),
}
