# Cleanup Azure resources
$resourceGroups = Get-AzResourceGroup

if ((Get-AzContext).Subscription.Name -eq "Developer Subscription") {
    Write-Host "Checked for right subscription... Successful!" -ForegroundColor Green

    foreach ($resourceGroup in $resourceGroups) {
        Write-Host "Deleting resource group $($resourceGroup.ResourceGroupName)" -ForegroundColor Yellow
        Remove-AzResourceGroup -Name $resourceGroup.ResourceGroupName -Force -AsJob
    }
}
