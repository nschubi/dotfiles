-- =============================================================================
-- Keymappings (unified with IdeaVim)
-- =============================================================================

local keymap = vim.keymap
local modes_nvo = { "n", "v", "o" }
local modes_nv = { "n", "v" }

-- =============================================================================
-- Non-Leader Keybindings (shared with IdeaVim)
-- =============================================================================

-- Navigation: H/L for line start/end, J/K for paragraph
keymap.set(modes_nvo, "H", "^", { noremap = true, silent = true })
keymap.set(modes_nvo, "L", "$", { noremap = true, silent = true })
keymap.set(modes_nvo, "J", "}", { noremap = true, silent = true })
keymap.set(modes_nvo, "K", "{", { noremap = true, silent = true })

-- Yank and paste improvements
keymap.set("v", "p", '"_dP`]', { noremap = true, silent = true })
keymap.set("n", "p", "p`]", { noremap = true, silent = true })
keymap.set("v", "y", "ygv<Esc>$", { noremap = true, silent = true })
keymap.set("n", "Y", "y$", { noremap = true, silent = true })

-- Clipboard operations
keymap.set(modes_nv, ",y", '"+y', { noremap = true, silent = true })
keymap.set("n", ",yy", '"+yy', { noremap = true, silent = true })
keymap.set(modes_nv, ",p", '"+p', { noremap = true, silent = true })

-- Delete without yanking
keymap.set(modes_nv, "x", '"_x', { noremap = true, silent = true })
keymap.set(modes_nv, "X", '"_d', { noremap = true, silent = true })
keymap.set("n", "XX", '"_dd', { noremap = true, silent = true })

-- Change without yanking
keymap.set({ "n", "x" }, "c", '"xc', { noremap = true, silent = true })

-- Word operations
keymap.set("n", ",c", "yiw", { noremap = true, silent = true })
keymap.set("n", ",v", "viw", { noremap = true, silent = true })

-- Reselect last-pasted text
keymap.set("n", "gp", "`[v`]", { noremap = true, silent = true })

-- Center screen when jumping to next match
keymap.set(modes_nv, "n", "nzz", { noremap = true, silent = true })
keymap.set(modes_nv, "N", "Nzz", { noremap = true, silent = true })

-- Center screen when scrolling
keymap.set(modes_nv, "<C-u>", "<C-u>zz", { noremap = true, silent = true })
keymap.set(modes_nv, "<C-d>", "<C-d>zz", { noremap = true, silent = true })

-- Indent/outdent keeping selection
keymap.set("x", "<", "<gv", { noremap = true, silent = true })
keymap.set("x", ">", ">gv", { noremap = true, silent = true })

-- Copy whole file
keymap.set("n", "<C-a>", 'ggVG"+y', { noremap = true, silent = true })

-- Open URL under cursor
keymap.set("n", "gx", ":!open <c-r><c-a><CR>", { silent = true })

-- =============================================================================
-- Which-Key group registration
-- =============================================================================

local wk = require("which-key")

wk.add({
  { "<leader>d", group = "Debug / Run" },
  { "<leader>e", group = "Explorer" },
  { "<leader>f", group = "Find" },
  { "<leader>g", group = "Go to" },
  { "<leader>l", group = "Language" },
  { "<leader>m", group = "Marks (Harpoon)" },
  { "<leader>q", group = "Quit / Close" },
  { "<leader>r", group = "Refactoring" },
  { "<leader>t", group = "Tabs" },
  { "<leader>v", group = "Version control" },
  { "<leader>w", group = "Window" },
  { "<leader>x", group = "Quickfix" },
})

-- =============================================================================
-- Leader: [d] Debug / Run
-- =============================================================================

-- Note: Populate in ftplugin/ per language if needed (e.g. dap keymaps).
-- Generic mappings can go here if you use nvim-dap globally:
-- keymap.set("n", "<leader>dc", function() require("dap").continue() end, { desc = "[c]ontinue" })
-- keymap.set("n", "<leader>dd", function() require("dap").toggle_breakpoint() end, { desc = "toggle breakpoint" })
-- keymap.set("n", "<leader>ds", function() require("dap").terminate() end, { desc = "[s]top" })

