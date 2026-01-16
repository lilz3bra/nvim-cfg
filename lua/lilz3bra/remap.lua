vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw file explorer" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape insert mode" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to LSP definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to LSP declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to LSP implementation" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

vim.keymap.set("n", "<leader>rr", function()
	require("plenary.reload").reload_module("clackity")

	local clackity = require("clackity")
	clackity.Start()
	print("Clackity Reloaded! 🚀")
end)
