Connect-Rubrik -Server '172.17.28.19' -Username 'aaron.lewis@rubrik.demo' -Password (ConvertTo-SecureString "Rubrik123!" -asplaintext -force) -Verbose

Get-RubrikDatabase -Hostname se-alewis-win.rubrik.demo |
   Where-Object {@('master','model','msdb') -notcontains $_.name -and $_.isRelic -ne 'True' -and $_.isLiveMount -ne 'TRUE'} |
   Get-RubrikDatabase -Verbose |
   ForEach-Object {Restore-RubrikDatabase -id $_.id -FinishRecovery -verbose }