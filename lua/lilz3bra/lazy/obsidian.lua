return {
    "obsidian-nvim/obsidian.nvim",
    version = "*",
    cmd = {
        "Obsidian"
    },
    keys = {
        { "<leader>nd", "<cmd>Obsidian today<CR>", desc = "Open Daily Note" },
    },

    opts = {
        legacy_commands = false,
        workspaces = {
            {
                name = "personal",
                path = "~/vault/personal",
            },
        },

        daily_notes = {
            folder = "daily",
            date_format = "%Y-%m-%d",
        }
    },
}
