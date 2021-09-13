function Get-PatchJobs {
    [CmdletBinding()]
    param (
        [Parameter(
            ParameterSetName = 'ByJobName'
        )]
        [string]
        $JobName,

        [Parameter(
            ParameterSetName = 'OutputAll'
        )]
        [switch]
        $OutputAll,

        [Parameter()]
        [string]
        $ProjectID
    )
    
    begin {
        $gcloud = Get-GcloudCmd 
        if ([string]::IsNullOrEmpty($ProjectID)) {
           $ProjectID = Get-ProjectID -Default
        }
    }
    
    process {
        if ($PSCmdlet.ParameterSetName -eq 'ByJobName') {
            $patchJobs = & $gcloud compute os-config patch-jobs list --format=json --filter="$JobName" --project=$ProjectID | ConvertFrom-Json
        } elseif ($PSCmdlet.ParameterSetName -eq 'OutputAll') {
            $patchJobs = & $gcloud compute os-config patch-jobs list --format="table[box,title='$ProjectID Patch Jobs'](display_name():label=NAME, description(), state(), targeted_instances(),name.basename())" --project=$ProjectID
        }
    }
    
    end { return $patchJobs }
}