$PSDefaultParameterValues["Out-File:Encoding"] = "utf8"
$MaximumHistoryCount = 1000;

Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt -Theme avit
Set-Location C:\repos
