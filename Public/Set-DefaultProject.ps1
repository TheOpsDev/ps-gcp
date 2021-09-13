function Set-DefaultProject {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [string]
        $ProjectName
    )
    
    begin {
        $gcloud = Get-GcloudCmd 
    }
    
    process {
        $projectId = Get-ProjectID -ProjectName $ProjectName
        & $gcloud config set project $projectId
    }
}