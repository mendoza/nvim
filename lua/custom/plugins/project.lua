return {
    "ahmedkhalf/project.nvim",

    dependencies = {"nvim-telescope/telescope-project.nvim"},
    config = function()
        require("project_nvim").setup { -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        -- vim.api.nvim_set_keymap('n', '<leader>pr', , {
        --     noremap = true,
        --     silent = true
        -- })
        vim.api.nvim_set_keymap('n', '<leader>pr', ":Telescope projects<CR>", {
            noremap = true,
            silent = true,
            desc = "Open [P]roject [r]ecent"
        })}

    end
}
