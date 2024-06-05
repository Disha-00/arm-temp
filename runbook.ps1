param (
    $organization="devgagan"
    $project="fabrictemplate"
    $pipelineId="3"
    $pat = "ld5elvnhkzpt6lqwvk6egpdcz4zj2geqw4pm4ay6hf4m6d3cfc3q"
    $token = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(":$pat"))
)

# Construct the Azure DevOps API URL
$apiUrl = "https://dev.azure.com/$organization/$project/_apis/pipelines/$pipelineId/runs?api-version=6.0-preview.1"

# Create the authorization header
$headers = @{
    "Authorization" = "Basic $token"
    "Content-Type"  = "application/json"
}

# Trigger the pipeline
$response = Invoke-RestMethod -Method Post -Uri $apiUrl -Headers $headers -Body "{}"

# Output the response
$response
