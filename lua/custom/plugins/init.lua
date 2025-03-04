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
}
