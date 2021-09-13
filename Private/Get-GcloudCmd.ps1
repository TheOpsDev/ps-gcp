function Get-GcloudCmd {
    process {
        try {
            $glcoud = Get-Command -CommandType Application -Name "gcloud.cmd" -ErrorAction Stop
    
            return $glcoud
        }
        catch {
            Write-Warning -Message "Unable to locate Google SDK tooling. Please ensure the GCP SDK is installed properly."
        }
    }
}