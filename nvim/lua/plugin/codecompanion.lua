local status, codecompanion = pcall(require, "codecompanion")
if not status then
    vim.notify("没有找到 codecompanion")
    return
end

require("codecompanion").setup({
    opts = {
        event = "VeryLazy",
        aliyun = function()
            return require("codecompanion.adapters").extend("openai_compatible", {
                env = {
                    url = "https://dashscope.aliyuncs.com",
                    api_key = "you-key",
                    chat_url = "/compatible-mode/v1/chat/completions",
                },
                schema = {
                    model = {
                        default = "qwen-plus",
                    },
                },
            })
        end,
        deepseek = function()
            return require("codecompanion.adapters").extend("deepseek", {
                name = "deepseek",
                env = {
                    api_key = "you-key",
                },
                schema = {
                    model = {
                        default = "deepseek-coder",
                        choices = { ["deepseek-coder"] = { opts = { can_reason = true } } },
                    },
                },
            })
        end,
    },
    strategies = {
        chat = {
            adapter = "deepseek",
        },
        inline = {
            adapter = "deepseek", -- copilot
        },
    },
    opts = { language = "Chinese" },
})
