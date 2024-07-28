return {
  'theprimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = true,
  keys = {
    {
      '<leader>a',
      function()
        local harpoon = require 'harpoon'
        harpoon:list():add()
      end,
      desc = 'Harpoon [a]ppend file',
    },
    {
      '<C-e>',
      function()
        local harpoon = require 'harpoon'
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      desc = '[H]arpoon quick [m]enu',
    },
    {
      '<C-h>',
      function()
        local harpoon = require 'harpoon'
        harpoon:list():select(1)
      end,
      desc = 'Select Harpoon 1',
    },
    {
      '<C-j>',
      function()
        local harpoon = require 'harpoon'
        harpoon:list():select(2)
      end,
      desc = 'Select Harpoon 2',
    },
    {
      '<C-k>',
      function()
        local harpoon = require 'harpoon'
        harpoon:list():select(3)
      end,
      desc = 'Select Harpoon 3',
    },
    {
      '<C-l>',
      function()
        local harpoon = require 'harpoon'
        harpoon:list():select(4)
      end,
      desc = 'Select Harpoon 4',
    },
  },
}
