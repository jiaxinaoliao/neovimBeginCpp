local ok, formatter = pcall(require, "formatter")
if not ok then
    vim.notify("没有找到 formatter", vim.log.levels.WARN)
    return
end

-- clang-format 的配置文件路径（你自己维护的）
local CLANG_FORMAT_STYLE = "file:D:/CppApp/lf-windows-amd64/.clang-format"

formatter.setup({
    filetype = {
        cpp = {
            function()
                return {
                    exe = "clang-format",
                    args = { "--style=" .. CLANG_FORMAT_STYLE },
                    stdin = true,
                    try_node_modules = true,
                }
            end,
        },
        c = {
            function()
                return {
                    exe = "clang-format",
                    args = { "--style=" .. CLANG_FORMAT_STYLE },
                    stdin = true,
                    try_node_modules = true,
                }
            end,
        },
        lua = {
            function()
                return {
                    exe = "stylua",
                    args = { "-" },
                    stdin = true,
                }
            end,
        },
        python = {
            function()
                return {
                    exe = "black",
                    args = {},
                    stdin = true,
                }
            end,
        },
        rust = {
            function()
                return {
                    exe = "rustfmt",
                    args = { "--emit=stdout" },
                    stdin = true,
                }
            end,
        },
        javascript = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                        "--single-quote",
                    },
                    stdin = true,
                }
            end,
        },
        typescript = {
            function()
                return {
                    exe = "prettier",
                    args = {
                        "--stdin-filepath",
                        vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
                        "--single-quote",
                    },
                    stdin = true,
                }
            end,
        },
    },
})
