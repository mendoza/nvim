-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Note: centering the screen after scrolling
vim.keymap.set('n', '<c-d>', '<c-d>zz')
vim.keymap.set('n', '<c-u>', '<c-u>zz')

vim.opt.tabstop = 2

return {
  { 'github/copilot.vim' },
  -- { 'tpope/vim-fugitive' },
  {
    'stevearc/conform.nvim',
    opts = function(_, opts)
      local formatter_configs = {
        prettier = { config_files = { '.prettierrc', '.prettierrc.json', '.prettierrc.yml', '.prettierrc.yaml', '.prettierrc.js', 'prettier.config.js' } },
        biome = { config_files = { 'biome.json', 'biome.jsonc' } },
        stylua = { config_files = { 'stylua.toml', '.stylua.toml' } },
      }

      local function find_project_root(filepath)
        return vim.fs.root(filepath, { '.git', 'package.json' }) or vim.fn.getcwd()
      end

      local function has_config_file(formatter, filepath)
        local config = formatter_configs[formatter]
        if not config then
          return false
        end

        local root = find_project_root(filepath)
        for _, file in ipairs(config.config_files) do
          if vim.fn.filereadable(root .. '/' .. file) == 1 then
            return true
          end
        end
        return false
      end

      local function get_formatters(formatters_to_check, fallback_order, buf)
        local filepath = vim.api.nvim_buf_get_name(buf)
        if filepath == '' then
          return fallback_order or formatters_to_check
        end

        for _, formatter in ipairs(formatters_to_check) do
          if has_config_file(formatter, filepath) then
            return { formatter }
          end
        end
        return fallback_order or formatters_to_check
      end

      local formatters = {
        lua = function(buf)
          return get_formatters({ 'stylua' }, { 'stylua' }, buf)
        end,
        javascript = function(buf)
          return get_formatters({ 'prettier', 'biome' }, { 'prettier', 'biome' }, buf)
        end,
        typescript = function(buf)
          return get_formatters({ 'prettier', 'biome' }, { 'prettier', 'biome' }, buf)
        end,
        typescriptreact = function(buf)
          return get_formatters({ 'prettier', 'biome' }, { 'prettier', 'biome' }, buf)
        end,
        javascriptreact = function(buf)
          return get_formatters({ 'prettier', 'biome' }, { 'prettier', 'biome' }, buf)
        end,
        svelte = function(buf)
          return get_formatters({ 'prettier', 'biome' }, { 'prettier', 'biome' }, buf)
        end,
      }

      for ft, formatter in pairs(formatters) do
        opts.formatters_by_ft[ft] = formatter
      end

      return opts
    end,
  },
}
