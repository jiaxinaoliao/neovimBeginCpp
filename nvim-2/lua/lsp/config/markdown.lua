local common = require("lsp.common-config")

return {
    capabilities = common.capabilities(),
    flags = common.flags,
    on_attach = function(client, bufnr)
        common.keyAttach(bufnr)
        -- marksman 没有格式化能力，无需 disableFormat
    end,
    -- 保持默认设置，不要放 gopls 字段
}