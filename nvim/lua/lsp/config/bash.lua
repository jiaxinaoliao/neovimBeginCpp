local common = require("lsp.common-config")
return {
    capabilities = common.capabilities,
    flags = common.flags,
    on_attach = function(client, bufnr)
        client.server_capabilities.document_formatting = false
        client.server_capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
            ---@diagnostic disable-next-line: missing-parameter
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        require("keybindings").mapLSP(buf_set_keymap)
    end,
}
