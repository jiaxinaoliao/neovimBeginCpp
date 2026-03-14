local common = require("lsp.common-config")

return {
  capabilities = common.capabilities,
  flags = common.flags,  -- 这里会使用 common.flags 中的 debounce_text_changes 等设置
  on_attach = function(client, bufnr)
    common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
}
