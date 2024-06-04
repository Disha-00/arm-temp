# Variables 
$workspaceName = "hello-02123"
$workspaceDescription = "testhelooo"

# Get Access Token
$body = @{
    grant_type    = "client_credentials"
    scope         = "https://api.fabric.microsoft.com/.default"
    client_id     = $clientId
    client_secret = $clientSecret
}

$tokenResponse = Invoke-RestMethod -Method Post -Uri "https://login.microsoftonline.com/$tenantId/oauth2/v2.0/token" -ContentType "application/x-www-form-urlencoded" -Body $body
$accessToken = $tokenResponse.access_token

# Create workspace
$uri = "https://api.fabric.microsoft.com/v1/workspaces"
$headers = @{
    "Authorization" = "Bearer $accessToken"
    "Content-Type"  = "application/json"
}

$workspaceBody = @{
    displayName = $workspaceName
    description = $workspaceDescription
}

$jsonBody = $workspaceBody | ConvertTo-Json

$response = Invoke-RestMethod -Method Post -Uri $uri -Headers $headers -Body $jsonBody

# Output response
$response