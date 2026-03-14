local status, codecompanion = pcall(require, "codecompanion")
if not status then
    vim.notify("没有找到 codecompanion")
    return
end

require("codecompanion").setup({
    event = "VeryLazy",
    aliyun = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
            env = {
                url = "https://dashscope.aliyuncs.com",
                api_key = os.getenv("ALIYUN_API_KEY"),
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
        return require("codecompanion.adapters").extend("openai_compatible", {
            name = "deepseek",
            env = {
                url = "https://api.deepseek.com",
                api_key = os.getenv("DEEPSEEK_API_KEY"),
            },
            schema = {
                model = {
                    default = "deepseek-reasoner",
                    choices = {
                        ["deepseek-reasoner"] = { opts = { can_reason = true } },
                        "deepseek-chat",
                    },
                },
            },
        })
    end,
    strategies = {
        chat = {
            adapter = "deepseek",
        },
        inline = {
            adapter = "deepseek", -- copilot
        },
        cmd = {
            adapter = "deepseek",
        }
    },
    opts = { language = "Chinese" },
})

