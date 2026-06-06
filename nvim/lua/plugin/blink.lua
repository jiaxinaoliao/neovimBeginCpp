-- blink.cmp 配置（替代 nvim-cmp）
-- 官方文档: https://github.com/saghen/blink.cmp

local status_ok, blink = pcall(require, "blink.cmp")
if not status_ok then
    vim.notify("没有找到 blink.cmp")
    return
end

blink.setup({
    -- 使用预设的 keymap
    keymap = {
        preset = "enter",

        ["<C-k>"] = { "select_prev", "fallback" },
        ["<C-j>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },

        -- 确认选择
        ["<CR>"] = { "accept", "fallback" },

        -- 手动触发补全
        ["<A-.>"] = { "show", "fallback" },
        -- 取消
        ["<A-,>"] = { "hide", "fallback" },

        -- 滚动文档
        ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        ["<C-d>"] = { "scroll_documentation_down", "fallback" },

        -- Tab 补全/展开 snippet
        ["<Tab>"] = {
            function(cmp)
                if cmp.snippet_active() then
                    return cmp.accept_snippet_jump()
                end
                return cmp.select_and_accept()
            end,
            "snippet_forward",
            "fallback",
        },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },

    -- 补全触发设置
    completion = {
        -- 补全菜单外观
        menu = {
            auto_show = true,
            border = "single",
            winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder",
        },

        -- 文档窗口外观（注意 window 子表）
        documentation = {
            auto_show = true,
            window = {
                border = "single",
                winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder",
            },
        },
    },
    -- 补全源配置
    sources = {
        default = { "lsp", "snippets", "buffer", "path" },
        providers = {
            lsp = {
                min_keyword_length = 0, -- 设置为 0 以获得即时补全体验
                -- ... 其他 lsp 相关配置
            },
            -- 你可以为其他 source (如 buffer) 设置不同的值
            -- buffer = { min_keyword_length = 2 },
        },
    },

    -- 外观
    appearance = {
        -- 使用 lspkind 的图标集
        use_nvim_cmp_as_default = false,
        -- 从 lspkind 获取图标（如果安装了 lspkind-nvim）
        nerd_font_variant = "mono",
    },

    -- fuzzy 匹配
    fuzzy = {
        implementation = "prefer_rust",
        -- 新版自动启用
        -- frecency = { enabled = true },
        -- proximity = { enabled = true },
    },

    -- snippet 支持 自动设置
    -- snippet = {
    --     -- 使用内置 snippet 引擎
    --     expand = function(body)
    --         -- 使用 vim.snippet 或内置的 blink expand
    --         vim.snippet.expand(body)
    --     end,
    -- },

    -- LSP 相关
    -- blink.cmp 会自动从 nvim-lspconfig 获取 capabilities
    -- 无需手动设置
})
