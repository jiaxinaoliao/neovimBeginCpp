-- lsp/config/lua.lua
local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- 直接定义 capabilities 和 flags（不依赖 common）
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local flags = {
    debounce_text_changes = 150,
}

return {
    capabilities = capabilities,
    flags = flags,
    on_attach = function(client, bufnr)
        -- 自定义快捷键（可以复用 keybindings 模块）
        local function buf_set_keymap(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
        end
        require("keybindings").mapLSP(buf_set_keymap)

        -- 注意：这里没有禁用格式化的代码，所以 lua_ls 的格式化能力会被保留
    end,
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            diagnostics = { globals = { "vim" } },
            workspace = {
                library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = { enable = false },
        },
    },
}
