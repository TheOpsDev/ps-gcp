function Get-AuthLogins {
    [CmdletBinding()]
    param (
        # Optional
        [Parameter()]
        [switch]
        $ActiveAccountOnly
    )
    
    process {
        $gcloud = Get-GcloudCmd

        if ($ActiveAccountOnly) {
            $accounts = & $gcloud auth list --format=json --filter=status:active | ConvertFrom-Json
        } else {
            $accounts = & $gcloud auth list --format=json | ConvertFrom-Json
        }

        return $accounts
    }

}