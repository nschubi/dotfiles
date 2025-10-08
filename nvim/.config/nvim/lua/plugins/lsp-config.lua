return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "html", "cssls", "emmet_ls", "gopls", "ltex", "texlab" },
        handlers = {}
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      vim.lsp.config('*', {
        capabilities = capabilities,
      })

      -- 2. ltex mit zusätzlichen Settings konfigurieren
      vim.lsp.config('ltex', {
        settings = {
          ltex = {
            language = "auto",
            completionEnabled = false,
            additionalRules = {
              enablePickyRules = false,
              motherTongue = "de-DE"
            }
          }
        }
      })

      -- 3. Server aktivieren (statt setup)
      vim.lsp.enable('lua_ls')
      vim.lsp.enable('ts_ls')
      vim.lsp.enable('html')
      vim.lsp.enable('cssls')
      vim.lsp.enable('emmet_ls')
      vim.lsp.enable('gopls')
      vim.lsp.enable('ltex')
      vim.lsp.enable('texlab')

      -- 4. Keybindings bleiben gleich
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n", "v" }, "<M-CR>", vim.lsp.buf.code_action, {})
      end
  },
}
