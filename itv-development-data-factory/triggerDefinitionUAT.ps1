# [CmdletBinding()]
# param (
#     $testArgPS
# )

# $triggerStartTime =[int]$testArgPS

# Write-Host "Api Management Service Name: $($triggerStartTime)"

Stop-AzDataFactoryV2Trigger -ResourceGroupName "rg-devops-deploy-dev" -DataFactoryName "Target-ADF" -TriggerName "trigger1" -Force

Set-AzDataFactoryV2Trigger -ResourceGroupName "rg-devops-deploy-dev" -DataFactoryName "Target-ADF" -Name "trigger1" -DefinitionFile "$(System.DefaultWorkingDirectory)/_amartello-CI/drop/DefinitionFileUAT.ps1" -Force

Start-AzDataFactoryV2Trigger -ResourceGroupName "rg-devops-deploy-dev" -DataFactoryName "Target-ADF" -TriggerName "trigger1" -Force
