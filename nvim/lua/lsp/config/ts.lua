local keybindings = require("keybindings")
local ts_utils = require("nvim-lsp-ts-utils")

ts_utils.setup({
  debug = false,
  disable_commands = false,
  enable_import_on_completion = false,
  import_all_timeout = 5000,
  import_all_priorities = {
    same_file = 1,
    local_files = 2,
    buffer_content = 3,
    buffers = 4,
  },
  import_all_scan_buffers = 100,
  import_all_select_source = false,
  always_organize_imports = true,
  filter_out_diagnostics_by_severity = {},
  filter_out_diagnostics_by_code = { 80001 },
  auto_inlay_hints = true,
  inlay_hints_highlight = "Comment",
  inlay_hints_priority = 200,
  inlay_hints_throttle = 150,
  inlay_hints_format = {
    Type = {},
    Parameter = {},
    Enum = {},
  },
  update_imports_on_move = false,
  require_confirmation_on_move = false,
  watch_dir = nil,
})

return {
  flags = {
    debounce_text_changes = 150,
  },
  capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
  init_options = {
    hostInfo = "neovim",
    preferences = {
      includeInlayParameterNameHints = "all",
      includeInlayParameterNameHintsWhenArgumentMatchesName = true,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = true,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  },
  on_attach = function(client, bufnr)
    -- 禁用格式化
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false

    -- 绑定通用 LSP 快捷键
    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    keybindings.mapLSP(buf_set_keymap)

    -- 为当前客户端设置 ts_utils（必须为每个客户端调用）
    ts_utils.setup_client(client)

    -- 绑定 ts_utils 提供的额外快捷键
    keybindings.mapTsLSP(buf_set_keymap)
  end,
}
