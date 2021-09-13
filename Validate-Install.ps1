if ($gcloud = Get-Command -CommandType Application -Name "gcloud" -ErrorAction SilentlyContinue | Where-Object {$_.Name -eq 'gcloud'}) {
    if($gcloud.Definition) {
        Write-Host "GCP Console SDK found: $($gcloud.Definition)"
    }
}