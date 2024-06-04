# Set the API endpoint and authentication details
$apiEndpoint = $scriptParameters.apiEndpoint
$workspaceId = $scriptParameters.workspaceId
$resourceGroupName = $scriptParameters.resourceGroupName
$subscriptionId = $scriptParameters.subscriptionId
$clientId = $scriptParameters.clientId
$clientSecret = $scriptParameters.clientSecret


$headers = @{
    "Authorization" = "Bearer $(Get-AzAccessToken -ResourceGroupName $resourceGroupName -SubscriptionId $subscriptionId -ClientId $clientId -ClientSecret $clientSecret)"
    "Content-Type" = "application/json"
}
# Create the workspace
$workspaceBody = @{
    "name" = "your-workspace-name"
    "description" = "your-workspace-description"
} | ConvertTo-Json
Invoke-WebRequest -Uri ($apiEndpoint + "/workspaces") -Method Post -Headers $headers -Body $workspaceBody

# Get the workspace ID
$workspaceResponse = Invoke-WebRequest -Uri ($apiEndpoint + "/workspaces") -Method Get -Headers $headers
$workspaceId = ($workspaceResponse.Content | ConvertFrom-Json).value[0].id

# Create the KQL database
$kqlDatabaseBody = @{
    "name" = "your-kql-database-name"
    "description" = "your-kql-database-description"
} | ConvertTo-Json
Invoke-WebRequest -Uri ($apiEndpoint + "/workspaces/$workspaceId/kqlDatabases") -Method Post -Headers $headers -Body $kqlDatabaseBody

# Create the environment
$environmentBody = @{
    "name" = "your-environment-name"
    "description" = "your-environment-description"
} | ConvertTo-Json
Invoke-WebRequest -Uri ($apiEndpoint + "/workspaces/$workspaceId/environments") -Method Post -Headers $headers -Body $environmentBody

# Create the event house
$eventHouseBody = @{
    "name" = "your-event-house-name"
    "description" = "your-event-house-description"
} | ConvertTo-Json
Invoke-WebRequest -Uri ($apiEndpoint + "/workspaces/$workspaceId/eventhouses") -Method Post -Headers $headers -Body $eventHouseBody

# Create the event stream
$eventStreamBody = @{
    "name" = "your-event-stream-name"
    "description" = "your-event-stream-description"
} | ConvertTo-Json
Invoke-WebRequest -Uri ($apiEndpoint + "/workspaces/$workspaceId/eventstreams") -Method Post -Headers $headers -Body $eventStreamBody

# Create the notebook
$notebookBody = @{
    "name" = "your-notebook-name"
    "description" = "your-notebook-description"
} | ConvertTo-Json
Invoke-WebRequest -Uri ($apiEndpoint + "/workspaces/$workspaceId/notebooks") -Method Post -Headers $headers -Body $notebookBody
