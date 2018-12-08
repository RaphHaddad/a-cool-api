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
        $result.Content | Should -Not -Be $null
    }

    It "Should POST" {
        $result = Invoke-WebRequest -Uri "$Api/api/Cool" `
                                    -Method POST `
        $result.Content | Should -Not -Be $null
    }
}
