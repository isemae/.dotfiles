return {
  "abecodes/tabout.nvim",
  enabled = true,
  event = "InsertEnter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "L3MON4D3/LuaSnip",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("tabout").setup({
      tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
      backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
      act_as_tab = true, -- shift content if tab out is not possible
      act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
      default_shift_tab = "<C-d>", -- reverse shift default action,
      enable_backwards = true, -- well ...
      completion = false, -- if the tabkey is used in a completion pum
      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
      },
      ignore_beginning = false, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
      exclude = {}, -- tabout will ignore these filetypes
    })
    local ls = require("luasnip")

    local function replace_keycodes(c)
      return vim.api.nvim_replace_termcodes(c, true, true, true)
    end

    function _G.tab_binding()
      if ls.expand_or_jumpable() then
        return replace_keycodes("<Plug>luasnip-expand-or-jump")
      else
        return replace_keycodes("<Plug>(Tabout)")
      end
    end

    function _G.s_tab_binding()
      if ls.jumpable(-1) then
        return replace_keycodes("<Plug>luasnip-jump-prev")
      else
        return replace_keycodes("<Plug>(TaboutBack)")
      end
    end

    vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_binding()", { expr = true })
    vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_binding()", { expr = true })
  end,
}
