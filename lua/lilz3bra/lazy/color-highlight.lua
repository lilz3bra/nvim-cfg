return {
    "catgoose/nvim-colorizer.lua",
    event = "BufReadPre",
    opts = {
        filetypes = { "*" },
        options = {
            parsers = {
                css = true,                      -- preset: names, hex, rgb, hsl, oklch, css_var
                css_var_rgb = { enable = true }, -- bare "R, G, B" custom properties (highlights the definitions themselves)
                tailwind = { enable = true },
                hex = {
                    default = true,
                    rrggbbaa = true,
                    aarrggbb = true,
                },
                -- Workaround for a real upstream limitation: css_var_rgb's pattern
                -- requires a leading "--name:" prefix, so it can't be used as the
                -- sub-parser css_var calls to resolve a definition's *value* when
                -- trying to color var(--name) references. This custom parser
                -- re-scans the buffer for "--name: R,G,B" definitions directly
                -- whenever it sees var(--name), so var() usages resolve too.
                custom = {
                    {
                        name = "css_var_rgb_ref",
                        prefixes = { "var(" },
                        parse = function(ctx)
                            local sub = ctx.line:sub(ctx.col)
                            local name = sub:match("^var%(%s*%-%-([%w_-]+)%s*[,)]")
                            if not name then
                                return
                            end
                            -- find the matching closing paren (handles nested parens in fallbacks)
                            local depth, len = 0, nil
                            for j = 1, #sub do
                                local c = sub:byte(j)
                                if c == 0x28 then     -- (
                                    depth = depth + 1
                                elseif c == 0x29 then -- )
                                    depth = depth - 1
                                    if depth == 0 then
                                        len = j
                                        break
                                    end
                                end
                            end
                            if not len then
                                return
                            end
                            -- escape Lua pattern magic chars (variable names contain "-")
                            local escaped = name:gsub("[%(%)%.%%%+%-%*%?%[%]%^%$]", "%%%1")
                            local lines = vim.api.nvim_buf_get_lines(ctx.bufnr, 0, -1, false)
                            for _, line in ipairs(lines) do
                                local r, g, b =
                                    line:match("%-%-" .. escaped .. "%s*:%s*(%d+)%s*,%s*(%d+)%s*,%s*(%d+)")
                                if r then
                                    return len, string.format("%02x%02x%02x", tonumber(r), tonumber(g), tonumber(b))
                                end
                            end
                        end,
                    },
                },
            },
            display = {
                mode = "virtualtext", -- swap back to "virtualtext" once you're done testing
            },
        },
    },
}
