-- Create a local options table for better organization
local opt = vim.opt

-- Indentation
opt.expandtab = true
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2

-- Search
opt.hlsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

-- Editor behavior
opt.clipboard = "unnamedplus"
opt.scrolloff = 10
opt.history = 1000
opt.visualbell = true

-- Set Number
vim.wo.number = true
vim.wo.relativenumber = true

-- Set Leader Keys
vim.g.mapleader = " "

-- Keymaps
local key = vim.keymap
local modes_nvo = { "n", "v", "o" }
local modes_nv = { "n", "v", "o" }

key.set(modes_nvo, "H", "^", { noremap = true, silent = true })
key.set(modes_nvo, "L", "$", { noremap = true, silent = true })
key.set(modes_nvo, 'J', '}', { noremap = true, silent = true })
key.set(modes_nvo, 'K', '{', { noremap = true, silent = true })

-- Yank and paste improvements
key.set('v', 'p', '"_dP`]', { noremap = true, silent = true })
key.set('n', 'p', 'p`]', { noremap = true, silent = true })
key.set('v', 'y', 'ygv<Esc>$', { noremap = true, silent = true })
key.set('n', 'Y', 'y$', { noremap = true, silent = true })

-- Clipboard operations
key.set(modes_nv, ',y', '"+y', { noremap = true, silent = true })
key.set('n', ',yy', '"+yy', { noremap = true, silent = true })
key.set(modes_nv, ',p', '"+p', { noremap = true, silent = true })

-- Delete without yanking
key.set(modes_nv, 'x', '"_x', { noremap = true, silent = true })
key.set(modes_nv, 'X', '"_d', { noremap = true, silent = true })
key.set('n', 'XX', '"_dd', { noremap = true, silent = true })

-- Change without yanking
key.set({'n', 'x'}, 'c', '"xc', { noremap = true, silent = true })

-- Word operations
key.set('n', ',c', 'yiw', { noremap = true, silent = true })
key.set('n', ',v', 'viw', { noremap = true, silent = true })

-- Paste operations
key.set('n', 'gp', '`[v`]', { noremap = true, silent = true })

-- Centering when navigating (normal and visual modes combined)
key.set(modes_nv, 'n', 'nzz', { noremap = true, silent = true })
key.set(modes_nv, 'N', 'Nzz', { noremap = true, silent = true })

-- Scrolling with centering (normal and visual modes combined)
key.set(modes_nv, '<C-u>', '<C-u>zz', { noremap = true, silent = true })
key.set(modes_nv, '<C-d>', '<C-d>zz', { noremap = true, silent = true })

-- Indent/outdent in visual mode
key.set('x', '<', '<gv', { noremap = true, silent = true })
key.set('x', '>', '>gv', { noremap = true, silent = true })

-- Copy whole file
key.set('n', '<C-a>', 'ggVG"+y', { noremap = true, silent = true })

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = 300,
    })
  end,
})
