local common = require("lsp.common-config")

return {
  capabilities = common.capabilities,
  flags = common.flags,   -- 假设 common.flags 包含 debounce_text_changes
  settings = {
    css = { validate = true },
    less = { validate = true },
    scss = { validate = true },
  },
  on_attach = function(client, bufnr)
    common.disableFormat(client)   -- 复用通用禁用格式化函数
    common.keyAttach(bufnr)        -- 复用通用按键绑定
    -- 如果有针对 CSS 的额外按键，可以加在这里
  end,
}
