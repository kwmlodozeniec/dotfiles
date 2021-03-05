$PSDefaultParameterValues["Out-File:Encoding"] = "utf8"
$MaximumHistoryCount = 1000;

New-Alias ae .\env\Scripts\activate
New-Alias de deactivate
function git-short-log {& git log --pretty=oneline --abbrev-commit}
New-Alias gsl git-short-log
function git-rebase {& git rebase -i HEAD~$args}
New-Alias gr git-rebase
function git-push-force {& git push --force}
New-Alias gpf git-push-force
New-Alias vim nvim

Import-Module oh-my-posh
Set-PoshPrompt -Theme Agnoster
Set-Location C:\repos
