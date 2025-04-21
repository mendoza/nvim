return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  config = function()
    local neogit = require 'neogit'
    local diffview = require 'diffview'
    neogit.setup {
      kind = 'floating',
    }

    diffview.setup {
      view = {
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },
    }

    local wk = require 'which-key'
    wk.add {
      '<leader>g',
      function()
        neogit.open {}
      end,
      {
        desc = 'Open Neogit',
        group = '[G]it',
      },
    }
  end,
}
