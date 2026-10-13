local common = require("lsp.common-config")

return {
    capabilities = common.capabilities(),
    flags = common.flags,
    settings = {
        css  = { validate = true },
        less = { validate = true },
        scss = { validate = true },
    },
    on_attach = function(client, bufnr)
        common.disableFormat(client)
        common.keyAttach(bufnr)
    end,
}