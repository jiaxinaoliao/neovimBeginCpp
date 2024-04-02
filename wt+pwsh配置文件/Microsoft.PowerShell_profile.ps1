$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kushal.omp.json" --print) -join "`n"))
Import-Module PSReadLine
Remove-Alias sl -Force
Remove-Alias ls -Force
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -EditMode Emacs
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord
Set-PSReadlineKeyHandler -Chord "Ctrl+e" -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('vim')
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
Set-PSReadlineKeyHandler -Chord "Ctrl+f" -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('cd "$(fzf)\.."')
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
Set-PSReadlineKeyHandler -Chord "Ctrl+w" -ScriptBlock {
  [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
  [Microsoft.PowerShell.PSConsoleReadLine]::Insert('cd E:\')
  [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}
function Color-List($str) {
    $regex_opts = ([System.Text.RegularExpressions.RegexOptions]::IgnoreCase-bor [System.Text.RegularExpressions.RegexOptions]::Compiled)
    $fore = $Host.UI.RawUI.ForegroundColor
    $compressed = New-Object System.Text.RegularExpressions.Regex('\.(zip|tar|gz|rar|jar|war|7z)$', $regex_opts)
    $executable = New-Object System.Text.RegularExpressions.Regex('\.(exe|bat|cmd|py|ps1|psm1|vbs|rb|reg|sh|zsh)$', $regex_opts)
    $code_files = New-Object System.Text.RegularExpressions.Regex('\.(ini|csv|log|xml|yml|json|java|c|cpp|css|sass|js|ts|jsx|tsx|vue)$', $regex_opts)
    $head_files = New-Object System.Text.RegularExpressions.Regex('\.(md)$', $regex_opts)
    $mark_files = New-Object System.Text.RegularExpressions.Regex('\.(h)$', $regex_opts)
    $itemList = @()
    Invoke-Expression ("Get-ChildItem" + " " + $str) | ForEach-Object {
        $item = New-Object object
        if ($_.GetType().Name -eq 'DirectoryInfo') 
        {$item | Add-Member NoteProperty name ("`e[34m" + $_.name)}
        elseif ($compressed.IsMatch($_.Name)) 
        {$item | Add-Member NoteProperty name ("`e[31m" + $_.name)}
        elseif ($executable.IsMatch($_.Name))
        {$item | Add-Member NoteProperty name ("`e[36m" + $_.name)}
        elseif ($code_files.IsMatch($_.Name))
        {$item | Add-Member NoteProperty name ("`e[33m" + $_.name)}
        elseif ($head_files.IsMatch($_.Name))
        {$item | Add-Member NoteProperty name ("`e[32m" + $_.name)}
        elseif ($mark_files.IsMatch($_.Name))
        {$item | Add-Member NoteProperty name ("`e[35m" + $_.name)}
        else
        {$item | Add-Member NoteProperty name ("`e[37m" + $_.name)} 
        $itemList += $item
    }
  echo $itemList | Format-Wide -AutoSize
}
$ENV:FZF_DEFAULT_OPTS=@"
--layout=reverse
--preview 'bat --style=numbers --color=always --line-range :500 {}'
--color=bg+:#313244,spinner:#f5e0dc,hl:#f38ba8
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8
"@
Set-Alias vim nvim
Set-Alias vi nvim
Set-Alias cc g++
Set-Alias cat lolcat
Set-Alias lc leetgo
Set-Alias touch New-Item
Set-Alias py38 "D:\CppApp\python\python"
function gvim {neovide}
function n {neofetch}
function ls {Color-List "-Exclude .*"}
function ll {Color-List "$args"}
function cl {Clear-Host}
function cj {cd ..}
function et {exit}
function lt {tree /f /a}
function hpp {(hexo clean) -and (hexo generate) -and (hexo deploy)}
function hss {hexo server}
function gaa {git add .}
function gpp {git push}
function gpg {git push --tag}
function top {btop}
function dl  {dir | lolcat}
function wyy {chcp 936 | musicfox}
function lci {leetgo init -t cn -l cpp}
function lce {leetgo edit last}
function lct {leetgo test last -L}
function lcts {leetgo test last -L -s}

function dwmon{
  komorebic start
  D:\ScoopApp\Scoop\apps\autohotkey\current\v2\AutoHotKey64.exe D:\win11meihua\komorebi.ahk2
  python python D:\win11meihua\yasb-main\src\main.py
}
function dwmoff{
  komorebic stop
  Stop-Process -Name AutoHotKey64
  Stop-Process -Name komorebic
  Stop-Process -Name pythonw
}