return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts_extend = { "spec" },
    opts = {},

    config = function()
        local wk = require("which-key")
        wk.add({
            { "<leader>g", group = "Git" },
            { "<leader>p", group = "Project" },
            { "<leader>t", group = "Trouble/Test" },
            { "<leader>n", group = "Docs" },
            { "<leader>u", group = "Undo" },
            { "<leader>9", group = "99" },
            { "<leader>v", group = "Help" },
            { "<leader>;", group = "WhichKey" },
        })
    end,

    keys = {
        {
            "<leader>;",
            function()
                require("which-key").show({ global = false })
            end,
            desc = "Buffer Keymaps (which-key)",
        },
    },
}