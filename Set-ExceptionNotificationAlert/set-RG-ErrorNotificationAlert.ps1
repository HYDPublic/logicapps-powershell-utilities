param([string] $subscriptioname, [string] $resourcegroup, [string]$emaillist)

Get-AzureRmSubscription -SubscriptionName $subscriptioname | Select-AzureRmSubscription

Find-AzureRmResource -ResourceGroupNameContains $resourcegroup -ResourceType Microsoft.Logic/workflows | ForEach-Object {

    $parameterList = @{logicappname=$_.ResourceName;location=$_.Location;resourceid=$_.ResourceId;emaillist=$emaillist}

    New-AzureRmResourceGroupDeployment -ResourceGroupName $_.ResourceGroupName -TemplateFile LogicAppsExceptionAlertCreation.json -TemplateParameterObject $parameterList
}

