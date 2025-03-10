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

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({
			higroup = "IncSearch",
			timeout = 300,
		})
	end,
})
