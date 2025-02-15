local status, codecompanion = pcall(require, "codecompanion")
if not status then
  vim.notify("没有找到 codecompanion")
  return
end

require("codecompanion").setup({
  adapters = {
    aliyun = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        env = {
          url = "https://dashscope.aliyuncs.com",
          api_key = "you api key",
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
        env = {
          api_key = function()
            return os.getenv(DEEPSEEK_API_KEY)
          end,
        },
        schema = {
          model = {
            default = "deepseek-coder",
          },
        },
      })
    end,
  },
  strategies = {
    chat = {
      adapter = "aliyun",
    },
    inline = {
      adapter = "aliyun", -- copilot
    },
  },
})
