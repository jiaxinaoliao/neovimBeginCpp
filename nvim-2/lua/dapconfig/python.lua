local dap = require("dap")

dap.adapters.python = function(cb, config)
    if config.request == "attach" then
        local port = (config.connect or config).port
        local host = (config.connect or config).host or "127.0.0.1"
        cb({
            type = "server",
            port = assert(port, "`connect.port` is required for a python `attach` configuration"),
            host = host,
            options = { source_filetype = "python" },
        })
        return
    end

    -- 优先用 mason 安装的 debugpy，找不到就交给 PATH
    local mason_python = vim.fn.stdpath("data")
        .. "/mason/packages/debugpy/venv/Scripts/pythonw.exe"
    local pythonw = vim.fn.executable(mason_python) == 1 and mason_python or "python"

    cb({
        type = "executable",
        command = pythonw,
        args = { "-m", "debugpy.adapter" },
        options = { source_filetype = "python" },
    })
end

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
            local cwd = vim.fn.getcwd()
            for _, p in ipairs({ "/venv/bin/python", "/.venv/bin/python",
                                 "/venv/Scripts/python.exe", "/.venv/Scripts/python.exe" }) do
                if vim.fn.executable(cwd .. p) == 1 then
                    return cwd .. p
                end
            end
            return "python"
        end,
    },
}