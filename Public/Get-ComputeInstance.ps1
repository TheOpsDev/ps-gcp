function Get-ComputeInstance {
    [CmdletBinding()]
    param (
        [Parameter(
            ParameterSetName = 'ComputeInstance'
        )]
        [ValidateNotNull()]
        [string]
        $ComputeInstance,

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

        if ($PSCmdlet.ParameterSetName -eq 'ComputeInstance') {
            $ComputeInstance = $ComputeInstance.ToLower()
            $results = & $gcloud compute instances list --format=json --filter=$ComputeInstance --project=$ProjectID | ConvertFrom-Json
        } elseif ($PSCmdlet.ParameterSetName -eq 'OutputAll' -or $ComputeInstance -eq '') {
            $results = & $gcloud compute instances list --format="table[box,title=Instances](name:sort=1, zone:label=zone, status, lastStartTimestamp, machineType)" --project=$ProjectID
        } 
    }

    end { return $results }
}