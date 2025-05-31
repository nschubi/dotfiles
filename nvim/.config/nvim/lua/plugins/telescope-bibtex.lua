return {
  "nvim-telescope/telescope-bibtex.nvim",
  dependencies = { "nvim-telescope/telescope.nvim" },
  ft = "tex", -- Nur für LaTeX-Dateien laden
  config = function()
    require("telescope").load_extension("bibtex")
  end,
}
