return {
	"lervag/vimtex",
	lazy = false,
	init = function()
		vim.g.vimtex_view_method = "zathura"

    -- BibTeX-Integration
    vim.g.vimtex_bibliography_backends = { 'bibtex' }
    vim.g.vimtex_complete_bib = {
      simple = 1,
      menu_fmt = '@key: @title'
    }

    -- Deutsche Silbentrennung
    vim.g.vimtex_compiler_latexmk = {
      options = {
        '-pdf',
        '-shell-escape',
        '-verbose',
        '-file-line-error',
        '-synctex=1',
        '-interaction=nonstopmode',
      },
    }
	end,
}
