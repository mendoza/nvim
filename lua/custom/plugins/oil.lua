return {
  'stevearc/oil.nvim',
  config = function()
    require('oil').setup()
    vim.keymap.set('n', '-', '<cmd>Oil<CR>', { noremap = true, silent = true })
  end,
}
