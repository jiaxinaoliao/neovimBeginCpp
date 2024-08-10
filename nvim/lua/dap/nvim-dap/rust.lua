-- 这里要修改为你的绝对路径
local extension_path =
  "D:\\CppApp\\neovim\\nvim-data\\mason\\packages\\codelldb\\extension\\"
local codelldb_path = extension_path .. "adapter/codelldb"
local liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"

return {
  adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
}
