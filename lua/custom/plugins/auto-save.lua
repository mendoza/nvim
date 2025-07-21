return {
  'okuuva/auto-save.nvim',
  config = function()
    local autosave = require 'auto-save'
    autosave.setup {
      -- info: testing 500 ms delay for now

      condition = function(buf)
        -- info: hot fix to not save and close harpoon's quick menu
        if vim.bo[buf].filetype == 'harpoon' then
          return false
        end
        return true
      end,
    }
  end,
}
