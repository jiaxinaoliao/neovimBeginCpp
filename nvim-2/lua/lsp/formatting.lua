local lspkind = require("lspkind")

return {
    format = lspkind.cmp_format({
        mode = "symbol_text",
        maxwidth = 50,
        before = function(entry, vim_item)
            vim_item.menu = "[" .. string.upper(entry.source.name) .. "]"
            return vim_item
        end,
    }),
}
