local status, competitest = pcall(require, "competitest")
if not status then
  vim.notify("没有找到 competitest")
  return
end

require('competitest').setup()
