return {
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  "L3MON4D3/LuaSnip",
  build = "make install_jsregexp",
  config = function()
    local luasnip = require("luasnip")

    luasnip.setup({
      history = true,
      update_events = "TextChanged,TextChangedI",
      enable_autosnippets = true,
    })

    require("luasnip").filetype_extend("typescript", { "javascript" })
    require("luasnip.loaders.from_lua").lazy_load({
      paths = "~/.config/nvim/lua/snippets", -- 커스텀 스니펫 경로
    })

    require("luasnip.loaders.from_vscode").lazy_load()

    local ls = require("luasnip")

    vim.keymap.set({ "i" }, "<C-K>", function()
      ls.expand()
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-L>", function()
      ls.jump(1)
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<C-J>", function()
      ls.jump(-1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-E>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })
  end,
}
