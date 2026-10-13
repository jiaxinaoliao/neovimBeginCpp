local common = require("lsp.common-config")

return {
    capabilities = common.capabilities(),
    flags = common.flags,
    settings = {
        gopls = {
            analyses = { unusedparams = true },
            staticcheck = true,
        },
    },
    on_attach = function(client, bufnr)
        common.keyAttach(bufnr)
    end,
}