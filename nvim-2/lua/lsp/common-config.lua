local M = {}

-- 给每个 buffer 绑 LSP 键位
M.keyAttach = function(bufnr)
    local function buf_set_keymap(mode, lhs, rhs, opts)
        vim.keymap.set(mode, lhs, rhs,
            vim.tbl_extend("force", { noremap = true, silent = true, buffer = bufnr }, opts or {}))
    end
    require("keybindings").mapLSP(buf_set_keymap)
end

-- 禁用 LSP 的格式化（交给 formatter.nvim 处理）
local DISABLE_LSP_FORMAT = false

M.disableFormat = function(client)
    if not DISABLE_LSP_FORMAT then return end
    if not client or not client.server_capabilities then return end
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
end

-- LSP capabilities（用函数，避免 require 时就加载 cmp_nvim_lsp）
M.capabilities = function()
    local ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
    if ok then
        return cmp_lsp.default_capabilities()
    end
    return vim.lsp.protocol.make_client_capabilities()
end

-- 通用 flags
M.flags = {
    debounce_text_changes = 150,
}

return M
