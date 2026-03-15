vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw file explorer" })
vim.keymap.set("i", "jj", "<Esc>", { desc = "Escape insert mode" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to LSP definition" })
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to LSP declaration" })
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to LSP implementation" })
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" })
vim.keymap.set("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
-- Move by visual line instead of logical line
vim.keymap.set('n', 'j', 'gj', { silent = true })
vim.keymap.set('n', 'k', 'gk', { silent = true })

vim.keymap.set("n", "<F1>", function()
    vim.cmd.help(vim.fn.expand("<cword>"))
end, { desc = "Get help for word under cursor" })

vim.keymap.set("n", "<leader>rr", function()
    require("plenary.reload").reload_module("clackity")

    local clackity = require("clackity")
    clackity.Start()
end)

vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Show signature help" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
