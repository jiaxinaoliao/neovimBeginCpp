local common = require("lsp.common-config")

-- 使用平台正确的路径分隔符
local path_sep = package.config:sub(1, 1)
local jdtls_server_path = "D:"
    .. path_sep
    .. "CppApp"
    .. path_sep
    .. "neovim"
    .. path_sep
    .. "nvim-data"
    .. path_sep
    .. "mason"
    .. path_sep
    .. "packages"
    .. path_sep
    .. "jdtls"

-- 改进 Java 路径检测
-- local java_cmd = vim.fn.exepath("java") or "java"
local java_cmd = "D:\\ScoopApp\\Scoop\\apps\\openjdk21\\current\\bin\\java.EXE"

-- 查找启动器 jar
local launcher_pattern = jdtls_server_path .. path_sep .. "plugins" .. path_sep .. "org.eclipse.equinox.launcher_*.jar"
local launcher_jar = "D:\\CppApp\\neovim\\nvim-data\\mason\\packages\\jdtls\\plugins\\org.eclipse.equinox.launcher_1.7.100.v20251111-0406.jar"
-- local launcher_jar = vim.fn.glob(launcher_pattern)
if launcher_jar == "" then
    -- 尝试使用正斜杠作为备选
    local alt_pattern = jdtls_server_path:gsub("\\", "/") .. "/plugins/org.eclipse.equinox.launcher_*.jar"
    launcher_jar = vim.fn.glob(alt_pattern)
    if launcher_jar == "" then
        vim.notify(
            "找不到 jdtls 启动器 jar，请检查路径。模式1: "
            .. launcher_pattern
            .. " 模式2: "
            .. alt_pattern,
            vim.log.levels.ERROR
        )
        return {} -- 返回空表，避免无效配置
    end
end

-- 内存配置可调整
local jvm_memory = "-Xmx" .. (vim.env.JDTLS_MEMORY or "1g")

-- 更可靠的操作系统检测
local is_windows = vim.fn.has("win32") == 1
local os_config = is_windows and "win" or "linux"

-- 在 Windows 上，Java 的 -D 参数需要特殊处理
local function java_arg(arg)
    if is_windows and arg:match("^-D") then
        -- 在 Windows 上，-D 参数需要用双引号括起来
        -- 但不要使用 shellescape，因为它会添加额外的引号
        return arg
    end
    return arg
end

local workspace_dir = vim.fn.stdpath("data")
    .. path_sep
    .. "jdtls-workspace"
    .. path_sep
    .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:gs?\\?/?"):gsub(":", "")

return {
    capabilities = common.capabilities,
    flags = common.flags,
    filetypes = { "java" },
    cmd = {
        java_cmd,
        java_arg("-Declipse.application=org.eclipse.jdt.ls.core.id1"),
        java_arg("-Dosgi.bundles.defaultStartLevel=4"),
        java_arg("-Declipse.product=org.eclipse.jdt.ls.core.product"),
        java_arg("-Dlog.protocol=true"),
        java_arg("-Dlog.level=ALL"),
        java_arg("-Djava.awt.headless=true"),
        jvm_memory,
        "--add-modules=ALL-SYSTEM",
        "--add-modules=jdk.incubator.vector",
        "-jar",
        launcher_jar,
        "-configuration",
        jdtls_server_path .. path_sep .. "config_" .. os_config,
        "-data",
        workspace_dir,
    },
    root_dir = function(fname)
        return require("lspconfig").util.root_pattern("pom.xml", "build.gradle", ".git", "mvnw", "gradlew")(fname)
            or vim.fn.getcwd()
    end,
    on_attach = function(client, bufnr)
        common.disableFormat(client, "jdtls")
        common.keyAttach(bufnr)
    end,
    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            format = { enabled = true },
        },
    },
}
