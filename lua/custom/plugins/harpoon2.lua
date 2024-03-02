return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon.setup()
        vim.api.nvim_set_keymap("n", "<leader>ha", [[<Cmd>lua require("harpoon").list():append()<CR>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>hm", [[<Cmd>lua require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())<CR>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>1", [[<Cmd>lua require("harpoon").list():select(1)<CR>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>2", [[<Cmd>lua require("harpoon").list():select(2)<CR>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>3", [[<Cmd>lua require("harpoon").list():select(3)<CR>]], { noremap = true, silent = true })
        vim.api.nvim_set_keymap("n", "<leader>4", [[<Cmd>lua require("harpoon").list():select(4)<CR>]], { noremap = true, silent = true })
    end,
    keys = { {
        "<leader>ha",
        desc = "[H]arpoon [a]ppend file"
    }, {
        "<leader>hm",
        desc = "[H]arpoon quick [m]enu"
    }, {
        "<leader>1",
        desc = "[H]arpoon to file 1"
    }, {
        "<leader>2",
        desc = "[H]arpoon to file 2"
    }, {
        "<leader>3",
        desc = "[H]arpoon to file 3"
    }, {
        "<leader>4",
        desc = "[H]arpoon to file 4"
    } }
}
