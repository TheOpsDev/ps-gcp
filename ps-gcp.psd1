@{

    RootModule        = 'ps-gcp.psm1'
    ModuleVersion     = '0.2'
    GUID              = '350e6b5b-5865-4c12-84ee-db0ca25d7f12'
    Author            = 'Chris Herrera'
    Copyright         = '(c) 2021 Chris Herrera. All rights reserved.'
    Description       = 'This module holds common functions used for Google Cloud SDK command-line utility'
    PowerShellVersion = '4.0'


    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    ScriptsToProcess = @('Validate-Install.ps1')

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @(
        'Get-AuthLogins',
        'Get-ComputeInstance',
        'Get-ProjectID',
        'Set-DefaultProject',
        'Get-PatchJobs'
    )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport = @()

    # Variables to export from this module
    VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags = @(
                'GCP',
                'Google Cloud Platform',
                'gcloud',
                'Cloud'
            )

            # A URL to the license for this module.
            # LicenseUri = ''

            # A URL to the main website for this project.
            # ProjectUri = ''

            # A URL to an icon representing this module.
            # IconUri = ''

            # ReleaseNotes of this module
            # ReleaseNotes = ''

        } # End of PSData hashtable

    } # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

