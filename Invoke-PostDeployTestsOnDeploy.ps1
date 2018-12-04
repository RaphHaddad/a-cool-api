param(
  [Parameter(Mandatory=$true)]
  [string]
  $Api,

  [Parameter(Mandatory=$true)]
  [string]
  $ScriptPath
)

Install-Module -Name Pester -Force -SkipPublisherCheck

Import-Module Pester

$testResults = Invoke-Pester -Script @{Path = "$ScriptPath\Invoke-PostDeployTests.ps1"; `
                                       Parameters = @{Api = $Api}} `
                             -OutputFile Test-Pester.XML -OutputFormat NUnitXML `
                             -PassThru

if ($testResults.FailedCount -gt 0) {
    Write-Error "Failed '$($TestResults.FailedCount)' tests. Release Failed."
}
