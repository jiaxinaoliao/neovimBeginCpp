& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kushal.omp.json" --print) -join "`n"))
Import-Module PSReadLine
Remove-Alias sl -Force
Remove-Alias ls -Force
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord
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
        $itemList += $item}
    echo $itemList | Format-Wide -AutoSize}
function ls {Color-List "-Exclude .*"}
function ll {Color-List "$args"}
function cl {cls}
function cj {cd ..}
function et {exit}
function lt {tree /f /a}
function vim {nvim}
function hpp {hexo clean && hexo generate && hexo deploy}
function hps {hexo clean && hexo generate && hexo deploy && hexo server}
function hss {hexo server}
function gaa {git add .}
function gpp {git push}
function top {btop}
