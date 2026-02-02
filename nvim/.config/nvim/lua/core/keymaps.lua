-- Keymappings
local keymap = vim.keymap
local modes_nvo = { "n", "v", "o" }
local modes_nv = { "n", "v", "o" }

keymap.set(modes_nvo, "H", "^", { noremap = true, silent = true })
keymap.set(modes_nvo, "L", "$", { noremap = true, silent = true })
keymap.set(modes_nvo, 'J', '}', { noremap = true, silent = true })
keymap.set(modes_nvo, 'K', '{', { noremap = true, silent = true })

-- Yank and paste improvements
keymap.set('v', 'p', '"_dP`]', { noremap = true, silent = true })
keymap.set('n', 'p', 'p`]', { noremap = true, silent = true })
keymap.set('v', 'y', 'ygv<Esc>$', { noremap = true, silent = true })
keymap.set('n', 'Y', 'y$', { noremap = true, silent = true })

-- Clipboard operations
keymap.set(modes_nv, ',y', '"+y', { noremap = true, silent = true })
keymap.set('n', ',yy', '"+yy', { noremap = true, silent = true })
keymap.set(modes_nv, ',p', '"+p', { noremap = true, silent = true })

-- Delete without yanking
keymap.set(modes_nv, 'x', '"_x', { noremap = true, silent = true })
keymap.set(modes_nv, 'X', '"_d', { noremap = true, silent = true })
keymap.set('n', 'XX', '"_dd', { noremap = true, silent = true })

-- Change without yanking
keymap.set({'n', 'x'}, 'c', '"xc', { noremap = true, silent = true })

-- Word operations
keymap.set('n', ',c', 'yiw', { noremap = true, silent = true })
keymap.set('n', ',v', 'viw', { noremap = true, silent = true })

-- Paste operations
keymap.set('n', 'gp', '`[v`]', { noremap = true, silent = true })

-- Centering when navigating (normal and visual modes combined)
keymap.set(modes_nv, 'n', 'nzz', { noremap = true, silent = true })
keymap.set(modes_nv, 'N', 'Nzz', { noremap = true, silent = true })

-- Scrolling with centering (normal and visual modes combined)
keymap.set(modes_nv, '<C-u>', '<C-u>zz', { noremap = true, silent = true })
keymap.set(modes_nv, '<C-d>', '<C-d>zz', { noremap = true, silent = true })

-- Indent/outdent in visual mode
keymap.set('x', '<', '<gv', { noremap = true, silent = true })
keymap.set('x', '>', '>gv', { noremap = true, silent = true })

-- Copy whole file
keymap.set('n', '<C-a>', 'ggVG"+y', { noremap = true, silent = true })

-- Leader Keymappings
local wk = require("which-key")

wk.add({
  { "<leader>e", group = "Explorer" },
  { "<leader>f", group = "Find / Telescope" },
  { "<leader>g", group = "Go to" },
  { "<leader>h", group = "Harpoon" },
  { "<leader>q", group = "Quickfix" },
  { "<leader>r", group = "Refactoring" },
  { "<leader>t", group = "Tabs" },
})

keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", {desc = 'toggle file [e]xplorer'})
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>", {desc = 'toggle focus to file explorer'})
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", {desc = '[f]ind file in file explorer'})

keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[f]uzzy find files' })
keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[f]uzzy grep files' })
keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'show Telescope [b]uffers' })
keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'show Telescope [h]elp tags' })
keymap.set('n', '<leader>fc', require('telescope.builtin').current_buffer_fuzzy_find, {desc = 'fuzzy find in [c]urrent file buffer'})
keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, {desc = 'fuzzy find LSP/class [s]ymbols'})
keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {desc = 'fuzzy find LSP/[i]ncoming calls'})
keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({symbols={'function', 'method'}}) end, {desc = 'fuzzy find [m]ethods in current class'})
keymap.set('n', '<leader>ft', function()
  local success, node = pcall(function() return require('nvim-tree.lib').get_node_at_cursor() end)
  if not success or not node then return end;
  require('telescope.builtin').live_grep({search_dirs = {node.absolute_path}})
end, {desc = 'grep file contents in current nvim-[t]ree node'})

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
keymap.set("n", "<leader>ha", function() harpoon:list():add() end, {desc = '[a]dd mark to Harpoon'})
keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = 'open [h]arpoon menu'})
keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, {desc = 'go to mark [1]'})
keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, {desc = 'go to mark [2]'})
keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, {desc = 'go to mark [3]'})
keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, {desc = 'go to mark [4]'})
keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end, {desc = 'go to mark [5]'})
keymap.set("n", "<leader>h6", function() harpoon:list():select(6) end, {desc = 'go to mark [6]'})
keymap.set("n", "<leader>h7", function() harpoon:list():select(7) end, {desc = 'go to mark [7]'})
keymap.set("n", "<leader>h8", function() harpoon:list():select(8) end, {desc = 'go to mark [8]'})
keymap.set("n", "<leader>h9", function() harpoon:list():select(9) end, {desc = 'go to mark [9]'})

-- LSP
keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>', {desc = '[g]o into hover'})
keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {desc = 'go to [d]efinition'})
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {desc = 'go to [D]eclaration'})
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {desc = 'go to [i]mplementation'})
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', {desc = 'go to [t]ype definition'})
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>', {desc = 'go to [r]eferences'})
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {desc = 'go to [s]ignature help'})
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', {desc = 'go to code [a]ction'})
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>', {desc = 'open float?'})
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', {desc = 'go to [p]rev error'})
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>', {desc = 'go to [n]ext error'})
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>', {desc = 'document_symbol?'})

keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>") -- open quickfix list
keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item
keymap.set("n", "<leader>ql", ":clast<CR>") -- jump to last quickfix list item
keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list

-- Refactoring keymaps
keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')
keymap.set('n', '<leader>rf', function()
  require('conform').format({ async = true, lsp_fallback = true })
  end, { desc = 'refactor [f]ormatting' })
keymap.set('v', '<leader>rf', function()
  require('conform').format({ async = true, lsp_fallback = true })
  end, { desc = 'refactor [f]ormatting' })

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

