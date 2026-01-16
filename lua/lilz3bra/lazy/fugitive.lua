return{
    'tpope/vim-fugitive',
    config=function()
        vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "Open Git status" })
        vim.keymap.set('n', 'gu', '<cmd>diffget //2<CR>', { desc = "Diff get from left side (merge conflicts)" })
        vim.keymap.set('n', 'gh', '<cmd>diffget //3<CR>', { desc = "Diff get from right side (merge conflicts)" })

        local zebra_fugitive = vim.api.nvim_create_augroup('zebra_fugitive', {})

        local autocmd = vim.api.nvim_create_autocmd

        autocmd('BufWinEnter', {
            group = zebra_fugitive,
            pattern = '*',
            callback = function()
                if vim.bo.ft ~= 'fugitive' then
                    return
                end

                local bufnr = vim.api.nvim_get_current_buf()
                local opts = { buffer = bufnr, remap = false }
                vim.keymap.set('n', '<leader>p', function()
                    vim.cmd.Git('push')
                end, vim.tbl_extend("force", opts, { desc = "Git push" }))

                vim.keymap.set('n', '<leader>P', function()
                    vim.cmd.Git({ 'pull', '--rebase' })
                end, vim.tbl_extend("force", opts, { desc = "Git pull with rebase" }))

                vim.keymap.set('n', '<leader>t', ':Git push -u origin ', vim.tbl_extend("force", opts, { desc = "Partial push command" }))
            end,
        })
    end
}
