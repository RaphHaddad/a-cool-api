param (
    [Parameter(Mandatory=$true)]
    [string]
    $Api
)

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Describe "Example API ('$Api') Tests" {
    It "Should GET" {
        $result = Invoke-WebRequest -Uri "$Api/api/Cool" `
                                    -Method GET `
                                    -UseBasicParsing
        $result.Content | Should -Not -Be $null
    }

    It "Should POST" {
        $result = Invoke-WebRequest -Uri "$Api/api/Cool" `
                                    -Method POST `
                                    -UseBasicParsing
        $result.Content | Should -Not -Be $null
    }
}

Describe "Test Failure" {
    It "Should Fail" {
        $false | Should -Be $true
    }
}
