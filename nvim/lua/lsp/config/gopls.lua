local common = require("lsp.common-config")

return {
  -- 继承通用能力
  capabilities = common.capabilities,
  
  -- 继承通用标志，或根据需要覆盖
  flags = common.flags,  -- 假设 common.flags 已包含 debounce_text_changes = 150

  -- 合并 on_attach
  on_attach = function(client, bufnr)
    -- 如果需要禁用格式化，可调用 common.disableFormat(client)
    -- common.disableFormat(client)

    -- 绑定通用快捷键
    common.keyAttach(bufnr)

    -- 如果有 gopls 特有的额外按键，可以加在这里
    -- 例如：vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', { buffer = bufnr })
  end,

  -- gopls 特有的设置
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
