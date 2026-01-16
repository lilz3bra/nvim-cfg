return {
	"theprimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", function()
			mark.add_file()
		end, { desc = "Add file to Harpoon" })
		vim.keymap.set("n", "<leader>e", function()
			ui.toggle_quick_menu()
		end, { desc = "Toggle Harpoon menu" })
		vim.keymap.set("n", "<leader>h", function()
			ui.nav_file(1)
		end, { desc = "Harpoon file 1" })
		vim.keymap.set("n", "<leader>j", function()
			ui.nav_file(2)
		end, { desc = "Harpoon file 2" })
		vim.keymap.set("n", "<leader>k", function()
			ui.nav_file(3)
		end, { desc = "Harpoon file 3" })
		vim.keymap.set("n", "<leader>l", function()
			ui.nav_file(4)
		end, { desc = "Harpoon file 4" })
	end,
}
