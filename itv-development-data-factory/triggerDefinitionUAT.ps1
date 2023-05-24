[CmdletBinding()]
param (
    $testArgPS
)

$triggerStartTime =[int]$testArgPS

Write-Host "Api Management Service Name: $($triggerStartTime)"

$def = @"
{
    "name": "trigger1",
    "properties": {
        "annotations": [],
        "runtimeState": "Started",
        "pipelines": [
            {
                "pipelineReference": {
                    "referenceName": "test",
                    "type": "PipelineReference"
                }
            }
        ],
        "type": "ScheduleTrigger",
        "typeProperties": {
            "recurrence": {
                "frequency": "Day",
                "interval": 1,
                "startTime": "2023-05-23T16:37:00Z",
                "timeZone": "UTC",
                "schedule": {
                    "hours": [
                        12
                    ]
                }
            }
        }
    }
}
"@


Stop-AzDataFactoryV2Trigger -ResourceGroupName "rg-devops-deploy-dev" -DataFactoryName "Target-ADF" -TriggerName "trigger1" -Force

Set-AzDataFactoryV2Trigger -ResourceGroupName "rg-devops-deploy-dev" -DataFactoryName "Target-ADF" -Name "trigger1" -DefinitionFile $def -Force

Start-AzDataFactoryV2Trigger -ResourceGroupName "rg-devops-deploy-dev" -DataFactoryName "Target-ADF" -TriggerName "trigger1" -Force
