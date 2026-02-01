return {
  'nvim-treesitter/nvim-treesitter',
  event = 'VeryLazy',
  build = ':TSUpdate',
  config = function()
    require('nvim-treesitter').setup({
      ensure_installed = { 'lua', 'comment' },
    })
  end,
}

