return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}
    vim.keymap.set('n', '<leader>a', function()
      harpoon:list():add()
    end)
    vim.keymap.set('n', '<C-e>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
    vim.keymap.set('n', '<C-h>', function()
      harpoon:list():select(1)
    end)
    vim.keymap.set('n', '<C-j>', function()
      harpoon:list():select(2)
    end)
    vim.keymap.set('n', '<C-k>', function()
      harpoon:list():select(3)
    end)
    vim.keymap.set('n', '<C-l>', function()
      harpoon:list():select(4)
    end)
  end,
  keys = {
    {
      '<leader>a',
      desc = 'Harpoon [a]ppend file',
    },
    {
      '<C-e>',
      desc = '[H]arpoon quick [m]enu',
    },
    {
      '<C-h>',
      desc = 'Select Harpoon 1',
    },
    {
      '<C-j>',
      desc = 'Select Harpoon 2',
    },
    {
      '<C-k>',
      desc = 'Select Harpoon 3',
    },
    {
      '<C-l>',
      desc = 'Select Harpoon 4',
    },
  },
}
