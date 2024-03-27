return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local todo = require 'todo-comments'
    todo:setup()
    vim.keymap.set('n', '<leader>st', ':TodoTelescope<CR>')
  end,
  keys = { {
    '<leader>st',
    desc = '[S]earch [T]odo comments',
  } },
}
