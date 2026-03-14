local common = require("lsp.common-config")

return {
  capabilities = common.capabilities,
  flags = common.flags,  -- common.flags 中应包含 debounce_text_changes 等设置
  on_attach = function(client, bufnr)
    -- 如果需要禁用格式化，取消下面这行注释，并确保 common.disableFormat 存在
    -- common.disableFormat(client)
    common.keyAttach(bufnr)

    -- 如果还需要额外的 gopls 特有按键，可以在这里添加
  end,
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
