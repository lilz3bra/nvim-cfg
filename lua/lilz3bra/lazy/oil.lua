return {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            columns = {
                "icon",
                "permissions",
                "size",
                "mtime",
            },

            view_options = {
                show_hidden = true,
            },
            watch_for_changes = false,
            float = {
                padding = 2,
                max_width = 100,
                max_height = 0.8,
                border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },
            vim.keymap.set("n", "<leader>pv", function()
                require("oil").toggle_float()
            end, { desc = "Open parent directory" })
        })
    end,
}
