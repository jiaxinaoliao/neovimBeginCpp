return {
  on_setup = function(server)
    server.setup({
      capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
      settings = {
        css = {
          validate = true,
        },
        less = {
          validate = true,
        },
        scss = {
          validate = true,
        },
      },
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件插件处理
        client.server.document_formatting = false
        client.server.document_range_formatting = false
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- 绑定快捷键
        require("keybindings").mapLSP(buf_set_keymap)
      end,
    })
  end,
}
