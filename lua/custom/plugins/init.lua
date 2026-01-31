-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Note: centering the screen after scrolling
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

vim.opt.tabstop = 2
vim.opt.fileformats = 'unix,dos'

return {
  { 'github/copilot.vim' },
  {
    'stevearc/conform.nvim',
    opts = function(_, opts)
      local requireCwdConfig = {
        require_cwd = true,
      }
      opts.formatters = {
        biome = requireCwdConfig,
        prettier = requireCwdConfig,
        stylua = requireCwdConfig,
      }
      opts.format_on_save = nil
      opts.formatters_by_ft['json'] = { 'biome', 'prettier' }
      opts.formatters_by_ft['javascript'] = { 'biome', 'prettier' }
      opts.formatters_by_ft['typescript'] = { 'biome', 'prettier' }
      opts.formatters_by_ft['typescriptreact'] = { 'biome', 'prettier' }
      opts.formatters_by_ft['javascriptreact'] = { 'biome', 'prettier' }
      opts.formatters_by_ft['markdown'] = { 'markdownlint' }
      return opts
    end,
  },
  {
    'rcarriga/nvim-notify',
    config = function()
      require('notify').setup {
        stages = 'fade_in_slide_out',
        background_colour = 'FloatShadow',
        timeout = 3000,
      }
      vim.notify = require 'notify'
    end,
  },
}
