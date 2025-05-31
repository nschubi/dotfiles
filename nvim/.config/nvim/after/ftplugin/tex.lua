-- LaTeX-spezifische Konfiguration
local opts = { noremap = true, silent = true, buffer = 0 }

-- VimTeX-spezifische Bindings (immer verfügbar)
vim.keymap.set('n', '<leader>ll', '<cmd>VimtexCompile<CR>', opts)
vim.keymap.set('n', '<leader>lv', '<cmd>VimtexView<CR>', opts)
vim.keymap.set('n', '<leader>lc', '<cmd>VimtexClean<CR>', opts)
vim.keymap.set('n', '<leader>lt', '<cmd>VimtexTocToggle<CR>', opts)
vim.keymap.set('n', '<leader>li', '<cmd>VimtexInfo<CR>', opts)

-- Citation-Einfügung per Autocompletion
vim.keymap.set('i', '<C-c>', '<C-x><C-o>', opts)

-- Telescope BibTeX (mit Verfügbarkeitsprüfung)
vim.keymap.set('n', '<leader>fc', ':Telescope bibtex<CR>', opts)

-- LaTeX-spezifische Einstellungen
vim.opt_local.spell = true
vim.opt_local.conceallevel = 2
