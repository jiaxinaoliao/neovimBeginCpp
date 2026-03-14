local common = require("lsp.common-config")

return {
  capabilities = common.capabilities,
  flags = common.flags,  -- 假设 common.flags 已包含 debounce_text_changes
  on_attach = function(client, bufnr)
    common.keyAttach(bufnr)  -- 如果 common 中有通用按键绑定
    common.disableFormat(client)  -- 如果需要禁用格式化
    -- 可以添加 yamlls 特有的按键或行为
  end,
  settings = {
    yaml = {
      format = { enable = true },
      schemas = {
        ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"] = "conf/**/*catalog*",
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
      },
    },
  },
}
