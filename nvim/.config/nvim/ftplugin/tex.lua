-- ftplugin/tex.lua
local opts = function(desc)
  return { buffer = 0, desc = desc }
end

-- <leader>d = Language actions (LaTeX)
vim.keymap.set('n', '<leader>dc', '<cmd>VimtexCompile<CR>', opts('[c]ompile (toggle)'))
vim.keymap.set('n', '<leader>dv', '<cmd>VimtexView<CR>', opts('[v]iew PDF'))
vim.keymap.set('n', '<leader>ds', '<cmd>VimtexStop<CR>', opts('[s]top'))
vim.keymap.set('n', '<leader>dx', '<cmd>VimtexClean<CR>', opts('clean au[x]'))
vim.keymap.set('n', '<leader>dt', '<cmd>VimtexTocToggle<CR>', opts('[t]oc toggle'))
vim.keymap.set('n', '<leader>di', '<cmd>VimtexInfo<CR>', opts('[i]nfo'))
vim.keymap.set('n', '<leader>de', '<cmd>VimtexErrors<CR>', opts('[e]rrors'))

-- Telescope BibTeX
vim.keymap.set('n', '<leader>db', ':Telescope bibtex<CR>', opts('[b]ibtex search'))

vim.opt_local.spell = true
vim.opt_local.conceallevel = 2
