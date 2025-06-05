.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Trey Williams
    LinkedIn        : linkedin.com/in/cyberxwill/
    GitHub          : github.com/flyernav
    Date Created    : 2025-05-06
    Last Modified   : 2024-05-06
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 
    Tested By       : 
    Systems Tested  : 
    PowerShell Ver. : 

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\STIG-ID-WN10-AU-000500).ps1 
#>

# Set the registry path#
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Eventlog\Application"

# Create the key if it doesn't exist
if (-not (Test-Path $regPath)) {
    New-Item -Path $regPath -Force | Out-Null
}

# Set the MaxSize DWORD value to 0x8000 (32768 decimal)
New-ItemProperty -Path $regPath -Name "MaxSize" -Value 32768 -PropertyType DWord -Force