-- =============================================================================
-- Leader: [e] Explorer
-- =============================================================================

keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "toggle [e]xplorer" })
keymap.set("n", "<leader>ef", ":NvimTreeFindFile<CR>", { desc = "[f]ind file in explorer" })
keymap.set("n", "<leader>er", ":NvimTreeFocus<CR>", { desc = "focus explore[r]" })

-- =============================================================================
-- Leader: [f] Find (Telescope)
-- =============================================================================

keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "show [b]uffers" })
keymap.set("n", "<leader>fc", require("telescope.builtin").current_buffer_fuzzy_find, { desc = "fuzzy find in [c]urrent buffer" })
keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[f]ind files" })
keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep, { desc = "[g]rep files" })
keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags, { desc = "[h]elp tags" })
keymap.set("n", "<leader>fi", require("telescope.builtin").lsp_incoming_calls, { desc = "[i]ncoming calls" })
keymap.set("n", "<leader>fm", function()
  require("telescope.builtin").treesitter({ symbols = { "function", "method" } })
end, { desc = "[m]ethods in current file" })
keymap.set("n", "<leader>fs", require("telescope.builtin").lsp_document_symbols, { desc = "document [s]ymbols" })
keymap.set("n", "<leader>ft", function()
  local success, node = pcall(function()
    return require("nvim-tree.lib").get_node_at_cursor()
  end)
  if not success or not node then return end
  require("telescope.builtin").live_grep({ search_dirs = { node.absolute_path } })
end, { desc = "grep in nvim-[t]ree node" })

-- =============================================================================
-- Leader: [g] Go to (LSP)
-- =============================================================================

keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, { desc = "code [a]ction" })
keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "go to [d]efinition" })
keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "go to [D]eclaration" })
keymap.set("n", "<leader>gg", vim.lsp.buf.hover, { desc = "[g]o into hover" })
keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "go to [i]mplementation" })
keymap.set("n", "<leader>gl", vim.diagnostic.open_float, { desc = "open error detai[l]" })
keymap.set("n", "<leader>gn", vim.diagnostic.goto_next, { desc = "[n]ext diagnostic" })
keymap.set("n", "<leader>gp", vim.diagnostic.goto_prev, { desc = "[p]rev diagnostic" })
keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "go to [r]eferences" })
keymap.set("n", "<leader>gs", vim.lsp.buf.signature_help, { desc = "[s]ignature help" })
keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "go to [t]ype definition" })

-- =============================================================================
-- Leader: [l] Language (registered as group only — populate in ftplugin/)
-- =============================================================================

-- Example ftplugin/java.lua:
--   vim.keymap.set("n", "<leader>lt", "<cmd>!mvn test<CR>", { buffer = true, desc = "run [t]ests" })
--   vim.keymap.set("n", "<leader>lb", "<cmd>!mvn package<CR>", { buffer = true, desc = "[b]uild" })
--
-- Example ftplugin/tex.lua:
--   vim.keymap.set("n", "<leader>ll", "<cmd>VimtexCompile<CR>", { buffer = true, desc = "compi[l]e" })
--   vim.keymap.set("n", "<leader>lp", "<cmd>VimtexView<CR>", { buffer = true, desc = "[p]review" })
--   vim.keymap.set("n", "<leader>lc", "<cmd>VimtexClean<CR>", { buffer = true, desc = "[c]lean" })
--
-- Example ftplugin/go.lua:
--   vim.keymap.set("n", "<leader>lt", "<cmd>GoTest<CR>", { buffer = true, desc = "run [t]ests" })
--   vim.keymap.set("n", "<leader>lg", "<cmd>GoGenerate<CR>", { buffer = true, desc = "[g]enerate" })
--   vim.keymap.set("n", "<leader>lm", "<cmd>GoMod tidy<CR>", { buffer = true, desc = "[m]od tidy" })

-- =============================================================================
-- Leader: [m] Marks (Harpoon)
-- =============================================================================

local harpoon = require("harpoon")
harpoon:setup()

