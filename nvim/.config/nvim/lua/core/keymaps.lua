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
keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", {desc = 'Toggle File Explorer'})
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>", {desc = 'Toggle Focus to File Explorer'})
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", {desc = 'Find File in File Explorer'})

keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Fuzzy find files' })
keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = 'Fuzzy grep' })
keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = 'Show Telescope Buffers' })
keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Show Telescope Help Tags' })
keymap.set('n', '<leader>fs', require('telescope.builtin').current_buffer_fuzzy_find, {desc = 'fuzzy find in current file buffer'})
keymap.set('n', '<leader>fo', require('telescope.builtin').lsp_document_symbols, {desc = 'fuzzy find LSP/class symbols'})
keymap.set('n', '<leader>fi', require('telescope.builtin').lsp_incoming_calls, {desc = 'fuzzy find LSP/incoming calls'})
keymap.set('n', '<leader>fm', function() require('telescope.builtin').treesitter({symbols={'function', 'method'}}) end, {desc = 'fuzzy find methods in current class'})
keymap.set('n', '<leader>ft', function()
  local success, node = pcall(function() return require('nvim-tree.lib').get_node_at_cursor() end)
  if not success or not node then return end;
  require('telescope.builtin').live_grep({search_dirs = {node.absolute_path}})
end, {desc = 'grep file contents in current nvim-tree node'})

-- Harpoon
local harpoon = require("harpoon")
harpoon:setup()
keymap.set("n", "<leader>ha", function() harpoon:list():add() end, {desc = 'Add Mark to Harpoon'})
keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = 'Open Harpoon Menu'})
keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)
keymap.set("n", "<leader>h5", function() harpoon:list():select(5) end)
keymap.set("n", "<leader>h6", function() harpoon:list():select(6) end)
keymap.set("n", "<leader>h7", function() harpoon:list():select(7) end)
keymap.set("n", "<leader>h8", function() harpoon:list():select(8) end)
keymap.set("n", "<leader>h9", function() harpoon:list():select(9) end)

-- LSP
keymap.set('n', '<leader>gg', '<cmd>lua vim.lsp.buf.hover()<CR>')
keymap.set('n', '<leader>gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
keymap.set('n', '<leader>gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
keymap.set('n', '<leader>gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
keymap.set('n', '<leader>gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
keymap.set('n', '<leader>gr', '<cmd>lua vim.lsp.buf.references()<CR>')
keymap.set('n', '<leader>gs', '<cmd>lua vim.lsp.buf.signature_help()<CR>')
keymap.set('n', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('v', '<leader>gf', '<cmd>lua vim.lsp.buf.format({async = true})<CR>')
keymap.set('n', '<leader>ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
keymap.set('n', '<leader>gl', '<cmd>lua vim.diagnostic.open_float()<CR>')
keymap.set('n', '<leader>gp', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
keymap.set('n', '<leader>gn', '<cmd>lua vim.diagnostic.goto_next()<CR>')
keymap.set('n', '<leader>tr', '<cmd>lua vim.lsp.buf.document_symbol()<CR>')
keymap.set('i', '<C-Space>', '<cmd>lua vim.lsp.buf.completion()<CR>')

keymap.set('n', '<leader>gf', function()
  require('conform').format({ async = true, lsp_fallback = true })
  end, { desc = 'Format buffer' })

-- Quickfix keymaps
keymap.set("n", "<leader>qo", ":copen<CR>") -- open quickfix list
keymap.set("n", "<leader>qf", ":cfirst<CR>") -- jump to first quickfix list item
keymap.set("n", "<leader>qn", ":cnext<CR>") -- jump to next quickfix list item
keymap.set("n", "<leader>qp", ":cprev<CR>") -- jump to prev quickfix list item
keymap.set("n", "<leader>ql", ":clast<CR>") -- jump to last quickfix list item
keymap.set("n", "<leader>qc", ":cclose<CR>") -- close quickfix list

keymap.set('n', '<leader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- Tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open a new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close a tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- previous tab

keymap.set("n", "gx", ":!open <c-r><c-a><CR>") -- open URL under cursor

