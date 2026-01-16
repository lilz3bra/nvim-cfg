return {
	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = {},
			})

			vim.keymap.set("n", "<leader>tt", function()
				require("trouble").toggle("diagnostics", { mode = "document" })
			end, { desc = "Toggle document diagnostics" })

			vim.keymap.set("n", "tn", function()
				require("trouble").next({ skip_groups = true, jump = true })
			end, { desc = "Next trouble item" })

			vim.keymap.set("n", "tp", function()
				require("trouble").prev({ skip_groups = true, jump = true })
			end, { desc = "Previous trouble item" })
		end,
	},
}
