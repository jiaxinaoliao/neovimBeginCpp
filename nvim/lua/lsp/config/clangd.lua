local common = require("lsp.common-config") -- 如果暂时不用可以删除

return {
    flags = {
        debounce_text_changes = 150,
    },
    on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件处理
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require("keybindings").mapLSP(buf_set_keymap)
    end,
}
