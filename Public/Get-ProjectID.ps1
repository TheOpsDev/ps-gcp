function Get-ProjectID {
    param (
        [Parameter(
            ParameterSetName = 'ByProjectName'
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $ProjectName,

        [Parameter(
            ParameterSetName = 'ByInstanceName'
        )]
        [ValidateNotNullOrEmpty()]
        [string]
        $ComputeInstance,

        [Parameter(
            ParameterSetName = 'Default'
        )]
        [switch]
        $Default
    )

    begin {
        $gcloud = Get-GcloudCmd

        if ($ComputeInstance) {
            Write-Host "Identifying ProjectID via provided compute instance: $ComputeInstance"
            $ComputeInstance = $ComputeInstance.ToLower()
            $envCode = $ComputeInstance.Substring(3,1)
        } elseif ($ProjectName) {
            Write-Host "Identifying ProjectID via provided project name: $ProjectName"
            $ProjectName = $ProjectName.ToLower()
        }

        $projectID = ''
    }

    process {
        if ($PSCmdlet.ParameterSetName -eq 'ByInstanceName') {
            $projectID = & $gcloud projects list --format="value(projectId)" --filter="$envCode-env-service-project"
        } elseif ($PSCmdlet.ParameterSetName -eq 'ByProjectName') {
            $projectID = & $gcloud projects list --format="value(projectId)" --filter="$ProjectName"
        } elseif ($PSCmdlet.ParameterSetName -eq 'Default') {
            $projectID = & $gcloud config get-value project
        }
    }

    end { return $projectID }
}