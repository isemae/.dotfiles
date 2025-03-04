-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- This file is automatically loaded by plugins.core
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.laststatus = 3
opt.autochdir = true
opt.autowrite = true -- Enable auto write
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.completeopt = "menu,menuone,noselect"
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line
opt.enc = "UTF-8"
opt.fileencodings = "UTF-8"
opt.expandtab = true -- Use spaces instead of tabs
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"
opt.ignorecase = true -- Ignore case
opt.inccommand = "nosplit" -- preview incremental substitute
opt.list = true -- Show some invisible characters (tabs...
opt.mouse = "a" -- Enable mouse mode
opt.number = true -- Print line number
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
opt.smartcase = true -- Don't ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.spelllang = { "en" }
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.termguicolors = true -- True color support
opt.ttimeoutlen = 0
opt.timeoutlen = 300
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
opt.wrap = true -- line wrap
opt.fillchars = {
  foldopen = "",
  foldclose = "",
  -- fold = "⸱",
  fold = " ",
  foldsep = " ",
  diff = "╱",
  eob = " ",
  vert = "▎",
  vertright = "▎",
  vertleft = "▎",
  verthoriz = "▎",
  horiz = "▔",
  horizup = "▔",
  horizdown = "▁",
}
opt.langmap = {
  "ㅁa",
  "ㅠb",
  "ㅊc",
  "ㅇd",
  "ㄷe",
  "ㄹf",
  "ㅎg",
  "ㅗh",
  "ㅑi",
  "ㅓj",
  "ㅏk",
  "ㅣl",
  "ㅡm",
  "ㅜn",
  "ㅐo",
  "ㅔp",
  "ㅂq",
  "ㄱr",
  "ㄴs",
  "ㅅt",
  "ㅕu",
  "ㅍv",
  "ㅈw",
  "ㅌx",
  "ㅛy",
  "ㅋz",
}
-- Folding
opt.foldlevel = 99
opt.foldtext = "v:lua.require'lazyvim.util.ui'.foldtext()"

-- if vim.fn.has("nvim-0.9.0") == 1 then
--   vim.opt.statuscolumn = [[%!v:lua.require'lazyvim.util.ui'.statuscolumn()]]
-- end

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
if vim.fn.has("nvim-0.10") == 1 then
  opt.foldmethod = "expr"
  opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
else
  opt.foldmethod = "indent"
end

vim.g.markdown_recommended_style = 0
opt.rtp:append("/opt/homebrew/opt/fzf")
-- opt.shell = "/opt/homebrew/bin/zsh"
