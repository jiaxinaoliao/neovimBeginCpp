# 使用utf8编码
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# 使用oh-my-posh主题
& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kushal.omp.json" --print) -join "`n"))


# 使用starship时自定义的头
# function Invoke-Starship-PreCommand {
#   $host.ui.Write("`e]0; PS> $env:USERNAME@$env:COMPUTERNAME`: $pwd `a")
#   $host.ui.Write("🚀 Hello Jia")
# }

# 使用starship主题
# Invoke-Expression (&starship init powershell)

# 设置默认打开位置
# Set-Location F:\

# powershell初始化加载 PSReadLine 模块
Import-Module PSReadLine

# 删除默认的连接（强制删除）
Remove-Alias ls -Force
Remove-Alias sl -Force

# 使用历史记录进行脚本提示
Set-PSReadLineOption -PredictionSource History

#tab菜单选择以及上下键补全以及emacs模式
Set-PSReadLineOption -EditMode Emacs
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# alt在windows中有特殊用途，这里使用ctrl键代替
Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord

# 自定义函数添加ls的颜色
function Color-List($str) {
    $regex_opts = ([System.Text.RegularExpressions.RegexOptions]::IgnoreCase-bor [System.Text.RegularExpressions.RegexOptions]::Compiled)
    $fore = $Host.UI.RawUI.ForegroundColor
    $compressed = New-Object System.Text.RegularExpressions.Regex('\.(zip|tar|gz|rar|jar|war|7z)$', $regex_opts)
    $executable = New-Object System.Text.RegularExpressions.Regex('\.(exe|bat|cmd|py|ps1|psm1|vbs|rb|reg|sh|zsh)$', $regex_opts)
    $code_files = New-Object System.Text.RegularExpressions.Regex('\.(ini|csv|log|xml|yml|json|java|c|cpp|css|sass|js|ts|jsx|tsx|vue)$', $regex_opts)
    $head_files = New-Object System.Text.RegularExpressions.Regex('\.(h)$', $regex_opts)
    $itemList = @()
    Invoke-Expression ("Get-ChildItem" + " " + $str) | ForEach-Object {
        $item = New-Object object
        if ($_.GetType().Name -eq 'DirectoryInfo') 
        {
            $item | Add-Member NoteProperty name ("`e[34m" + $_.name) # 目录名称蓝色
        }
        elseif ($compressed.IsMatch($_.Name)) 
        {
            $item | Add-Member NoteProperty name ("`e[31m" + $_.name) # 压缩文件红色
        }
        elseif ($executable.IsMatch($_.Name))
        {
            $item | Add-Member NoteProperty name ("`e[36m" + $_.name) # 可执行文件青色
        }
        elseif ($code_files.IsMatch($_.Name))
        {
            $item | Add-Member NoteProperty name ("`e[33m" + $_.name) # 代码文件黄色
        }
        elseif ($head_files.IsMatch($_.Name))
        {
            $item | Add-Member NoteProperty name ("`e[32m" + $_.name) # 头文件绿色
        }
        else
        {
            $item | Add-Member NoteProperty name ("`e[37m" + $_.name) # 其他文件默认白色
        } 
        $itemList += $item
    }
    echo $itemList | Format-Wide -AutoSize # 格式化输出
}

# fzf的主题
$ENV:FZF_DEFAULT_OPTS=@"
--layout=reverse
--preview 'bat --style=numbers --color=always --line-range :500 {}'
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
"@

# 类似软连接
Set-Alias vim nvim
Set-Alias vi nvim
Set-Alias cc g++
Set-Alias cat lolcat
Set-Alias lc leetgo
Set-Alias touch New-Item
function gvim {neovide}
function n {neofetch}
function ls {Color-List "-Exclude .*"}
function ll {Color-List "$args"}
function cl {Clear-Host}
function cj {cd ..}
function cf {cd "$(fzf)\.."}
function et {exit}
function lt {tree /f /a}
function hpp {(hexo clean) -and (hexo generate) -and (hexo deploy)}
function hss {hexo server}
function gaa {git add .}
function gpp {git push}
function gpg {git push --tag}
function top {btop}
function dl  {dir | lolcat}
function wyy {musicfox}