local common = require("lsp.common-config")

return {
  capabilities = common.capabilities,
  flags = common.flags,  -- 假设 common.flags 已包含 debounce_text_changes = 150
  on_attach = function(client, bufnr)
    common.disableFormat(client)  -- 如果不需要格式化，启用此行
    common.keyAttach(bufnr)
  end,
}
