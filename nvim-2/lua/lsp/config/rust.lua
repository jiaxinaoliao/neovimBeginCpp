local common = require("lsp.common-config")

return {
    capabilities = common.capabilities(),
    flags = common.flags,
    settings = {
        ["rust-analyzer"] = {
            checkOnSave = { command = "clippy" },
        },
    },
    on_attach = function(client, bufnr)
        common.disableFormat(client)
        common.keyAttach(bufnr)
    end,
}