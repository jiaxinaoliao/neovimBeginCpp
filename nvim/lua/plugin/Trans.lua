local status, Trans = pcall(require, "Trans")
if not status then
    vim.notify("没有找到 Trans")
    return
end

Trans.setup({
    -- keys = {
    -- 	-- 可以换成其他你想映射的键
    -- 	{ "mm", mode = { "n", "x" }, "<Cmd>Translate<CR>", desc = "󰊿 Translate" },
    -- 	{ "mk", mode = { "n", "x" }, "<Cmd>TransPlay<CR>", desc = " Auto Play" },
    -- 	-- 目前这个功能的视窗还没有做好，可以在配置里将view.i改成hover
    -- 	{ "mi", "<Cmd>TranslateInput<CR>", desc = "󰊿 Translate From Input" },
    -- },
    opts = {
        -- dir_path = vim.fn.stdpath("data") .. "/dict/",
        event = "VeryLazy",
        frontend = {
            hover = {
                keymaps = {
                    pageup = "<C-u>",
                    pagedown = "<C-d>",
                    pin = "<leader>[",
                    close = "<leader>]",
                    toggle_entry = "<leader>;",
                },
            },
        },
    },
})
