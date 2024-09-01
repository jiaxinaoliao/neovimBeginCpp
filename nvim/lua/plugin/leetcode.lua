local status, leetcode = pcall(require, "leetcode")
if not status then
  vim.notify("没有找到 leetcode")
  return
end
require('leetcode').setup ({
  -- 配置放在这里
  cn = {
    enabled = true,
  },
})
