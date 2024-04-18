# hello.tests.ps1

Describe "Hello Tests" {
    It "Should say hello" {
        $result = "Hello, world!"
        $expected = "Hello, world!"
        $result | Should -BeExactly $expected
    }
}