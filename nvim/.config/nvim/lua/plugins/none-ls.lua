return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			debug = true,
			sources = {
				-- Formatters
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
        -- Formatter Go
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports_reviser,
				-- Linters
				require("none-ls.diagnostics.eslint_d"),
			},
		})

		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
