return {
    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("harpoon"):setup()
    end,
    keys = { {
        "<leader>ha",
        function()
            require("harpoon"):list():append()
        end,
        desc = "[H]arpoon [a]ppend file"
    }, {
        "<leader>hm",
        function()
            local harpoon = require("harpoon")
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end,
        desc = "[H]arpoon quick [m]enu"
    }, {
        "<leader>1",
        function()
            require("harpoon"):list():select(1)
        end,
        desc = "[H]arpoon to file 1"
    }, {
        "<leader>2",
        function()
            require("harpoon"):list():select(2)
        end,
        desc = "[H]arpoon to file 2"
    }, {
        "<leader>3",
        function()
            require("harpoon"):list():select(3)
        end,
        desc = "[H]arpoon to file 3"
    }, {
        "<leader>4",
        function()
            require("harpoon"):list():select(4)
        end,
        desc = "[H]arpoon to file 4"
    } }
}
