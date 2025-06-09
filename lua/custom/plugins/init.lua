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
    'yetone/avante.nvim',
    event = 'VeryLazy',
    version = false,
    opts = {
      provider = 'copilot',
    },
    build = (function()
      if vim.loop.os_uname().sysname == 'Windows_NT' then
        return 'powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false'
      else
        return 'make'
      end
    end)(),
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'stevearc/dressing.nvim',
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-telescope/telescope.nvim',
      'hrsh7th/nvim-cmp',
      'nvim-tree/nvim-web-devicons',
      {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { 'markdown', 'Avante' },
        },
        ft = { 'markdown', 'Avante' },
      },
    },
  },
  {
    'stevearc/conform.nvim',
    opts = function(_, opts)
      opts.formatters = {
        biome = {
          require_cwd = true,
        },
        prettier = {
          require_cwd = true,
        },
        stylua = {
          require_cwd = true,
        },
      }
      opts.formatters_by_ft = vim.tbl_deep_extend('force', opts.formatters_by_ft, {
        javascript = { 'biome', 'prettier' },
        javascriptreact = { 'biome', 'prettier' },
        typescript = { 'biome', 'prettier' },
        typescriptreact = { 'biome', 'prettier' },
        lua = { 'stylua' },
      })
      return opts
    end,
  },
}
