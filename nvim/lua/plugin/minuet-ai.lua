local ok, minuet = pcall(require, "minuet")
if not ok then
    vim.notify("没有找到 minuet-ai.nvim", "error")
    return
end

minuet.setup({
    virtualtext = {
        auto_trigger_ft = { "lua", "cpp", "toml" },
        keymap = {
            -- accept whole completion
            accept = "<A-A>",
            -- accept one line
            accept_line = "<A-a>",
            -- accept n lines (prompts for number)
            -- e.g. "A-z 2 CR" will accept 2 lines
            accept_n_lines = "<A-z>",
            -- Cycle to prev completion item, or manually invoke completion
            prev = "<A-[>",
            -- Cycle to next completion item, or manually invoke completion
            next = "<A-]>",
            dismiss = "<A-e>",
        },
    },
    lsp = {
        enabled_ft = { "toml", "lua", "cpp" },
        completion = {
            -- Enables automatic completion triggering using `vim.lsp.completion.enable`
            enabled_auto_trigger_ft = { "cpp", "lua" },
        },
    },
    provider = "openai_fim_compatible",
    provider_options = {
        openai_fim_compatible = {
            api_key = os.getenv("DEEPSEEK_API_KEY"),
            name = "deepseek",
            endpoint = "https://api.deepseek.com/beta/completions", -- DeepSeek 的补全端点
            model = "deepseek-v4-pro",
            optional = {
                max_tokens = 256,
                top_p = 0.9,
            },
        },
    },
})
