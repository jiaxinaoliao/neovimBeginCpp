local common = require("lsp.common-config")
local keybindings = require("keybindings")

return {
    capabilities = common.capabilities(),
    flags = common.flags,
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
        common.disableFormat(client)

        local function buf_set_keymap(mode, lhs, rhs, opts)
            vim.keymap.set(mode, lhs, rhs,
                vim.tbl_extend("force", { noremap = true, silent = true, buffer = bufnr }, opts or {}))
        end
        keybindings.mapLSP(buf_set_keymap)
        -- 如果以后装了 ts 工具集，可以调用 keybindings.mapTsLSP(buf_set_keymap)
    end,
}