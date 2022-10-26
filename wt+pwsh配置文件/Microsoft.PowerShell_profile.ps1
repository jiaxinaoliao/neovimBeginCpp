& ([ScriptBlock]::Create((oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\kushal.omp.json" --print) -join "`n"))
$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding
Import-Module PSReadLine
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineKeyHandler -Chord "Ctrl+RightArrow" -Function ForwardWord
Remove-Item alias:\ls
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
        {$item | Add-Member NoteProperty name ("`e[34m" + $_.name)}
        elseif ($compressed.IsMatch($_.Name)) 
        {$item | Add-Member NoteProperty name ("`e[31m" + $_.name)}
        elseif ($executable.IsMatch($_.Name))
        {$item | Add-Member NoteProperty name ("`e[36m" + $_.name)}
        elseif ($code_files.IsMatch($_.Name))
        {$item | Add-Member NoteProperty name ("`e[33m" + $_.name)}
        else
        { $item | Add-Member NoteProperty name ("`e[37m" + $_.name)} 
        $itemList += $item}
    echo $itemList | Format-Wide -AutoSize}
function ls {Color-List "-Exclude .*"}
function la {Color-List "$args"}
function cj {cd ..}
function cl {clear}
function et {exit}
function lt {tree /f /a}
function vim {nvim}
function hpp {hexo clean && hexo generate && hexo deploy}
function hss {hexo s}
function gaa {git add .}
function gpp {git push}
