param([string] $subscription, [string] $resourceGroup, [string]$ResourceName)

Get-AzureRmSubscription -SubscriptionName $subscription | Select-AzureRmSubscription
get-AzureRMResource -ResourceName $resourceName -ResourceGroupName $resourceGroup |ForEach-Object {Remove-AzureRMResource -ResourceId $_.ResourceId}