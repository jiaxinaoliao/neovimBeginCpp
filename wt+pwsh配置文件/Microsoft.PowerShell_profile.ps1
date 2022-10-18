& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kushal.omp.json" --print) -join "`n"))
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding

# edit $PROFILE
#function Invoke-Starship-PreCommand {
 #  $host.ui.Write("`e]0; PS> $env:USERNAME@$env:COMPUTERNAME`: $pwd `a")
  #   $host.ui.Write("🚀 Hello Jia")
#}

# Invoke-Expression (&starship init powershell)

# Set-Location F:\

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

# >>> 移除默认别名 >>>
Remove-Item alias:\ls

# >>> 自定义函数 >>>
function Color-List($str) {
    $regex_opts = ([System.Text.RegularExpressions.RegexOptions]::IgnoreCase-bor [System.Text.RegularExpressions.RegexOptions]::Compiled)
    $fore = $Host.UI.RawUI.ForegroundColor
    $compressed = New-Object System.Text.RegularExpressions.Regex('\.(zip|tar|gz|rar|jar|war|7z)$', $regex_opts)
    $executable = New-Object System.Text.RegularExpressions.Regex('\.(exe|bat|cmd|py|ps1|psm1|vbs|rb|reg|sh|zsh)$', $regex_opts)
    $code_files = New-Object System.Text.RegularExpressions.Regex('\.(ini|csv|log|xml|yml|json|java|c|cpp|css|sass|js|ts|jsx|tsx|vue)$', $regex_opts)

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
        else
        {
            $item | Add-Member NoteProperty name ("`e[37m" + $_.name) # 其他文件默认白色
        } 
        $itemList += $item
    }
    echo $itemList | Format-Wide -AutoSize # 格式化输出
}

function Get-List {
    Color-List "-Exclude .*"
}

function Get-All-List {
    Color-List "$args"
}

function Github-Add {
    git add .
}

function Github-push {
    git push
}

# >>> 重新定义别名 >>>
Set-Alias gitp Github-push
Set-Alias gita Github-add
Set-Alias ls Get-List
Set-Alias la Get-All-List