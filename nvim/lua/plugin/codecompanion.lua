local status, codecompanion = pcall(require, "codecompanion")
if not status then
    vim.notify("没有找到 codecompanion")
    return
end

require("codecompanion").setup({
    adapters = {
        deepseek = function()
            local adapter = require("codecompanion.adapters").extend("openai_compatible", {
                name = "deepseek",
                env = {
                    url = "https://api.deepseek.com",
                    api_key = os.getenv("DEEPSEEK_API_KEY"),
                },
                schema = {
                    model = {
                        default = "deepseek-v4-flash", -- 先用普通模型测试
                        choices = {
                            ["deepseek-reasoner"] = { opts = { can_reason = true } },
                            "deepseek-v4-flash",
                        },
                    },
                },
            })
            -- 增加内容清洗逻辑
            adapter.process_messages = function(messages)
                local clean = function(str)
                    if type(str) ~= "string" then
                        return str
                    end
                    -- 移除无效 UTF-8 字符（将非法字节替换为 �，或直接删掉）
                    -- 方法1：保留有效字符，删除无效字节
                    -- 将非法字符替换为 � (U+FFFD)
                    return str:gsub("[^\x01-\x7F\xC2-\xF4][\x80-\xBF]*", "\xEF\xBF\xBD")
                end
                for _, msg in ipairs(messages) do
                    if msg.content then
                        if type(msg.content) == "string" then
                            msg.content = clean(msg.content)
                        elseif type(msg.content) == "table" then
                            for _, part in ipairs(msg.content) do
                                if part.type == "text" and part.text then
                                    part.text = clean(part.text)
                                end
                            end
                        end
                    end
                end
                return messages
            end
            return adapter
        end,
    },
    strategies = {
        chat = { adapter = "deepseek" },
        inline = { adapter = "deepseek" },
        cmd = { adapter = "deepseek" },
    },
    opts = { language = "Chinese" },
})
