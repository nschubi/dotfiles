-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  'neovim/nvim-lspconfig',
  event = 'VeryLazy',
  dependencies = {
    -- LSP Management
    { 'williamboman/mason.nvim' },
    { 'williamboman/mason-lspconfig.nvim' },
    -- Auto-Install LSPs, linters, formatters, debuggers
    { 'WhoIsSethDaniel/mason-tool-installer.nvim' },
    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} },
    -- Additional lua configuration, makes nvim stuff amazing!
    { 'folke/lazydev.nvim', opts = {} }, -- neodev.nvim ist deprecated, lazydev.nvim ist der Nachfolger
  },
  config = function()
    require('mason').setup()
    require('mason-lspconfig').setup({
      -- Install these LSPs automatically
      ensure_installed = {
        'bashls',
        'cssls',
        'html',
        'gopls',
        'gradle_ls',
        'groovyls',
        'lua_ls',
        -- 'jdtls',
        'jsonls',
        'lemminx',
        'marksman',
        'quick_lint_js',
        'yamlls',
      },
      -- Automatisch LSPs aktivieren nach Installation
      automatic_enable = true,
    })

    require('mason-tool-installer').setup({
      ensure_installed = {
        -- 'java-debug-adapter',
        -- 'java-test',
      },
    })

    vim.api.nvim_command('MasonToolsInstall')

    -- Capabilities für Autocompletion (cmp)
    local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- Globale LSP-Konfiguration für alle Server
    vim.lsp.config('*', {
      capabilities = lsp_capabilities,
      on_attach = function(client, bufnr)
        -- Deine Keybindings hier...
      end,
    })

    -- Lua LSP spezifische Einstellungen
    vim.lsp.config.lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    }

    -- Globally configure all LSP floating preview popups
    local open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
      opts = opts or {}
      opts.border = opts.border or 'rounded'
      return open_floating_preview(contents, syntax, opts, ...)
    end
  end,
}
