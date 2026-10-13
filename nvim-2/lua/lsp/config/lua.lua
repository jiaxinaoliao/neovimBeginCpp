local common = require("lsp.common-config")

return {
    capabilities = common.capabilities(),
    flags = common.flags,
    on_attach = function(client, bufnr)
        -- ⚠️ lua_ls 的格式化交给 formatter.nvim（stylua）
        common.disableFormat(client)
        common.keyAttach(bufnr)
    end,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            telemetry = { enable = false },
        },
    },
}