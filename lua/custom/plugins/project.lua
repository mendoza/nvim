return {
    "ahmedkhalf/project.nvim",
    dependencies = { "nvim-telescope/telescope-project.nvim" },
    config = function()
        require("project_nvim").setup {
            vim.api.nvim_set_keymap('n', '<leader>sp', ":Telescope projects<CR>", {
                noremap = true,
                silent = true,
                desc = "[S]earch [P]rojects"
            }) }
    end
}
