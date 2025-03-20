-- Autoformat
-- Adds autofomatting capabilities to the editor using the Conform plugin
-- NOTE: autofomatting is already included in init.lua but contains only the base
-- config. This will add priority to formatters with config files present on the CWD

return {
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

    local function get_first_configured_formatter(fallback_order, buf)
      local filepath = vim.api.nvim_buf_get_name(buf)
      if filepath == '' then
        return fallback_order
      end

      for _, formatter in ipairs(fallback_order) do
        if has_config_file(formatter, filepath) then
          return { formatter }
        end
      end
      return fallback_order
    end

    local formatters = {
      lua = function(buf)
        return get_first_configured_formatter({ 'stylua' }, buf)
      end,
      javascript = function(buf)
        return get_first_configured_formatter({ 'prettier', 'biome' }, buf)
      end,
    }

    for ft, formatter in pairs(formatters) do
      opts.formatters_by_ft[ft] = formatter
    end

    return opts
  end,
}
