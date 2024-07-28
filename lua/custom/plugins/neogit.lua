return {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    -- Only one of these is needed, not both.
    'nvim-telescope/telescope.nvim', -- optional
    -- 'ibhagwan/fzf-lua', -- optional
  },
  config = true,
  keys = {
    {
      '<leader>gc',
      function()
        local neogit = require 'neogit'
        neogit.open { cmd = 'commit', kind = 'split' }
      end,
      desc = '[G]it [C]ommit',
    },
  },
}
