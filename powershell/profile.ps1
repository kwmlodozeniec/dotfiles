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
function git-fetch-prune {& git fetch --prune}
New-Alias gfp git-fetch-prune
function git-branch-list {& git branch -al}
New-Alias gbl git-branch-list
function git-branch-delete {& git branch -D $args}
New-Alias gbd git-branch-delete
function git-branch-checkout {& git checkout $args}
New-Alias gbc git-branch-checkout

New-Alias vim nvim
New-Alias v vim

function clear-history {& Remove-Item (Get-PSReadlineOption).HistorySavePath}
New-Alias ch clear-history

# Disable Python venv prompt
$env:VIRTUAL_ENV_DISABLE_PROMPT = 1;

Import-Module oh-my-posh
Set-PoshPrompt -Theme Agnoster
Set-Location C:\repos
