return {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "brenoprata10/nvim-highlight-colors",
        "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = function()
        local cmp = require("cmp")
        local luasnip = require("luasnip")

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered({
                    border = "rounded",
                    col_offset = -3,
                    side_padding = 1,
                    winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
                }),
                documentation = cmp.config.window.bordered({
                    border = "rounded",
                    winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
                }),

            },
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                -- Force cmp to ignore Down arrow and move cursor instead
                ["<Down>"] = cmp.mapping(function(fallback)
                    fallback()
                end, { "i" }),

                -- Force cmp to ignore Up arrow and move cursor instead
                ["<up>"] = cmp.mapping(function(fallback)
                    fallback()
                end, { "i" }),

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),
                ["<S-CR>"] = cmp.mapping.confirm({ select = true }),
                ["<S-Space>"] = cmp.mapping.complete(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp",                priority = 100 },
                { name = "nvim_lsp_signature_help", priority = 90 },
                { name = "luasnip",                 priority = 50 },
            }, {
                { name = "buffer", priority = 30 },
                { name = "path",   priority = 10 },
            }),
            formatting = {
                format = require("nvim-highlight-colors").format
            },
        })
    end,
}
