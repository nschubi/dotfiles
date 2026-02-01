-- Create a local options table for better organization
local opt = vim.opt

-- Spellchecking
opt.spelllang = "de_de,en_us"
opt.spell = true

-- Indentation
opt.expandtab = true
opt.autoindent = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Editor behavior
opt.clipboard:append("unnamedplus")
opt.scrolloff = 10
opt.history = 1000
opt.visualbell = true
opt.timeoutlen = 5000

opt.iskeyword:append("-")

-- Set Number
vim.wo.number = true
vim.wo.relativenumber = true

-- Cursor Line
opt.cursorline = true

-- Appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.showmode = false
vim.diagnostic.config {
  float = { border = "rounded" }, -- add border to diagnostic popups
}

-- Folding
opt.foldlevel = 20
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()" -- Utilize Treesitter folds

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300,
    })
  end,
})
