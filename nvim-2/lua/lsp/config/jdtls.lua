local common = require("lsp.common-config")

-- ⚠️ 下面是硬编码路径，请根据你实际 mason 安装位置调整
local path_sep = package.config:sub(1, 1)
local mason_pkg = vim.fn.stdpath("data") .. path_sep .. "mason" .. path_sep .. "packages"
local jdtls_server_path = mason_pkg .. path_sep .. "jdtls"

local is_windows = vim.fn.has("win32") == 1
local os_config = is_windows and "win" or "linux"
local java_cmd = "java"  -- 确保 PATH 里有 java，或改绝对路径

local launcher_pattern
if is_windows then
    launcher_pattern = jdtls_server_path .. path_sep .. "plugins" .. path_sep
        .. "org.eclipse.equinox.launcher.win32.win32.x86_64_*.jar"
else
    launcher_pattern = jdtls_server_path .. path_sep .. "plugins" .. path_sep
        .. "org.eclipse.equinox.launcher_*.jar"
end

local launcher_jar = vim.fn.glob(launcher_pattern)
if launcher_jar == "" then
    vim.notify("找不到 jdtls 启动器 jar: " .. launcher_pattern, vim.log.levels.WARN)
    return {}
end

local jvm_memory = "-Xmx" .. (vim.env.JDTLS_MEMORY or "1g")

-- workspace：用 mason 数据目录 + 项目名
local function workspace_dir()
    local project = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    return vim.fn.stdpath("data") .. path_sep .. "jdtls-workspace" .. path_sep .. project
end

return {
    capabilities = common.capabilities(),
    flags = common.flags,
    filetypes = { "java" },
    cmd = {
        java_cmd,
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-Djava.awt.headless=true",
        jvm_memory,
        "--add-modules=ALL-SYSTEM",
        "--add-modules=jdk.incubator.vector",
        "-jar", launcher_jar,
        "-configuration", jdtls_server_path .. path_sep .. "config_" .. os_config,
        "-data", workspace_dir(),
    },
    root_dir = function(fname)
        local lspconfig_util = require("lspconfig.util")
        return lspconfig_util.root_pattern(
            "pom.xml", "build.gradle", "build.gradle.kts",
            "settings.gradle", ".git", "mvnw", "gradlew"
        )(fname) or vim.fn.getcwd()
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