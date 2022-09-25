& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kushal.omp.json" --print) -join "`n"))

# powershell初始化加载 PSReadLine 模块
Import-Module PSReadLine
# 使用历史记录进行脚本提示
Set-PSReadLineOption -PredictionSource History
# alt在windows中有特殊用途，这里使用ctrl键代替
Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord

function cl {cls}
function vim {nvim}
function et {exit}
function lt {tree}