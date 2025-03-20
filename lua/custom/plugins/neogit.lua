return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    -- Only one of these is needed, not both.
    'nvim-telescope/telescope.nvim', -- optional
    -- 'ibhagwan/fzf-lua', -- optional
  },
  config = function()
    local neogit = require 'neogit'
    neogit.setup {}

    local wk = require 'which-key'
    wk.add {
      '<leader>g',
      function()
        neogit.open { kind = 'vsplit' }
      end,
      {
        desc = 'Open Neogit',
        group = '[G]it',
      },
    }
  end,
}
