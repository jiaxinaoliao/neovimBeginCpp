local common = require("lsp.common-config")

return {
    capabilities = common.capabilities(),
    flags = common.flags,
    settings = {
        yaml = {
            format = { enable = true },
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            },
        },
    },
    on_attach = function(client, bufnr)
        common.keyAttach(bufnr)
    end,
}