keymap.set("n", "<leader>ma", function() harpoon:list():add() end, { desc = "[a]dd mark" })
keymap.set("n", "<leader>mm", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "[m]arks menu" })
keymap.set("n", "<leader>m1", function() harpoon:list():select(1) end, { desc = "mark [1]" })
keymap.set("n", "<leader>m2", function() harpoon:list():select(2) end, { desc = "mark [2]" })
keymap.set("n", "<leader>m3", function() harpoon:list():select(3) end, { desc = "mark [3]" })
keymap.set("n", "<leader>m4", function() harpoon:list():select(4) end, { desc = "mark [4]" })
keymap.set("n", "<leader>m5", function() harpoon:list():select(5) end, { desc = "mark [5]" })
keymap.set("n", "<leader>m6", function() harpoon:list():select(6) end, { desc = "mark [6]" })
keymap.set("n", "<leader>m7", function() harpoon:list():select(7) end, { desc = "mark [7]" })
keymap.set("n", "<leader>m8", function() harpoon:list():select(8) end, { desc = "mark [8]" })
keymap.set("n", "<leader>m9", function() harpoon:list():select(9) end, { desc = "mark [9]" })

-- =============================================================================
-- Leader: [q] Quit / Close
-- =============================================================================

keymap.set("n", "<leader>qa", ":qa<CR>", { desc = "close [a]ll" })
keymap.set("n", "<leader>qq", ":q<CR>", { desc = "[q]uit buffer" })
keymap.set("n", "<leader>qw", ":%bd|e#|bd#<CR>", { desc = "close all but active" })

-- =============================================================================
-- Leader: [r] Refactoring
-- =============================================================================

keymap.set("n", "<leader>rf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "[f]ormat" })
keymap.set("v", "<leader>rf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "[f]ormat selection" })
keymap.set("n", "<leader>rr", vim.lsp.buf.rename, { desc = "[r]ename" })

-- =============================================================================
-- Leader: [t] Tabs
-- =============================================================================

keymap.set("n", "<leader>tn", ":tabn<CR>", { desc = "[n]ext tab" })
keymap.set("n", "<leader>to", ":tabnew<CR>", { desc = "[o]pen new tab" })
keymap.set("n", "<leader>tp", ":tabp<CR>", { desc = "[p]rev tab" })
keymap.set("n", "<leader>tx", ":tabclose<CR>", { desc = "close tab" })

-- =============================================================================
-- Leader: [v] Version control
-- =============================================================================

-- Populate with gitsigns / fugitive / neogit keymaps, e.g.:
-- keymap.set("n", "<leader>vb", "<cmd>Telescope git_branches<CR>", { desc = "[b]ranches" })
-- keymap.set("n", "<leader>vl", "<cmd>Telescope git_commits<CR>", { desc = "[l]og" })
-- keymap.set("n", "<leader>vs", "<cmd>Telescope git_status<CR>", { desc = "[s]tatus" })

-- =============================================================================
-- Leader: [x] Quickfix
-- =============================================================================

keymap.set("n", "<leader>xc", ":cclose<CR>", { desc = "[c]lose quickfix" })
keymap.set("n", "<leader>xf", ":cfirst<CR>", { desc = "[f]irst item" })
keymap.set("n", "<leader>xl", ":clast<CR>", { desc = "[l]ast item" })
keymap.set("n", "<leader>xn", ":cnext<CR>", { desc = "[n]ext item" })
keymap.set("n", "<leader>xo", ":copen<CR>", { desc = "[o]pen quickfix" })
keymap.set("n", "<leader>xp", ":cprev<CR>", { desc = "[p]rev item" })

-- =============================================================================
-- Flash (standalone leader, equivalent to AceAction in IdeaVim)
-- =============================================================================

keymap.set(modes_nvo, "s", function() require("flash").jump() end, { desc = "Flash jump" })
keymap.set(modes_nvo, "<leader>S", function() require("flash").treesitter() end, { desc = "Flash treesitter" })
keymap.set("n", "<leader>*", function()
  require("flash").jump({ pattern = vim.fn.expand("<cword>") })
end, { desc = "Flash word under cursor" })

-- =============================================================================
-- Misc (standalone leader)
-- =============================================================================

keymap.set("n", "<leader><cr>", ":nohlsearch<CR>", { desc = "clear search highlight" })
keymap.set("i", "<C-Space>", vim.lsp.buf.completion, { silent = true })
